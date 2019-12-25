# Called by
# - main as server

# Right-click
execute as @a[scores={button=1..}] at @s run function kk:flag/button

# Register items
execute as @e[type=item] at @s run function kk:click/register_items

# Left-click
scoreboard players set @a[tag=!generated] timer 0
execute if entity @p[tag=generated] if entity @e[scores={glass=1}] run function kk:click/click
execute if entity @p[tag=!generated] if entity @e[scores={glass=1}] run function kk:click/first_click
