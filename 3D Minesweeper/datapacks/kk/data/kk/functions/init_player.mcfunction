# Called by
# - main as player

clear @s
difficulty peaceful
gamemode adventure @s

scoreboard players set @s mode -1
scoreboard players set @s flyBool 0
scoreboard players set @s boolBool 0

tag @s add items
function kk:items/give_basic

title @s title {"color":"dark_blue","text":"3D Minesweeper"}
title @s subtitle [{"color":"dark_blue","text":"By "},{"color":"gold","text":"TheAl_T"}]
# Welcome message
summon area_effect_cloud 0.5 48.5 -9.5 {Age:-100,Particle:"block air",Tags:["delay2"]}

kill @e[type=area_effect_cloud,tag=fly]
# Restart clock/6
data merge block 0 48 -13 {auto:1b}
