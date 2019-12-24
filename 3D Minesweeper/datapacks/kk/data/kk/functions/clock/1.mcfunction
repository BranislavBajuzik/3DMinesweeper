# Called by
# - clock/main as server

tag @e[type=area_effect_cloud,tag=delay2,nbt={Age:-1}] add delay2Activate
execute at @e[type=area_effect_cloud,tag=delay2Activate] run data merge block ~ ~ ~ {auto:1b}
