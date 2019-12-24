# Called by
# - 13 57 -1 as server

tellraw @a ["\nAnother formation: ",{"color":"blue","text":"1"},"-",{"color":"dark_green","text":"2"},"-",{"color":"blue","text":"1"},"-",{"color":"dark_green","text":"2"},"... with a wall. The wall tiles closest to ",{"color":"blue","text":"1"}," are always mines."]

# Set tutorial clock
data merge block 15 48 -4 {Command:"teleport @a 0 108.0 0 -152 -27"}
