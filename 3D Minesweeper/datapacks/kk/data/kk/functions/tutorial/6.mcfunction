# Called by
# - 13 54 -1 as server

fill -8 114 -6 -3 111 -8 cyan_wool
fill -7 114 -6 -3 111 -7 air
clone 35 107 -9 40 108 -11 -8 115 -8

tellraw @a ["\nThis can be tricky, especially in the corners. This tile looks like it should be a mine, but actually..."]

# Set tutorial clock
data merge block 15 48 -4 {Command:"teleport @a 0 108.0 0 135 -32.7"}
