# Called by
# - clicks at,as @e[type=item]

scoreboard players add @s glass 0
scoreboard players set @s[nbt={Item:{id:"minecraft:white_wool"}}] glass 1
execute if entity @s[scores={glass=1}] run setblock ~ ~ ~ white_wool

execute if entity @s[scores={glass=1}] run summon armor_stand ~ ~-30 ~ {Marker:1,Invisible:1,CustomName:"\"Phill\"",NoGravity:1}
