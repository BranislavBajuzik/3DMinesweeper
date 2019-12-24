# Called by
# - main as player

clear @a
teleport @a 0 108.0 0
scoreboard players set @a mode 3
scoreboard players set @a fillBool 0
scoreboard players set @a fakeMines 9001
kill @e[type=armor_stand,name=Phill]
kill @e[type=armor_stand,name=NewPhill]
fill -8 100 -8 8 116 8 white_wool hollow
setblock -9 68 -27 redstone_block
setblock -9 68 9 redstone_block
