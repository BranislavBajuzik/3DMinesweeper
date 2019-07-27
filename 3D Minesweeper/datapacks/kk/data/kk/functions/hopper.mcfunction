clone ~-5 ~-4 ~-5 ~5 ~6 ~5 ~-5 ~14 ~-5 filtered hopper
fill -7 119 7 7 133 -7 air destroy
tag @p add generated
execute as @e[type=item] at @s run function kk:events
fill ~-5 ~-4 ~-5 ~5 ~6 ~5 air replace hopper
scoreboard players set @p hopper 0
