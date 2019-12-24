# Called by
# - flag/events as,at @e[type=armor_stand,name=Unflag]

setblock ~ ~30 ~ white_wool
tag @a remove unflag
execute if block ~ ~ ~ brown_wool run tag @a add unflag
execute as @p[tag=unflag] run scoreboard players remove @a kMines 1
execute as @p[tag=!unflag] run scoreboard players remove @a badMines 1
scoreboard players add @a fakeMines 1
setblock ~ ~ ~-18 glass
kill @s
