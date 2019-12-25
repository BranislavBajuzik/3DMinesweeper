# Called by
# - 1 48 -1 as server
# - generate/count as server

execute as @e[tag=pig] at @s run function kk:generate/count_one

execute if entity @p[tag=stop] as @e[type=area_effect_cloud,tag=Mine] at @s run teleport ~ ~150 ~
execute if entity @p[tag=!stop] run function kk:generate/count
