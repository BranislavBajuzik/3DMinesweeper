# Called by
# - 13 50 -1 as server

setblock -4 112 -8 purple_wool

tellraw @a ["\nYou can say the same about this ",{"color":"dark_green","text":"2"},"."]

# Set tutorial clock
data merge block 15 48 -4 {Command:"teleport @a 0 108.0 0 152 -24.6"}
