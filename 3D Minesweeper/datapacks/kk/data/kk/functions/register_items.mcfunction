scoreboard players add @s glass 0
scoreboard players set @s[nbt={Item:{id:"minecraft:white_stained_glass"}}] glass 1
execute at @s[scores={glass=1}] run setblock ~ ~ ~ white_stained_glass
