# Called by
# - tick.json as server

# Clocks
function kk:clock/main

# Setup
teleport @a[scores={death=..49}] 0 108.0 0 0 0
execute as @a[scores={death=50}] run function kk:init_player

# Triggers
scoreboard players enable @a trigger
execute as @a[scores={trigger=1}] run function kk:start/ez
execute as @a[scores={trigger=2}] run function kk:start/medium
execute as @a[scores={trigger=3}] run function kk:start/hard
execute as @a[scores={trigger=4}] run function kk:tutorial/init
execute as @a[scores={trigger=5}] run function kk:bonus
execute as @a[scores={trigger=6}] run function kk:tutorial/end
scoreboard players set @a trigger 0

# Shift
tag @a[scores={shift=..0}] remove shift
execute as @a[scores={shift=1..}] at @s run function kk:shift

# Fly
execute as @a[x=-6.5,y=102,z=-6.5,dx=16,dy=10,dz=16] at @s run function kk:fly_barrier

# Give items
execute as @a[scores={mode=0..},tag=items,nbt=!{SelectedItem:{id:"minecraft:written_book"}}] run function kk:items/give

# Register items
execute as @e[type=item] at @s run function kk:items/register

# Clicks
execute as @a[scores={button=1..}] at @s run function kk:flag/button
execute at @e[scores={glass=1}] run summon armor_stand ~ ~-30 ~ {Marker:1,Invisible:1,CustomName:"\"Phill\"",NoGravity:1}
scoreboard players set @a[tag=!generated] timer 0
execute at @p[tag=generated] as @e[scores={glass=1}] run function kk:click
execute at @p[tag=!generated] as @e[scores={glass=1}] run function kk:first_click

# Timer
scoreboard players add @a timer 1
scoreboard players operation @a time = @a timer
scoreboard players operation @a time /= twenty constant
title @a[scores={mode=0..2}] actionbar ["Time: ",{"score":{"objective":"time","name":"@s"}}," seconds"]

# Endgame
execute as @p[scores={badMines=..0,kMines=170..,mode=0}] run function kk:endgame
execute as @p[scores={badMines=..0,kMines=210..,mode=1}] run function kk:endgame
execute as @p[scores={badMines=..0,kMines=280..,mode=2}] run function kk:endgame

execute as @p[scores={mode=0..}] run kill @e[type=item]
