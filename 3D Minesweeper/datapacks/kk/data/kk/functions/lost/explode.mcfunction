# Called by
# - lost/1 as server
# - 2 49 -4 as server
# - 2 50 -4 as server
# - lost/2 as server

execute as @a at @s run playsound entity.generic.explode master @s
execute at @a run particle explosion_emitter ~ ~ ~ 2 2 2 1 10 force
execute at @a run particle large_smoke ~-1 ~-1 ~-1 3 3 3 0 50 force
