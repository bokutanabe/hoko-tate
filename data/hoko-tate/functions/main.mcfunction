# 盾の召喚
execute at @p as @p at @e[type=item,nbt={Item:{id:"minecraft:shield"}},distance=..10,limit=1] run function hoko-tate:summon_shield

# 盾の角度調整
## 縦
execute store result score @e[tag=sh,sort=nearest,limit=1] ht-angle run data get entity @e[tag=sh,sort=nearest,limit=1] Rotation[1]
scoreboard players operation @e[tag=sh,sort=nearest,limit=1] ht-angle -= @e[tag=sh,sort=nearest,limit=1] ht-90
execute store result entity @e[tag=sh,sort=nearest,limit=1] Pose.Head[0] float 1 run scoreboard players get @e[tag=sh,sort=nearest,limit=1] ht-angle
## 横
execute if entity @p[scores={ht-time=0..3}] run scoreboard players add @e[tag=sh,sort=nearest,limit=1] ht-rotation-x 1
execute if entity @p[scores={ht-time=4..7}] run scoreboard players remove @e[tag=sh,sort=nearest,limit=1] ht-rotation-x 1
execute if entity @p[scores={ht-time=0..7}] store result entity @e[tag=sh,sort=nearest,limit=1] Rotation[0] float 1 run scoreboard players get @e[tag=sh,sort=nearest,limit=1] ht-rotation-x

# 盾の直進
execute at @e[tag=sh,sort=nearest,limit=1] run tp @e[tag=sh,sort=nearest,limit=1] ^ ^ ^1

# 盾の反射
## 右
execute at @e[tag=sh,sort=nearest,limit=1] unless block ^1.1 ^ ^1 air at @p run playsound minecraft:item.shield.break player @p
execute at @e[tag=sh,sort=nearest,limit=1] unless block ^1.1 ^ ^1 air run tp @e[tag=sh,sort=nearest,limit=1] ~ ~ ~ ~90 ~
## 左
execute at @e[tag=sh,sort=nearest,limit=1] unless block ^-1.1 ^ ^1 air at @p run playsound minecraft:item.shield.break player @p
execute at @e[tag=sh,sort=nearest,limit=1] unless block ^-1.1 ^ ^1 air run tp @e[tag=sh,sort=nearest,limit=1] ~ ~ ~ ~-90 ~
## 上
execute at @e[tag=sh,sort=nearest,limit=1] unless block ^ ^-0.1 ^1 air at @p run playsound minecraft:item.shield.break player @p
execute at @e[tag=sh,sort=nearest,limit=1] unless block ^ ^-0.1 ^1 air run tp @e[tag=sh,sort=nearest,limit=1] ~ ~ ~ ~ ~-90
## 下
execute at @e[tag=sh,sort=nearest,limit=1] unless block ^ ^0.1 ^1 air at @p run playsound minecraft:item.shield.break player @p
execute at @e[tag=sh,sort=nearest,limit=1] unless block ^ ^0.1 ^1 air run tp @e[tag=sh,sort=nearest,limit=1] ~ ~ ~ ~ ~90

# 盾の削除処理
execute at @p if entity @e[tag=sh,sort=nearest,limit=1,distance=40..] run function hoko-tate:kill_shield