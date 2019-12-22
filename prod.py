import os
import shutil

from nbt import nbt
from time import time
from pathlib import Path
from zipfile import ZipFile
from itertools import chain
from typing import Generator, Tuple
from contextlib import ContextDecorator, suppress


SAVE_FOLDER = Path(os.environ["appdata"], ".minecraft", "saves")
GAME_FOLDER = Path("3D Minesweeper")
BUILD_FOLDER = Path("build")
BUILD_FOLDER.mkdir(parents=True, exist_ok=True)


def walker(path, **kwargs) -> Generator[Tuple[str, str], Path, None]:
    for root, dirs, files in os.walk(path, **kwargs):
        for file in chain(files, dirs):
            yield root, file


class timer(ContextDecorator):
    __time: float

    def __init__(self, *, message: str = "Starting"):
        self.__message = message

    def __enter__(self):
        print(self.__message)
        self.__time = time()

        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        print(f" Done in {time()-self.__time:.2f}s")

        return False


class Release:
    __zip: ZipFile

    def __init__(self, typ):
        self.typ = typ

    def __enter__(self):
        print(f" - Type: {self.typ}")
        self.__zip = ZipFile(BUILD_FOLDER / f"{GAME_FOLDER.name}{self.typ}.zip", "w", compresslevel=9)

        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.__zip.close()

        return False

    @staticmethod
    def assemble(typ: str, *, assets: bool = True) -> "Release":
        with timer(message="Assembling Release"), Release(typ) as release:
            release.__make_base_archive().__add_mixin()

            if assets:
                release.__add_assets()

        return release

    def __make_base_archive(self) -> "Release":
        print(" - Creating base archive")
        for root, file in walker(GAME_FOLDER):
            self.__zip.write(Path(root, file))

        return self

    def __add_assets(self) -> "Release":
        print(" - Adding assets")
        for asset in ("icon.png", "resources.zip"):
            self.__zip.write(asset, arcname=GAME_FOLDER / asset)

        return self

    def __add_mixin(self) -> "Release":
        print(" - Adding mixin")
        for root, file in walker(Path("Mixin", self.typ)):
            root = Path(root)
            path = root / file

            if path.is_dir():
                try:
                    self.__zip.getinfo(path)
                except KeyError:
                    continue

            self.__zip.write(path, arcname=Path(GAME_FOLDER, "datapacks", "kk", "data", *root.parts[2:], file))

        return self

    @staticmethod
    @timer(message="Archiving resources")
    def make_resources() -> None:
        with ZipFile("resources.zip", "w", compresslevel=9) as target:
            for root, file in walker(Path("resources")):
                root = Path(root)
                target.write(root / file, arcname=Path(*root.parts[1:], file))

    @staticmethod
    @timer(message="Cleaning up level.dat")
    def clean_level() -> None:
        level = nbt.NBTFile(str(GAME_FOLDER / "level.dat"), "rb")

        with suppress(KeyError):
            del level["Data"]["Player"]

        level.write_file()

    @staticmethod
    @timer(message="Copying resources")
    def copy_resources(prepare: str) -> None:
        os.replace("resources.zip", BUILD_FOLDER / "resources.zip")

        shutil.rmtree(SAVE_FOLDER / GAME_FOLDER.name)

        with ZipFile(BUILD_FOLDER / f"{GAME_FOLDER.name}{prepare}.zip", "r", compresslevel=9) as zf:
            zf.extractall(SAVE_FOLDER)


@timer(message="Starting build\n")
def main():
    Release.make_resources()
    Release.clean_level()

    Release.assemble("Public")
    Release.assemble("Develop")
    Release.assemble("Realms", assets=False)

    Release.copy_resources("Develop")

    print("\nAll done!")


if __name__ == "__main__":
    main()
