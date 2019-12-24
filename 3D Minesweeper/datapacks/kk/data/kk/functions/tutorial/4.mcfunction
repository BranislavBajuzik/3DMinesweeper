# Called by
# - 13 52 -1 as server

setblock -4 111 -8 magenta_wool
setblock -3 111 -8 magenta_wool

tellraw @a ["\nSame with this ",{"color":"dark_green","text":"2"},"."]

# Set tutorial clock
data merge block 15 48 -4 {Command:"teleport @a 0 108.0 0 151.5 -13"}
