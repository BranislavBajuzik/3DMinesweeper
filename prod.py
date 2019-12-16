import os

from time import time
from pathlib import Path
from itertools import chain
from zipfile import ZipFile


BUILD_FOLDER = Path("build")
BUILD_FOLDER.mkdir(parents=True, exist_ok=True)


class Release:
    __zip: ZipFile
    __time: float

    def __init__(self, typ):
        self.typ = typ

    def __enter__(self):
        print(f"\nAssembling {self.typ} release")
        self.__time = time()
        self.__zip = ZipFile(BUILD_FOLDER / f"3D Minesweeper{self.typ}.zip", "w", compresslevel=9)

        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.__zip.close()
        print(f" - Done in {time()-self.__time:.2f}s")

        return False

    def make_base_archive(self) -> "Release":
        for root, dirs, files in os.walk("3D Minesweeper"):
            for file in chain(files, dirs):
                self.__zip.write(Path(root, file))

        return self

    def add_assets(self) -> "Release":
        for asset in ("icon.png", "resources.zip"):
            self.__zip.write(asset, arcname=Path("3D Minesweeper", asset))

        return self

    def add_mixin(self) -> "Release":
        for root, dirs, files in os.walk(Path("Mixin", self.typ)):
            for file in chain(files, dirs):
                self.__zip.write(
                    Path(root, file), arcname=Path("3D Minesweeper", "datapacks", "kk", "data", "kk", "functions", file)
                )

        return self


def make_assets() -> None:
    with ZipFile("resources.zip", "w", compresslevel=9) as target:
        for root, dirs, files in os.walk("resources"):
            for file in chain(files, dirs):
                root = Path(root)
                target.write(root / file, arcname=Path(*root.parts[1:], file))


if __name__ == "__main__":
    print("Archiving resources")
    make_assets()

    with Release("Public") as release:
        release.make_base_archive().add_mixin().add_assets()

    with Release("Develop") as release:
        release.make_base_archive().add_mixin().add_assets()

    with Release("Realms") as release:
        release.make_base_archive().add_mixin()

    print("\nCopying resources")
    os.replace("resources.zip", BUILD_FOLDER / "resources.zip")

    print("\nAll done!")
