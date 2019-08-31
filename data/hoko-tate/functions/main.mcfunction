# 盾の召喚
execute at @p at @e[type=item,nbt={Item:{id:"minecraft:shield"}},distance=..10,limit=1] run function hoko-tate:summon_shield

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