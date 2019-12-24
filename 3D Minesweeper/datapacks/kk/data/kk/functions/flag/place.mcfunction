# Called by
# - flag/events as,at @e[type=armor_stand,name=Flag]

setblock ~ ~30 ~ purple_wool
tag @a remove flag
execute if block ~ ~ ~ brown_wool run tag @a add flag
execute as @p[tag=flag] run scoreboard players add @a kMines 1
execute as @p[tag=!flag] run scoreboard players add @a badMines 1
scoreboard players remove @a fakeMines 1
setblock ~ ~ ~-18 air
kill @s
