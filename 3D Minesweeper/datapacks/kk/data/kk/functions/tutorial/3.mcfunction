# Called by
# - 13 51 -1 as server

setblock -3 112 -8 purple_wool

tellraw @a ["\nOnce the number of flags around a number is equal to the number (like this ",{"color":"blue","text":"1"},"), you can safely click all of the surrounding tiles."]

# Set tutorial clock
data merge block 15 48 -4 {Command:"teleport @a 0 108.0 0 146 -18"}
