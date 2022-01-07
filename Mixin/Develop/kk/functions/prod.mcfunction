scoreboard players reset @a fakeMines
scoreboard objectives setdisplay sidebar fakeMines
gamemode adventure @a
teleport @a 0 108.0 0 0 0

fill 8 86 8 -8 70 -26 air
fill -8 100 -8 8 116 8 white_wool hollow
gamerule reducedDebugInfo true
gamerule sendCommandFeedback false

clear @a
kill @e
