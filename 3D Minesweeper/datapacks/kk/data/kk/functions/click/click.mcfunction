# Called by
# - clicks as server

clear @a
tag @a remove click

execute at @e[type=armor_stand,name=Phill] run setblock ~ ~ ~-18 air
execute at @e[type=armor_stand,name=Phill] if block ~ ~ ~ brown_wool run tag @a add click

# Lost
execute if entity @p[tag=click] run data merge block 0 48 -4 {auto:1b}

execute if entity @p[tag=!click] run function kk:fill
