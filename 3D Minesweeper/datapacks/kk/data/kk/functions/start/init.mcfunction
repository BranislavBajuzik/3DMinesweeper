# Called by
# - start/ez as player
# - start/medium as player
# - start/hard as player

gamemode adventure @a
clear @a
teleport @a 0 108.0 0

scoreboard players set @a kMines 0
scoreboard players set @a badMines 0
tag @a remove generated
kill @e[type=armor_stand,name=NewPhill]
kill @e[type=armor_stand,name=Phill]

function kk:generate/setup
