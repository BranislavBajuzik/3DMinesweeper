clear @p
execute as @e[type=armor_stand,name=Phill] at @s if block ~ ~ ~ cyan_stained_glass run function kk:fill_r

execute at @e[type=armor_stand,name=Phill] if block ~ ~ ~ brown_stained_glass run data merge block 0 48 -4 {auto:1b}
kill @e[scores={glass=0}]
execute at @e[type=armor_stand,name=Phill] run clone ~ ~ ~ ~ ~ ~ ~ ~30 ~
kill @e[type=armor_stand,name=Phill]
execute as @e[name=NewPhill] run data merge entity @s {CustomName:"\"Phill\""}

setblock -14 55 -6 clay
execute at @e[type=armor_stand,name=Phill,limit=1,sort=nearest] run setblock -14 55 -6 stone
execute at @e[type=armor_stand,name=Phill,limit=1,sort=nearest] run data merge block 0 48 -7 {auto:1b}
