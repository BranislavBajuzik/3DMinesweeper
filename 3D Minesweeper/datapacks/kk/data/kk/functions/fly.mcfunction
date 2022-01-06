# Called by
# - 2 48 -13

execute at @p[x=-7,y=104,z=-7,dx=15,dy=10,dz=15,gamemode=adventure,scores={mode=..2},x_rotation=75..90] run setblock ~ ~-1 ~ air
execute as @p[x=-7,y=104,z=-7,dx=15,dy=10,dz=15,gamemode=adventure,scores={mode=..2},x_rotation=75..90] at @s run teleport ~ ~-1 ~
execute as @p[x=-7,y=101,z=-7,dx=15,dy=9,dz=15,gamemode=adventure,scores={mode=..2},x_rotation=-90..-60] at @s run teleport ~ ~1 ~

execute as @p[x=-7,y=102,z=-7,dx=15,dy=10,dz=15] at @s run function kk:fly_barrier

function kk:effects
