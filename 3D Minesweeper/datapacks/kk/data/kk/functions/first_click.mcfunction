clear @p
setblock -14 55 -6 stone
tag @p remove click
execute at @e[type=armor_stand,name=Phill] if block ~ ~ ~ cyan_stained_glass run tag @p add click

tag @p[tag=click] add generated
execute as @p[tag=click] run setblock -14 55 -6 clay
execute as @p[tag=click] at @s run function kk:fill

execute as @p[tag=!click] run teleport @e[type=area_effect_cloud,name=Pedro] 0.5 253.0 0.5
execute as @p[scores={mode=0},tag=!click] run spreadplayers 0 -32 1.5 22 false @e[type=area_effect_cloud,name=Pedro,limit=170,sort=nearest]
execute as @p[scores={mode=1},tag=!click] run spreadplayers 0 -32 1.5 22 false @e[type=area_effect_cloud,name=Pedro,limit=210,sort=nearest]
execute as @p[scores={mode=2},tag=!click] run spreadplayers 0 -32 1.0 22 false @e[type=area_effect_cloud,name=Pedro,limit=280,sort=nearest]
execute as @p[tag=!click] run function kk:generate
execute as @p[tag=!click] run summon area_effect_cloud 15.5 48.5 -6.5 {Age:-4,Particle:"block air",Tags:["delay2"]}
