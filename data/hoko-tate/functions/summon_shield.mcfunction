summon minecraft:armor_stand ~ ~-1 ~ {Tags:[sh],ArmorItems:[{},{},{},{id:"minecraft:shield",Count:1b,tag:{BlockEntityTag:{Patterns:[{Pattern:"ts",Color:0},{Pattern:"bs",Color:0},{Pattern:"bo",Color:14},{Pattern:"mr",Color:11},{Pattern:"mc",Color:0}]}}}],Pose:{Head:[90.0f,0.0f,0.0f]},NoGravity:1b,Invisible:1b}
execute store result entity @e[tag=sh,sort=nearest,limit=1] Rotation[0] float 1 run data get entity @a[distance=..10,sort=nearest,limit=1] Rotation[0]
execute store result entity @e[tag=sh,sort=nearest,limit=1] Rotation[1] float 1 run data get entity @a[distance=..10,sort=nearest,limit=1] Rotation[1]

scoreboard objectives add ht-time dummy
scoreboard objectives add ht-angle dummy
scoreboard objectives add ht-id-r dummy
scoreboard objectives add ht-id-p dummy
scoreboard objectives add ht-owner-r dummy
scoreboard objectives add ht-owner-p dummy

scoreboard players set @e[tag=sh,sort=nearest,limit=1] ht-time 0
### Rotation[0]とPos[1]でプレイヤーを識別している(NBTのownerが使えないため) ###
execute unless entity @a[scores={ht-id-r=..1000},distance=..10,sort=nearest,limit=1] store result score @a[distance=..10,sort=nearest,limit=1] ht-id-r run data get entity @a[distance=..10,sort=nearest,limit=1] Rotation[0]
execute unless entity @a[scores={ht-id-p=0..},distance=..10,sort=nearest,limit=1] store result score @a[distance=..10,sort=nearest,limit=1] ht-id-p run data get entity @a[distance=..10,sort=nearest,limit=1] Pos[1]
execute store result score @e[tag=sh,sort=nearest,limit=1] ht-owner-r run scoreboard players get @a[distance=..10,sort=nearest,limit=1] ht-id-r
execute store result score @e[tag=sh,sort=nearest,limit=1] ht-owner-p run scoreboard players get @a[distance=..10,sort=nearest,limit=1] ht-id-p

kill @e[type=item,nbt={Item:{id:"minecraft:shield"}},distance=..2,limit=1]
playsound minecraft:item.crossbow.shoot player @a[distance=..10,sort=nearest,limit=1]