# Called by
# - main as player

clear @a
scoreboard players set @e[type=area_effect_cloud,tag=Master,limit=1] mode -1
execute at @a run playsound minecraft:entity.player.levelup master @s

execute as @a run scoreboard players operation @s lastTime = @s time
title @a subtitle {"color":"dark_green","text":"You have found all ","extra":[{"color":"gold","score":{"objective":"kMines","name":"@s"}}," mines in ",{"color":"gold","score":{"objective":"lastTime","name":"@s"}}," seconds"]}
title @a title {"color":"dark_green","text":"You won!"}

function kk:text/highscores
tellraw @a [{"color":"gray","text":"You can view your last score ("},{"color":"gold","score":{"objective":"lastTime","name":"@s"}},{"color":"gray","text":") by pressing tab.\n"},"If you have a better score (and a video proof), feel free to send me a ",{"hoverEvent":{"action":"show_text","value":"Click!"},"text":"message","clickEvent":{"action":"open_url","value":"http://www.planetminecraft.com/project/3d-minesweeper-in-minecraft-3298593/"},"underlined":"true","color":"blue"}," and your name will be here."]

execute as @a run function kk:items/give_basic
