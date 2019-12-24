# Called by
# - flag/button as,at @e[type=item] positioned ~ ~-18 ~

# Flag
execute if block ~ ~ ~ stone_button[face=wall,facing=south] if block ~ ~ ~-1 white_wool run summon armor_stand ~ ~-30 ~-1 {Invisible:1,Marker:1,CustomName:"\"Flag\"",NoGravity:1}
execute if block ~ ~ ~ stone_button[face=wall,facing=west] if block ~1 ~ ~ white_wool run summon armor_stand ~1 ~-30 ~ {Invisible:1,Marker:1,CustomName:"\"Flag\"",NoGravity:1}
execute if block ~ ~ ~ stone_button[face=wall,facing=north] if block ~ ~ ~1 white_wool run summon armor_stand ~ ~-30 ~1 {Invisible:1,Marker:1,CustomName:"\"Flag\"",NoGravity:1}
execute if block ~ ~ ~ stone_button[face=wall,facing=east] if block ~-1 ~ ~ white_wool run summon armor_stand ~-1 ~-30 ~ {Invisible:1,Marker:1,CustomName:"\"Flag\"",NoGravity:1}
execute if block ~ ~ ~ stone_button[face=ceiling] if block ~ ~1 ~ white_wool run summon armor_stand ~ ~-29 ~ {Invisible:1,Marker:1,CustomName:"\"Flag\"",NoGravity:1}
execute if block ~ ~ ~ stone_button[face=floor] if block ~ ~-1 ~ white_wool run summon armor_stand ~ ~-31 ~ {Invisible:1,Marker:1,CustomName:"\"Flag\"",NoGravity:1}

# Unflag
execute if block ~ ~ ~ stone_button[face=wall,facing=south] if block ~ ~ ~-1 purple_wool run summon armor_stand ~ ~-30 ~-1 {Invisible:1,Marker:1,CustomName:"\"Unflag\"",NoGravity:1}
execute if block ~ ~ ~ stone_button[face=wall,facing=west] if block ~1 ~ ~ purple_wool run summon armor_stand ~1 ~-30 ~ {Invisible:1,Marker:1,CustomName:"\"Unflag\"",NoGravity:1}
execute if block ~ ~ ~ stone_button[face=wall,facing=north] if block ~ ~ ~1 purple_wool run summon armor_stand ~ ~-30 ~1 {Invisible:1,Marker:1,CustomName:"\"Unflag\"",NoGravity:1}
execute if block ~ ~ ~ stone_button[face=wall,facing=east] if block ~-1 ~ ~ purple_wool run summon armor_stand ~-1 ~-30 ~ {Invisible:1,Marker:1,CustomName:"\"Unflag\"",NoGravity:1}
execute if block ~ ~ ~ stone_button[face=ceiling] if block ~ ~1 ~ purple_wool run summon armor_stand ~ ~-29 ~ {Invisible:1,Marker:1,CustomName:"\"Unflag\"",NoGravity:1}
execute if block ~ ~ ~ stone_button[face=floor] if block ~ ~-1 ~ purple_wool run summon armor_stand ~ ~-31 ~ {Invisible:1,Marker:1,CustomName:"\"Unflag\"",NoGravity:1}

# Execute the events
execute as @e[type=armor_stand,name=Flag] at @s run function kk:flag/place
execute as @e[type=armor_stand,name=Unflag] at @s run function kk:flag/remove
