import os

from pathlib import Path
from itertools import chain
from zipfile import ZipFile


BUILD_FOLDER = Path("build")


def archive(suffix):
    BUILD_FOLDER.mkdir(parents=True, exist_ok=True)

    with ZipFile(BUILD_FOLDER / f"3D Minesweeper{suffix}.zip", "w", compresslevel=9) as target:
        for root, dirs, files in os.walk("3D Minesweeper"):
            for file in chain(files, dirs):
                target.write(Path(root, file))

        target.write(
            f"fly_barrier{suffix}.mcfunction",
            arcname=Path("3D Minesweeper", "datapacks", "kk", "data", "kk", "functions", "fly_barrier.mcfunction"),
        )


def add_assets():
    with ZipFile(BUILD_FOLDER / "3D Minesweeper.zip", "a", compresslevel=9) as target:
        for asset in ("icon.png", "resources.zip"):
            target.write(asset, arcname=Path("3D Minesweeper", asset))

        target.write(
            f"prod.mcfunction",
            arcname=Path("3D Minesweeper", "datapacks", "kk", "data", "kk", "functions", "prod.mcfunction"),
        )


def make_assets():
    with ZipFile("resources.zip", "w", compresslevel=9) as target:
        for root, dirs, files in os.walk("resources"):
            for file in chain(files, dirs):
                root = Path(root)
                target.write(root / file, arcname=Path(*root.parts[1:], file))


if __name__ == "__main__":
    print("Archiving resources")
    make_assets()

    print("Assembling public release")
    archive("")
    add_assets()

    print("Assembling Realms release")
    archive("R")
    os.replace("resources.zip", BUILD_FOLDER / "resourcesR.zip")

    print("Done!")
