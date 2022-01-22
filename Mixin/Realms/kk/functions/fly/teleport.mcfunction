# Called by
# - 2 48 -13

execute at @p[x=-7,y=103,z=-7,dx=15,dy=10,dz=15,gamemode=adventure,scores={mode=..2},x_rotation=75..90] run setblock ~ ~-1 ~ air
execute as @p[x=-7,y=103,z=-7,dx=15,dy=10,dz=15,gamemode=adventure,scores={mode=..2},x_rotation=75..90] at @s run teleport ~ ~-1 ~
execute as @p[x=-7,y=101,z=-7,dx=15,dy=9,dz=15,gamemode=adventure,scores={mode=..2},x_rotation=-90..-60] at @s run teleport ~ ~1 ~

function kk:fly/platform

function kk:effects
