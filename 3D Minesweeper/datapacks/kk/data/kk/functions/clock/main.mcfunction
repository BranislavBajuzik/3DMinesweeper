# Called by
# - main as server

function kk:clock/1

scoreboard players add 6tick timer 1
execute if score 6tick timer matches 6.. run function kk:clock/6
