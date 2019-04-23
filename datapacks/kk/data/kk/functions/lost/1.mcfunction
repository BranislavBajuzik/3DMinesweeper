clear @p
scoreboard players set @p mode -1
execute at @e[x=0.5,y=225,z=0.5,distance=..40] if block ~ ~-150 ~ brown_stained_glass if block ~ ~-120 ~ purple_stained_glass run setblock ~ ~-120 ~ blue_stained_glass
execute at @e[x=0.5,y=225,z=0.5,distance=..40] if block ~ ~-150 ~ brown_stained_glass if block ~ ~-120 ~ white_stained_glass run setblock ~ ~-120 ~ brown_stained_glass
function kk:lost/explode
