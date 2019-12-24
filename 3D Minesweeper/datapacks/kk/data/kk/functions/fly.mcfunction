# Called by
# - clock/6 as,at player

execute as @s[x=-6,y=104,z=-6,dx=15,dy=10,dz=15,x_rotation=75..90] run setblock ~ ~-1 ~ air
execute as @s[x=-6,y=104,z=-6,dx=15,dy=10,dz=15,x_rotation=75..90] run teleport ~ ~-1 ~
execute as @s[x=-6,y=101,z=-6,dx=15,dy=9,dz=15,x_rotation=-90..-60] run teleport ~ ~1 ~
