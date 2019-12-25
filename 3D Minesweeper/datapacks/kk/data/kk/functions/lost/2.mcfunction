# Called by
# - 1 51 -4 as server

title @a title {"color":"dark_red","text":"You lost!"}
title @a[scores={kMines=..0}] subtitle {"color":"dark_red","text":"You have found ","extra":[{"color":"dark_blue","text":"0"}," mines"]}
title @a[scores={kMines=1}] subtitle {"color":"dark_red","text":"You have found ","extra":[{"color":"dark_blue","score":{"objective":"kMines","name":"@p"}}," mine"]}
title @a[scores={kMines=2..}] subtitle {"color":"dark_red","text":"You have found ","extra":[{"color":"dark_blue","score":{"objective":"kMines","name":"@p"}}," mines"]}
function kk:lost/explode

execute as @a run function kk:items/give_basic
