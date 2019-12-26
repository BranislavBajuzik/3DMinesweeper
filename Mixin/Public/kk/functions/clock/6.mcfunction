# Called by
# - clock/main as server

scoreboard players set 6tick timer 0

execute if entity @e[type=area_effect_cloud,tag=Master,limit=1,scores={mode=..2}] as @a[gamemode=adventure,nbt=!{SelectedItem:{id:"minecraft:barrier"}}] at @s run function kk:fly

effect give @a haste 20 255 true
effect give @a night_vision 20 255 true

tag @a[gamemode=adventure] remove cheater
tellraw @a[gamemode=!adventure,scores={death=51..},tag=!cheater] {"color":"yellow","text":"TheAl_T joined the game\n","extra":[{"color":"white","text":"<"},{"color":"gold","text":"TheAl_T"},{"color":"white","text":"> You cheater! =D\n"},"TheAl_T left the game"]}
tag @a[gamemode=!adventure] add cheater
