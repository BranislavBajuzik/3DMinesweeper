# Called by
# - clicks as server
# - 14 48 -7 as server

clear @a
tag @a remove items
tag @a remove click
execute at @e[type=armor_stand,name=Phill] if block ~ ~ ~ cyan_wool run tag @a add click

tag @a[tag=click] add generated
execute if entity @p[tag=click] run tag @a add items
execute if entity @p[tag=click] run function kk:fill

execute if entity @p[tag=!click] run teleport @e[type=area_effect_cloud,tag=Mine] 0.5 253.0 0.5
execute if entity @p[scores={mode=0},tag=!click] run spreadplayers 0 -72 1.5 22 false @e[type=area_effect_cloud,tag=Mine,limit=170,sort=nearest]
execute if entity @p[scores={mode=1},tag=!click] run spreadplayers 0 -72 1.5 22 false @e[type=area_effect_cloud,tag=Mine,limit=210,sort=nearest]
execute if entity @p[scores={mode=2},tag=!click] run spreadplayers 0 -72 1.0 22 false @e[type=area_effect_cloud,tag=Mine,limit=280,sort=nearest]
execute as @p[tag=!click] run function kk:generate/setup
# kk:click/first_click
execute if entity @p[tag=!click] run summon area_effect_cloud 15.5 48.5 -6.5 {Age:-3,Particle:"block air",Tags:["delay2"]}
