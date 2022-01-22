from __future__ import annotations

import os
import shutil
from contextlib import ContextDecorator
from itertools import chain
from pathlib import Path
from time import time
from types import TracebackType
from typing import Generator, Optional, Tuple, Type
from zipfile import ZipFile

from nbt import nbt  # type: ignore

SAVE_FOLDER = Path(os.environ.get("appdata", "~"), ".minecraft", "saves").expanduser()
GAME_FOLDER = Path("3D Minesweeper")
BUILD_FOLDER = Path("build")
shutil.rmtree(BUILD_FOLDER, ignore_errors=True)
BUILD_FOLDER.mkdir(parents=True)


def walker(path: Path) -> Generator[Tuple[Path, Path], Path, None]:
    for root, dirs, files in os.walk(path):
        for file in chain(files, dirs):
            yield Path(root), Path(file)


class timer(ContextDecorator):
    __time: float

    def __init__(self, *, message: str = "Starting"):
        self.__message = message

    def __enter__(self) -> timer:
        print(self.__message)
        self.__time = time()

        return self

    def __exit__(
        self, exc_type: Optional[Type[BaseException]], exc_val: Optional[BaseException], exc_tb: Optional[TracebackType]
    ) -> None:
        print(f" Done in {time()-self.__time:.2f}s")


class Release:
    _zip: ZipFile

    PUBLIC = "Public"
    DEVELOP = "Develop"
    REALMS = "Realms"

    def __init__(self, typ: str):
        self.typ = typ

    def __enter__(self) -> Release:
        print(f" - Type: {self.typ}")
        self._zip = ZipFile(BUILD_FOLDER / f"{GAME_FOLDER.name}{self.typ}.zip", "w", compresslevel=9)

        return self

    def __exit__(
        self, exc_type: Optional[Type[BaseException]], exc_val: Optional[BaseException], exc_tb: Optional[TracebackType]
    ) -> None:
        self._zip.close()

    @staticmethod
    def assemble(typ: str, *, assets: bool = True) -> Release:
        with timer(message="Assembling Release"), Release(typ) as release:
            release._make_base_archive()

            if assets:
                release._add_assets()

        return release

    def _make_base_archive(self) -> Release:
        print(" - Creating base archive")

        mixin_files = self._add_mixin()

        for root, file in walker(GAME_FOLDER):
            if (target := root / file) not in mixin_files:
                self._zip.write(target)

        return self

    def _add_assets(self) -> Release:
        print(" - Adding assets")
        for asset in ("icon.png", "resources.zip"):
            self._zip.write(asset, arcname=GAME_FOLDER / asset)

        return self

    def _add_mixin(self) -> set[Path]:
        print(" - Adding mixin")
        mixin_files = set()

        for root, file in walker(Path("Mixin", self.typ)):
            path = root / file

            if path.is_dir():
                try:
                    self._zip.getinfo(str(path))
                except KeyError:
                    continue

            archive_path = Path(GAME_FOLDER, "datapacks", "kk", "data", *root.parts[2:], file)
            mixin_files.add(archive_path)
            self._zip.write(path, arcname=archive_path)

        return mixin_files

    @staticmethod
    @timer(message="Archiving resources")
    def make_resources() -> None:
        with ZipFile("resources.zip", "w", compresslevel=9) as target:
            for root, file in walker(Path("resources")):
                target.write(root / file, arcname=Path(*root.parts[1:], file))

    @staticmethod
    @timer(message="Cleaning up level.dat")
    def clean_level() -> None:
        level = nbt.NBTFile(str(GAME_FOLDER / "level.dat"), "rb")

        if "Player" in level["Data"]:
            del level["Data"]["Player"]

            level.write_file()

    @staticmethod
    @timer(message="Copying resources")
    def copy_resources(typ: str) -> None:
        print(f" - Type: {typ}")
        os.replace("resources.zip", BUILD_FOLDER / "resources.zip")

        target_path = SAVE_FOLDER / GAME_FOLDER.name
        if target_path.is_dir():
            shutil.rmtree(target_path)

        with ZipFile(BUILD_FOLDER / f"{GAME_FOLDER.name}{typ}.zip", "r", compresslevel=9) as zf:
            zf.extractall(SAVE_FOLDER)


@timer(message="Starting build\n")
def main() -> None:
    Release.make_resources()
    Release.clean_level()

    Release.assemble(Release.DEVELOP)
    Release.assemble(Release.PUBLIC)
    Release.assemble(Release.REALMS, assets=False)

    Release.copy_resources(Release.DEVELOP)

    print("\nTotal:")


if __name__ == "__main__":
    main()
