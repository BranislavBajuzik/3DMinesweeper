# Called by
# - clock/main as server

scoreboard players set 6tick timer 0

execute if entity @e[type=area_effect_cloud,tag=Master,limit=1,scores={mode=..2}] as @a[gamemode=adventure,nbt=!{SelectedItem:{id:"minecraft:barrier"}}] at @s run function kk:fly

effect give @a haste 20 255 true
effect give @a night_vision 20 255 true
