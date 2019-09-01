scoreboard objectives remove ht-time
scoreboard objectives remove ht-angle
scoreboard objectives remove ht-90
scoreboard objectives remove ht-rotation-x
scoreboard objectives remove ht-rotation-y

kill @e[tag=sh,sort=nearest,limit=1,distance=40..]
give @p minecraft:shield{display:{Name:"\"HOKO-SHIELD\""},BlockEntityTag:{Patterns:[{Pattern:"ts",Color:0},{Pattern:"bs",Color:0},{Pattern:"bo",Color:14},{Pattern:"mr",Color:11},{Pattern:"mc",Color:0}]}} 1
playsound minecraft:entity.ender_dragon.flap player @p