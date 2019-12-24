# Called by
# - main as player
# - tutorial/10 as server

clear @a
scoreboard players set @a fakeMines 0
scoreboard objectives setdisplay sidebar fakeMines
effect clear @a invisibility

kill @e[type=area_effect_cloud,tag=tutorial]
# Turn off tutorial clock
data merge block 15 48 -4 {auto:0b}
execute as @a run function kk:items/give_basic
