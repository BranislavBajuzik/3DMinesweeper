import os

from itertools import chain
from zipfile import ZipFile, ZIP_BZIP2


BUILD_FOLDER = f"build{os.sep}"


def archive(suffix):
    os.makedirs(BUILD_FOLDER, exist_ok=True)

    with ZipFile(f"{BUILD_FOLDER}3D Minesweeper{suffix}.zip", "w", compresslevel=9) as target:
        for root, dirs, files in os.walk("3D Minesweeper"):
            for file in chain(files, dirs):
                target.write(os.path.join(root, file))

        target.write(
            f"fly_barrier{suffix}.mcfunction",
            arcname=os.path.join(
                "3D Minesweeper", "datapacks", "kk", "data", "kk", "functions", "fly_barrier.mcfunction"
            ),
        )


def add_assets():
    with ZipFile(f"{BUILD_FOLDER}3D Minesweeper.zip", "a", compresslevel=9) as target:
        for asset in ("icon.png", "resources.zip"):
            target.write(asset, arcname=os.path.join("3D Minesweeper", asset))


if __name__ == "__main__":
    archive("")
    add_assets()

    archive("R")

    with open("resources.zip", "rb") as source:
        with open(f"{BUILD_FOLDER}resourcesR.zip", "wb") as target:
            target.write(source.read())
