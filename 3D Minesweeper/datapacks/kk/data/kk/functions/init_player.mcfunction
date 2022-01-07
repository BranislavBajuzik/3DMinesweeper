# Called by
# - main

# Cleanup player
clear @p
difficulty peaceful
gamemode adventure @a

# Regenerate entities
function kk:summon_entities

# Scoreboards
scoreboard players set @p mode -1
scoreboard players set @p flyBool 0
scoreboard players set @p boolBool 0

# Items
tag @p add items
function kk:items/give_basic

# Game title
title @p title {"color":"dark_blue","text":"3D Minesweeper"}
title @p subtitle [{"color":"dark_blue","text":"By "},{"color":"gold","text":"TheAl_T"}]

# Welcome message
summon area_effect_cloud 0.5 48.5 -9.5 {Age:-10,Particle:"block air",Tags:["delay2"]}
