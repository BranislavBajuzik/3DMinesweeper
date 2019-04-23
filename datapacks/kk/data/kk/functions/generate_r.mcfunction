execute as @e[tag=pig] at @s positioned ~-2 ~-1 ~-2 store result score @s pigSearch if entity @e[dx=3,dy=2,dz=3,type=area_effect_cloud,name=Pedro]

execute at @e[scores={pigSearch=1},tag=pig] if block ~ ~ ~ cyan_stained_glass run setblock ~ ~ ~ orange_stained_glass
execute at @e[scores={pigSearch=2},tag=pig] if block ~ ~ ~ cyan_stained_glass run setblock ~ ~ ~ magenta_stained_glass
execute at @e[scores={pigSearch=3},tag=pig] if block ~ ~ ~ cyan_stained_glass run setblock ~ ~ ~ light_blue_stained_glass
execute at @e[scores={pigSearch=4},tag=pig] if block ~ ~ ~ cyan_stained_glass run setblock ~ ~ ~ yellow_stained_glass
execute at @e[scores={pigSearch=5},tag=pig] if block ~ ~ ~ cyan_stained_glass run setblock ~ ~ ~ lime_stained_glass
execute at @e[scores={pigSearch=6},tag=pig] if block ~ ~ ~ cyan_stained_glass run setblock ~ ~ ~ pink_stained_glass
execute at @e[scores={pigSearch=7},tag=pig] if block ~ ~ ~ cyan_stained_glass run setblock ~ ~ ~ gray_stained_glass
execute at @e[scores={pigSearch=8},tag=pig] if block ~ ~ ~ cyan_stained_glass run setblock ~ ~ ~ light_gray_stained_glass

execute as @e[tag=pig] at @s if block ~ ~1 ~ glass run tag @p add stop

execute as @e[name=Carl,tag=pig] at @s run teleport ~1 ~ ~
execute as @e[name=Bob,tag=pig] at @s run teleport ~ ~1 ~

execute as @p[tag=!stop] at @s run function kk:generate_r
