# Called by
# - generate/count as,at @e[tag=pig]

execute at @s positioned ~-2 ~-1 ~-2 store result score @s pigSearch if entity @e[dx=3,dy=2,dz=3,type=area_effect_cloud,tag=Mine]

execute if entity @s[scores={pigSearch=1}] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ orange_wool
execute if entity @s[scores={pigSearch=2}] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ magenta_wool
execute if entity @s[scores={pigSearch=3}] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ light_blue_wool
execute if entity @s[scores={pigSearch=4}] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ yellow_wool
execute if entity @s[scores={pigSearch=5}] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ lime_wool
execute if entity @s[scores={pigSearch=6}] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ pink_wool
execute if entity @s[scores={pigSearch=7}] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ gray_wool
execute if entity @s[scores={pigSearch=8}] if block ~ ~ ~ cyan_wool run setblock ~ ~ ~ light_gray_wool

execute if entity @s[name=Carl] run teleport ~1 ~ ~
execute if entity @s[name=Bob] run teleport ~ ~1 ~

execute as @s if block ~ ~1 ~ glass run tag @a add stop
