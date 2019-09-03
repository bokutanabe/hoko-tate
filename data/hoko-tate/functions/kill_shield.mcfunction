kill @e[tag=sh,sort=nearest,limit=1,distance=40..]
give @p minecraft:shield{display:{Name:"\"HOKO-SHIELD\""},BlockEntityTag:{Patterns:[{Pattern:"ts",Color:0},{Pattern:"bs",Color:0},{Pattern:"bo",Color:14},{Pattern:"mr",Color:11},{Pattern:"mc",Color:0}]}} 1
playsound minecraft:entity.ender_dragon.flap player @p

execute unless entity @e[tag=sh] run scoreboard objectives remove ht-time
execute unless entity @e[tag=sh] run scoreboard objectives remove ht-angle
execute unless entity @e[tag=sh] run scoreboard objectives remove ht-90
execute unless entity @e[tag=sh] run scoreboard objectives remove ht-rotation-x
execute unless entity @e[tag=sh] run scoreboard objectives remove ht-rotation-y