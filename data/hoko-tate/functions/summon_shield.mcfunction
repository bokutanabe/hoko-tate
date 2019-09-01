summon minecraft:armor_stand ~ ~-1 ~ {Tags:[sh],ArmorItems:[{},{},{},{id:"minecraft:shield",Count:1b}],Pose:{Head:[-90.0f,0.0f,0.0f]},NoGravity:1b,Invisible:1b}

scoreboard objectives add ht-time minecraft.custom:minecraft.play_one_minute
scoreboard objectives add ht-angle dummy
scoreboard objectives add ht-90 dummy
scoreboard objectives add ht-rotation-x dummy
scoreboard objectives add ht-rotation-y dummy

scoreboard players set @e[tag=sh,sort=nearest,limit=1] ht-90 90
execute store result score @e[tag=sh,sort=nearest,limit=1] ht-rotation-x run data get entity @p Rotation[0]
execute store result score @e[tag=sh,sort=nearest,limit=1] ht-rotation-y run data get entity @p Rotation[1]
execute store result entity @e[tag=sh,sort=nearest,limit=1] Rotation[1] float 1 run scoreboard players get @e[tag=sh,sort=nearest,limit=1] ht-rotation-y

kill @e[type=item,nbt={Item:{id:"minecraft:shield"}},distance=..10,limit=1]
playsound minecraft:item.crossbow.shoot player @p