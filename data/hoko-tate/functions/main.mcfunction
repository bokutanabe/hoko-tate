# 盾のクラフトによる召喚
execute at @e[type=minecraft:item,nbt={Item:{id:"minecraft:shield"}}] if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:wooden_sword"}},distance=..1] if block ~ ~-1 ~ minecraft:smithing_table run function hoko-tate:summon_shield_item

# 盾の召喚
execute at @e[type=item,nbt={Item:{id:"minecraft:shield",tag:{BlockEntityTag:{Patterns:[{Pattern:"ts",Color:0},{Pattern:"bs",Color:0},{Pattern:"bo",Color:14},{Pattern:"mr",Color:11},{Pattern:"mc",Color:0}]}}}}] run function hoko-tate:summon_shield

# 盾の角度調整
## 縦
execute at @e[tag=sh] store result score @e[tag=sh,sort=nearest,limit=1] ht-angle run data get entity @e[tag=sh,sort=nearest,limit=1] Rotation[1]
execute at @e[tag=sh] run scoreboard players add @e[tag=sh,sort=nearest,limit=1] ht-angle 90
execute at @e[tag=sh] store result entity @e[tag=sh,sort=nearest,limit=1] Pose.Head[0] float 1 run scoreboard players get @e[tag=sh,sort=nearest,limit=1] ht-angle
## 横
execute at @e[tag=sh,scores={ht-time=0..3}] run tp @e[tag=sh,sort=nearest,limit=1] ~ ~ ~ ~1 ~
execute at @e[tag=sh,scores={ht-time=4..7}] run tp @e[tag=sh,sort=nearest,limit=1] ~ ~ ~ ~-1 ~
scoreboard players add @e[tag=sh,scores={ht-time=0..7}] ht-time 1

# 盾の直進
execute at @e[tag=sh] run tp @e[tag=sh,sort=nearest,limit=1] ^ ^ ^1

# 盾の反射
## 右
execute at @e[tag=sh] unless block ^1.1 ^1 ^1 air unless block ^1.1 ^1 ^1 grass at @a if score @a[sort=nearest,limit=1] ht-id-r = @e[tag=sh,limit=1] ht-owner-r if score @a[sort=nearest,limit=1] ht-id-p = @e[tag=sh,limit=1] ht-owner-p run playsound minecraft:entity.llama.spit player @a[sort=nearest,limit=1] ~ ~ ~ 0.5
execute at @e[tag=sh] unless block ^1.1 ^1 ^1 air unless block ^1.1 ^1 ^1 grass run tp @e[tag=sh,sort=nearest,limit=1] ~ ~ ~ ~90 ~
## 左
execute at @e[tag=sh] unless block ^-1.1 ^1 ^1 air unless block ^-1.1 ^1 ^1 grass at @a if score @a[sort=nearest,limit=1] ht-id-r = @e[tag=sh,limit=1] ht-owner-r if score @a[sort=nearest,limit=1] ht-id-p = @e[tag=sh,limit=1] ht-owner-p run playsound minecraft:entity.llama.spit player @a[sort=nearest,limit=1] ~ ~ ~ 0.5
execute at @e[tag=sh] unless block ^-1.1 ^1 ^1 air unless block ^-1.1 ^1 ^1 grass run tp @e[tag=sh,sort=nearest,limit=1] ~ ~ ~ ~-90 ~
## 上
execute at @e[tag=sh] unless block ^ ^1.5 ^1 air unless block ^ ^1.5 ^1 grass run tp @e[tag=sh,sort=nearest,limit=1] ~ ~ ~ ~ ~-90
## 下
execute at @e[tag=sh] unless block ^ ^1.8 ^1 air unless block ^ ^1.8 ^1 grass run tp @e[tag=sh,sort=nearest,limit=1] ~ ~ ~ ~ ~90

# 盾の攻撃性能
execute at @e[tag=sh] if entity @e[type=!minecraft:player,type=!minecraft:item,type=!minecraft:armor_stand,distance=..2] at @a if score @a[sort=nearest,limit=1] ht-id-r = @e[tag=sh,limit=1] ht-owner-r if score @a[sort=nearest,limit=1] ht-id-p = @e[tag=sh,limit=1] ht-owner-p run playsound minecraft:entity.player.attack.knockback player @a[sort=nearest,limit=1] ~ ~ ~ 2
execute at @e[tag=sh] run effect give @e[type=!minecraft:player,type=!minecraft:item,type=!minecraft:armor_stand,distance=..2] minecraft:instant_damage 1 0
execute at @e[tag=sh] run tp @e[type=!minecraft:player,type=!minecraft:item,type=!minecraft:armor_stand,distance=..2] ^ ^3 ^

# 盾の削除処理
execute at @a if score @a[sort=nearest,limit=1] ht-id-r = @e[tag=sh,limit=1] ht-owner-r if score @a[sort=nearest,limit=1] ht-id-p = @e[tag=sh,limit=1] ht-owner-p if entity @e[tag=sh,sort=nearest,limit=1,distance=40..] run function hoko-tate:kill_shield