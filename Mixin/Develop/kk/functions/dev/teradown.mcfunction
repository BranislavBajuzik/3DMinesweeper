scoreboard players reset TheAl_T fakeMines
scoreboard objectives setdisplay sidebar fakeMines
gamemode adventure TheAl_T
teleport TheAl_T 0 108.0 0 0 0
clear TheAl_T
fill 8 86 8 -8 70 -26 air
fill -8 100 -8 8 116 8 white_wool hollow
kill @e[type=armor_stand]
gamerule reducedDebugInfo true
gamerule sendCommandFeedback false
kill TheAl_T

execute as @e[type=area_effect_cloud] run data merge entity @s {Duration:2147483647}
scoreboard players set @e[type=area_effect_cloud,tag=Master,limit=1] mode -1
