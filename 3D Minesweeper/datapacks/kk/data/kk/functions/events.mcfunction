# Flag
execute positioned ~ ~-18 ~ if block ~ ~ ~ hopper[facing=north] if block ~ ~ ~-1 white_stained_glass run summon armor_stand ~ ~-30 ~-1 {Invisible:1,Marker:1,CustomName:"\"Flag\"",NoGravity:1}
execute positioned ~ ~-18 ~ if block ~ ~ ~ hopper[facing=east] if block ~1 ~ ~ white_stained_glass run summon armor_stand ~1 ~-30 ~ {Invisible:1,Marker:1,CustomName:"\"Flag\"",NoGravity:1}
execute positioned ~ ~-18 ~ if block ~ ~ ~ hopper[facing=south] if block ~ ~ ~1 white_stained_glass run summon armor_stand ~ ~-30 ~1 {Invisible:1,Marker:1,CustomName:"\"Flag\"",NoGravity:1}
execute positioned ~ ~-18 ~ if block ~ ~ ~ hopper[facing=west] if block ~-1 ~ ~ white_stained_glass run summon armor_stand ~-1 ~-30 ~ {Invisible:1,Marker:1,CustomName:"\"Flag\"",NoGravity:1}
execute positioned ~ ~-18 ~ if block ~ ~ ~ hopper[facing=down] if block ~ ~1 ~ white_stained_glass run summon armor_stand ~ ~-29 ~ {Invisible:1,Marker:1,CustomName:"\"Flag\"",NoGravity:1}
execute positioned ~ ~-18 ~ if block ~ ~ ~ hopper[facing=down] if block ~ ~-1 ~ white_stained_glass run summon armor_stand ~ ~-31 ~ {Invisible:1,Marker:1,CustomName:"\"Flag\"",NoGravity:1}

# Unflag
execute positioned ~ ~-18 ~ if block ~ ~ ~ hopper[facing=north] if block ~ ~ ~-1 purple_stained_glass run summon armor_stand ~ ~-30 ~-1 {Invisible:1,Marker:1,CustomName:"\"Unflag\"",NoGravity:1}
execute positioned ~ ~-18 ~ if block ~ ~ ~ hopper[facing=east] if block ~1 ~ ~ purple_stained_glass run summon armor_stand ~1 ~-30 ~ {Invisible:1,Marker:1,CustomName:"\"Unflag\"",NoGravity:1}
execute positioned ~ ~-18 ~ if block ~ ~ ~ hopper[facing=south] if block ~ ~ ~1 purple_stained_glass run summon armor_stand ~ ~-30 ~1 {Invisible:1,Marker:1,CustomName:"\"Unflag\"",NoGravity:1}
execute positioned ~ ~-18 ~ if block ~ ~ ~ hopper[facing=west] if block ~-1 ~ ~ purple_stained_glass run summon armor_stand ~-1 ~-30 ~ {Invisible:1,Marker:1,CustomName:"\"Unflag\"",NoGravity:1}
execute positioned ~ ~-18 ~ if block ~ ~ ~ hopper[facing=down] if block ~ ~1 ~ purple_stained_glass run summon armor_stand ~ ~-29 ~ {Invisible:1,Marker:1,CustomName:"\"Unflag\"",NoGravity:1}
execute positioned ~ ~-18 ~ if block ~ ~ ~ hopper[facing=down] if block ~ ~-1 ~ purple_stained_glass run summon armor_stand ~ ~-31 ~ {Invisible:1,Marker:1,CustomName:"\"Unflag\"",NoGravity:1}

# Execute the events
execute as @e[type=armor_stand,name=Flag] run function kk:flag
execute as @e[type=armor_stand,name=Unflag] run function kk:unflag
