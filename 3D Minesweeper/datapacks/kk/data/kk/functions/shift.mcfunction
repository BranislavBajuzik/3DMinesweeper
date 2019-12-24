# Called by
# - main as,at player[scores={shift=1..}]

execute as @s[x=-6.5,y=103,z=-6.5,dx=16,dy=11,dz=16,scores={mode=-1..},tag=!shift] run setblock ~ ~-1 ~ air
execute as @s[x=-6.5,y=103,z=-6.5,dx=16,dy=11,dz=16,scores={mode=-1..},tag=!shift] run teleport ~ ~-1 ~
tag @s add shift
scoreboard players remove @s shift 1
