# Called by
# - main as player

clear @a
teleport @a 0 108.0 0
scoreboard players set @a mode -2
scoreboard objectives setdisplay sidebar
effect give @a invisibility 69420 1 true

fill -8 100 -8 8 116 8 white_wool hollow

replaceitem entity @a hotbar.7 written_book{title:"[Use] -> Quit Tutorial",pages:["{\"color\":\"dark_blue\",\"text\":\"\\n\\n\\n\\n\\n     Quit the Tutorial\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger trigger set 6\"},\"hoverEvent\":{\"action\":\"show_text\",\"value\":\"Click!\"}}"],author:TheAl_T} 1
tellraw @a ["\n\n\n\n\n\n\nWelcome to the tutorial. I will try to explain the basics of Minesweeper to you. \n",{"color":"gray","text":"Use the book to quit the tutorial."}]

# Start tutorial
summon area_effect_cloud 15 48 -1 {Age:-120,Particle:"block air",Tags:["delay2","tutorial"]}
