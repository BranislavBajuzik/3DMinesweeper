clear @p
kill @e[type=area_effect_cloud,tag=tutorial]
scoreboard players set @p fakeMines 0
scoreboard objectives setdisplay sidebar fakeMines
data merge block 15 48 -4 {auto:0b}
function kk:give_basic_items
