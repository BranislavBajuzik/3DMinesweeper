# Called by
# - click as server
# - 1 48 -7 as server
# - first_click as server


clear @a
execute as @e[type=armor_stand,name=Phill] at @s if block ~ ~ ~ cyan_wool run function kk:fill_r

# Lost
execute at @e[type=armor_stand,name=Phill] if block ~ ~ ~ brown_wool run data merge block 0 48 -4 {auto:1b}

kill @e[scores={glass=0}]
execute at @e[type=armor_stand,name=Phill] run clone ~ ~ ~ ~ ~ ~ ~ ~30 ~

kill @e[type=armor_stand,name=Phill]
execute as @e[type=armor_stand,name=NewPhill] run data merge entity @s {CustomName:"\"Phill\""}

tag @a add items
execute if entity @e[type=armor_stand,name=Phill] run tag @a remove items
# kk:fill
execute if entity @e[type=armor_stand,name=Phill] run data merge block 0 48 -7 {auto:1b}
