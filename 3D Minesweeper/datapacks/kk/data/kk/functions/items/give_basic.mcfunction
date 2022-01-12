# Called by
# - init_player
# - tutorial/end
# - endgame
# - lost/2

item replace entity @p hotbar.7 with written_book{title:"[Use] -> Game Controls",author:TheAl_T,pages:["{\"color\":\"dark_blue\",\"text\":\"     Game Controls\\n\\n\\n\",\"extra\":[{\"color\":\"dark_green\",\"text\":\"           Easy\\n\\n\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger trigger set 1\"}},{\"color\":\"gold\",\"text\":\"          Normal\\n\\n\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger trigger set 2\"}},{\"color\":\"dark_red\",\"text\":\"           Hard\\n\\n\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger trigger set 3\"}},{\"color\":\"black\",\"text\":\"         Tutorial\\n\\n\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger trigger set 4\"}},{\"color\":\"white\",\"text\":\"      Secret Level\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger trigger set 5\"}}]}"]}
item replace entity @p hotbar.8 with barrier{display:{Name:"{\"text\":\"[Hold] -> Disable Look-To-Fly\",\"color\":\"white\",\"italic\":\"false\"}"}}
