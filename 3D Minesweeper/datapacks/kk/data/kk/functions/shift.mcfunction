# Called by
# - main as,at player[scores={shift=1..}]

execute if entity @e[type=area_effect_cloud,tag=Master,limit=1,scores={mode=-1..}] as @s[x=-6.5,y=103,z=-6.5,dx=16,dy=11,dz=16,tag=!shift] run setblock ~ ~-1 ~ air
execute if entity @e[type=area_effect_cloud,tag=Master,limit=1,scores={mode=-1..}] as @s[x=-6.5,y=103,z=-6.5,dx=16,dy=11,dz=16,tag=!shift] run teleport ~ ~-1 ~
tag @s add shift
scoreboard players remove @s shift 1
