teleport @e[type=area_effect_cloud,name=Pedro] 0.5 253.0 0.5
scoreboard players set @p mode 2
spreadplayers 0 -32 1 22 false @e[type=area_effect_cloud,name=Pedro,limit=280,sort=nearest]
scoreboard players set @p fakeMines 280
function kk:init
