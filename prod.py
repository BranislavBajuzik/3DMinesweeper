import os

from itertools import chain
from zipfile import ZipFile, ZIP_BZIP2


def archive(name, excluded):
    with ZipFile(f'..{os.sep}{name}', 'w', compression=ZIP_BZIP2, compresslevel=9) as target:
        for root, dirs, files in os.walk('.'):
            for file in chain(files, dirs):
                path = os.path.join(root, file)

                if not any(path.startswith(f'.{os.sep}{f}') or path.endswith(f) for f in excluded):
                    target.write(os.path.join(root, file),
                                 arcname=f'3D Minesweeper{os.sep}{os.path.join(root, file)}')


def add_barrier(name, barrier):
    with ZipFile(f'..{os.sep}{name}', 'a', compression=ZIP_BZIP2, compresslevel=9) as target:
        target.write(barrier, arcname=os.path.join('3D Minesweeper', 'datapacks', 'kk', 'data', 'kk',
                                                   'functions', 'fly_barrier.mcfunction'))


if __name__ == '__main__':
    excluded = {'.git', '.idea', 'prod.py', 'README.md', 'LICENSE',
                'fly_barrier.mcfunction', 'fly_barrierR.mcfunction'}

    archive('3D Minesweeper.zip', excluded)
    add_barrier('3D Minesweeper.zip', 'fly_barrier.mcfunction')

    archive('3D MinesweeperR.zip', excluded | {'resources.zip', 'icon.png'})
    add_barrier('3D MinesweeperR.zip', 'fly_barrierR.mcfunction')

    with open('resources.zip', 'rb') as source:
        with open(f'..{os.sep}resourcesR.zip', 'wb') as target:
            target.write(source.read())
