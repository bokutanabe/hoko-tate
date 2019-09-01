scoreboard objectives remove ht-time
scoreboard objectives remove ht-angle
scoreboard objectives remove ht-90
scoreboard objectives remove ht-rotation-x
scoreboard objectives remove ht-rotation-y

kill @e[tag=sh,sort=nearest,limit=1,distance=40..]
give @p minecraft:shield
playsound minecraft:entity.ender_dragon.flap player @p