# Called by
# - 13 53 -1 as server

clone 37 103 -8 35 106 -6 -8 111 -8

tellraw @a ["\nThe numbers work cross-edges as well."]

# Set tutorial clock
data merge block 15 48 -4 {Command:"teleport @a 0 108.0 0 135 -17.6"}
