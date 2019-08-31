summon minecraft:armor_stand ~ ~-1 ~ {Tags:[sh],ArmorItems:[{},{},{},{id:"minecraft:shield",Count:1b}],Pose:{Head:[-90.0f,0.0f,0.0f]},NoGravity:1b,Invisible:1b}
data modify entity @e[tag=sh,sort=nearest,limit=1] Rotation set from entity @p Rotation
kill @e[type=item,nbt={Item:{id:"minecraft:shield"}},distance=..10,limit=1]
playsound minecraft:item.crossbow.shoot player @p