#
scoreboard objectives add qr_prg dummy
scoreboard objectives add qr_code dummy
scoreboard objectives add qr_encode dummy
scoreboard objectives add qr_encode_l dummy
scoreboard objectives add qr_encode_lall dummy
scoreboard objectives add qr_decode dummy
scoreboard objectives add qr_decode_uid dummy
scoreboard objectives add qr_return dummy
scoreboard objectives add GF_1 dummy
scoreboard objectives add GF_2 dummy
scoreboard objectives add qr_xor dummy

execute unless entity @e[name=qr_main] run setblock ~~2~ minecraft:air
scoreboard players add @e[name=qr_main] qr_prg 0
execute as @e[name=qr_main,scores={qr_prg=0}] positioned ~1~~ run fill ~64~20~6 ~~~ minecraft:air
execute as @e[name=qr_main,scores={qr_prg=0}] positioned ~1~~8 run fill ~64~2~64 ~~~ minecraft:air
execute as @e[name=qr_main,scores={qr_prg=0}] run summon minecraft:armor_stand qr_decode_place ~~~2
execute as @e[name=qr_main,scores={qr_prg=0}] run summon minecraft:armor_stand qr_decode ~8~-0.5~
execute as @e[name=qr_main,scores={qr_prg=0}] run scoreboard players set @e[c=1,name=qr_decode] qr_decode_uid -1
execute as @e[name=qr_main,scores={qr_prg=0}] run scoreboard players set time qr_uid 0
execute if entity @e[name=qr_main,scores={qr_prg=0}] run function QR_new/version

#
tp @e[name=qr_main,scores={qr_prg=0}] ~5~~

scoreboard players set @e[name=qr_main,scores={qr_prg=0}] qr_encode_lall 12
execute at @e[name=qr_main,scores={qr_prg=0}] run fill ~-1~~ ~-2~~ minecraft:white_concrete
execute at @e[name=qr_main,scores={qr_prg=0}] run fill ~-3~~ ~-3~~ minecraft:black_concrete
execute at @e[name=qr_main,scores={qr_prg=0}] run fill ~-4~~ ~-4~~ minecraft:white_concrete
#
execute as @e[name=qr_decode_place] at @s run scoreboard players add @s qr_encode_l 1 
execute as @e[name=qr_decode_place] at @s run tp @s ~8~~
execute as @e[name=qr_decode_place] at @s run summon minecraft:armor_stand qr_decode ~~-0.5~
# 

execute if score mode qr_uid matches 1 run function QR/generator_7
execute if score mode qr_uid matches 2 run function QR/generator_10
execute if score mode qr_uid matches 3 run function QR/generator_15
execute if score mode qr_uid matches 4 run function QR/generator_20
execute if score mode qr_uid matches 5 run function QR/generator_26

#
execute unless entity @e[scores={qr_decode_uid=0..}] run scoreboard players set uid qr_decode_uid 0
scoreboard players add @e[name=qr_decode] qr_decode_uid 0
execute as @e[c=1,name=qr_decode,scores={qr_decode_uid=0}] run scoreboard players add uid qr_decode_uid 1
execute as @e[c=1,name=qr_decode,scores={qr_decode_uid=0}] run scoreboard players operation @s qr_decode_uid = uid qr_decode_uid

execute as @e[name=qr_decode_place] as @e[name=qr_decode,scores={qr_decode_uid=0..}] run scoreboard players operation @s qr_xor = @s GF_2

execute as @e[name=qr_decode_place] at @s run scoreboard players add @s qr_decode 1
execute as @e[name=qr_decode_place] at @s run scoreboard players operation @s qr_return = @s qr_decode
execute as @e[name=qr_decode_place] at @s run scoreboard players operation @s qr_return %= "8" NUM
execute as @e[name=qr_decode_place,scores={qr_return=0}] at @s run tp @s ~-64~1~
execute as @e[name=qr_decode_place] if score @s qr_decode = @s qr_encode run tellraw @a { "rawtext": [ { "text": "生成多项式生成完毕"}]}
execute as @e[name=qr_decode_place] if score @s qr_decode = @s qr_encode run kill @s
#
execute as @e[name=qr_main,scores={qr_prg=0}] run scoreboard players operation @s qr_encode = uid qr_uid
execute as @e[name=qr_main,scores={qr_prg=0}] run scoreboard players set @s qr_encode_l 8
execute as @e[name=qr_main,scores={qr_prg=0}] at @s run tp @s ~7~~
execute as @e[name=qr_main,scores={qr_prg=0}] at @s run summon minecraft:armor_stand qr_encode_back ~1~~
execute as @e[name=qr_main,scores={qr_prg=0}] at @s run scoreboard players set uid qr_uid 1
scoreboard players set @e[name=qr_main,scores={qr_prg=0}] qr_prg 1
execute as @e[name=qr_main,scores={qr_prg=1}] at @s run function QR/encode
#
execute as @e[name=qr_main,scores={qr_prg=2}] as @e[type=minecraft:armor_stand,scores={qr_uid=1..}] if score @s qr_uid = uid qr_uid run scoreboard players operation @e[name=qr_main,scores={qr_prg=2}] qr_encode = @s qr_encode
execute as @e[name=qr_main,scores={qr_prg=2}] run scoreboard players set @s qr_encode_l 8 
execute as @e[name=qr_main,scores={qr_prg=2}] at @s run tp @s ~7~~
execute as @e[name=qr_main,scores={qr_prg=2}] at @s run summon minecraft:armor_stand qr_encode_back ~1~~
execute as @e[name=qr_main,scores={qr_prg=2}] unless entity @e[name=qr_main_sub] run summon minecraft:armor_stand qr_main_sub ~1~~
scoreboard players set @e[name=qr_main,scores={qr_prg=2}] qr_prg 3
execute as @e[name=qr_main,scores={qr_prg=3}] at @s run function QR/encode
#

#function QR/encode_return
execute as @e[name=qr_main,scores={qr_prg=4}] at @s run scoreboard players operation @s qr_return = @s qr_encode_lall
execute as @e[name=qr_main,scores={qr_prg=4}] at @s run scoreboard players add @s qr_return -4
execute as @e[name=qr_main,scores={qr_prg=4}] at @s run scoreboard players operation @s qr_return %= "64" NUM
execute as @e[name=qr_main,scores={qr_return=0,qr_prg=4}] as @e[name=qr_main_sub] at @s run tp @s ~~1~
execute as @e[name=qr_main,scores={qr_return=0,qr_prg=4}] at @s run structure save qr_encode_p ~-1~~ ~-4~~
execute as @e[name=qr_main,scores={qr_return=0,qr_prg=4}] at @s run fill ~-1~~ ~-4~~ minecraft:air
execute as @e[name=qr_main,scores={qr_return=0,qr_prg=4}] run tp @s @e[name=qr_main_sub]
execute as @e[name=qr_main,scores={qr_return=0,qr_prg=4}] at @s run tp @s ~4~~
execute as @e[name=qr_main,scores={qr_return=0,qr_prg=4}] at @s run structure load qr_encode_p ~-4~~ 0_degrees none false true

#
execute as @e[name=qr_main,scores={qr_prg=4}] if score uid qr_uid matches 1.. as @e[type=minecraft:armor_stand,scores={qr_uid=1..}] if score @s qr_uid = uid qr_uid run kill @s
execute unless entity @e[scores={qr_uid=0..}] run scoreboard players set uid qr_uid 0
execute as @e[name=qr_main,scores={qr_prg=4}] if score uid qr_uid matches 1.. run scoreboard players add uid qr_uid 1
execute as @e[name=qr_main,scores={qr_prg=4}] if score uid qr_uid matches ..0 run scoreboard players set @s qr_prg 5 
execute as @e[name=qr_main,scores={qr_prg=4}] if score uid qr_uid matches 1.. run scoreboard players set @s qr_prg 2
#
execute as @e[name=qr_main,scores={qr_prg=5}] run scoreboard players operation @s qr_encode = @s qr_encode_lall
execute as @e[name=qr_main,scores={qr_prg=5}] run scoreboard players operation @s qr_encode %= "8" NUM
execute as @e[name=qr_main,scores={qr_prg=5}] at @s[scores={qr_encode=4}] run fill ~3~~ ~~~ minecraft:white_concrete
execute as @e[name=qr_main,scores={qr_prg=5}] at @s[scores={qr_encode=4}] run tp @s ~4~~
execute as @e[name=qr_main,scores={qr_prg=5}] at @s[scores={qr_encode=4}] run scoreboard players add @s qr_encode_lall 4

execute as @e[name=qr_main,scores={qr_prg=5..}] at @s run scoreboard players operation @s qr_return = @s qr_encode_lall
execute as @e[name=qr_main,scores={qr_prg=5..}] at @s run scoreboard players operation @s qr_return %= "64" NUM
execute as @e[name=qr_main,scores={qr_return=0,qr_prg=5..}] as @e[name=qr_main_sub] at @s run tp @s ~~1~
execute as @e[name=qr_main,scores={qr_return=0,qr_prg=5..}] run tp @s @e[name=qr_main_sub]
scoreboard players set @e[name=qr_main,scores={qr_prg=5}] qr_prg 6

#
execute as @e[name=qr_main,scores={qr_prg=6}] run scoreboard players operation @s qr_encode = @s qr_encode_lall
execute as @e[name=qr_main,scores={qr_prg=6}] run scoreboard players operation @s qr_encode /= "8" NUM
execute as @e[name=qr_main,scores={qr_prg=6}] run scoreboard players operation @s qr_encode *= "-1" NUM
execute as @e[name=qr_main,scores={qr_prg=6}] if score mode qr_uid matches 1 run scoreboard players add @s qr_encode 19
execute as @e[name=qr_main,scores={qr_prg=6}] if score mode qr_uid matches 2 run scoreboard players add @s qr_encode 34
execute as @e[name=qr_main,scores={qr_prg=6}] if score mode qr_uid matches 3 run scoreboard players add @s qr_encode 55
execute as @e[name=qr_main,scores={qr_prg=6}] if score mode qr_uid matches 4 run scoreboard players add @s qr_encode 80
execute as @e[name=qr_main,scores={qr_prg=6}] if score mode qr_uid matches 5 run scoreboard players add @s qr_encode 108
scoreboard players set @e[name=qr_main,scores={qr_prg=6}] qr_prg 7
#
scoreboard players set @e[name=qr_main,scores={qr_prg=7,qr_encode=0}] qr_code 0
execute as @e[name=qr_main,scores={qr_prg=7,qr_encode=0}] run tellraw @a { "rawtext": [ { "text": "编码完毕\n开始计算纠错码"}]}
execute as @e[name=qr_main,scores={qr_prg=7,qr_encode=0}] at @s run tp @s ~~15~
scoreboard players set @e[name=qr_main,scores={qr_prg=7,qr_encode=0}] qr_prg 8
execute as @e[name=qr_main,scores={qr_prg=7}] run scoreboard players add @s qr_code 1
execute as @e[name=qr_main,scores={qr_prg=7}] run scoreboard players set @s[scores={qr_code=3}] qr_code 1
execute as @e[name=qr_main,scores={qr_prg=7,qr_code=1}] at @s run fill ~2~~ ~~~ minecraft:black_concrete
execute as @e[name=qr_main,scores={qr_prg=7,qr_code=1}] at @s run fill ~4~~ ~5~~ minecraft:black_concrete
execute as @e[name=qr_main,scores={qr_prg=7,qr_code=1}] at @s run fill ~3~~ ~3~~ minecraft:white_concrete
execute as @e[name=qr_main,scores={qr_prg=7,qr_code=1}] at @s run fill ~6~~ ~7~~ minecraft:white_concrete

execute as @e[name=qr_main,scores={qr_prg=7,qr_code=2}] at @s run fill ~3~~ ~3~~ minecraft:black_concrete
execute as @e[name=qr_main,scores={qr_prg=7,qr_code=2}] at @s run fill ~7~~ ~7~~ minecraft:black_concrete
execute as @e[name=qr_main,scores={qr_prg=7,qr_code=2}] at @s run fill ~2~~ ~~~ minecraft:white_concrete
execute as @e[name=qr_main,scores={qr_prg=7,qr_code=2}] at @s run fill ~4~~ ~6~~ minecraft:white_concrete
execute as @e[name=qr_main,scores={qr_prg=7}] run scoreboard players add @s qr_encode -1
execute as @e[name=qr_main,scores={qr_prg=7}] run scoreboard players add @s qr_encode_lall 8
execute as @e[name=qr_main,scores={qr_prg=7}] at @s run tp @s ~8~~
#纠错码
execute as @e[name=qr_main,scores={qr_prg=8}] run kill @e[name=qr_main_sub]
execute as @e[name=qr_main,scores={qr_prg=8}] run tp @e[name=qr_decode,scores={qr_decode_uid=-1}] ~8~-0.5~
execute as @e[name=qr_main,scores={qr_prg=8}] as @e[name=qr_decode,scores={qr_decode_uid=-1}] at @s if block ~~~ minecraft:white_concrete [] if block ~-1~~ minecraft:white_concrete [] if block ~-2~~ minecraft:white_concrete [] if block ~-3~~ minecraft:white_concrete [] if block ~-4~~ minecraft:white_concrete [] if block ~-5~~ minecraft:white_concrete [] if block ~-6~~ minecraft:white_concrete [] if block ~-7~~ minecraft:white_concrete [] run scoreboard players set @e[name=qr_main,scores={qr_prg=8}] qr_prg 101

execute as @e[name=qr_main,scores={qr_prg=101}] run summon minecraft:armor_stand qr_sup ~~~
execute as @e[name=qr_main,scores={qr_prg=101}] run scoreboard players add @s GF_1 -8
execute as @e[name=qr_main,scores={qr_prg=101}] if score mode qr_uid matches 1 run scoreboard players set @s[scores={GF_1=..64}] GF_1 64
execute as @e[name=qr_main,scores={qr_prg=101}] if score mode qr_uid matches 2 run scoreboard players set @s[scores={GF_1=..88}] GF_1 88
execute as @e[name=qr_main,scores={qr_prg=101}] if score mode qr_uid matches 3 run scoreboard players set @s[scores={GF_1=..128}] GF_1 128
execute as @e[name=qr_main,scores={qr_prg=101}] if score mode qr_uid matches 4 run scoreboard players set @s[scores={GF_1=..168}] GF_1 168
execute as @e[name=qr_main,scores={qr_prg=101}] if score mode qr_uid matches 5 run scoreboard players set @s[scores={GF_1=..216}] GF_1 216
scoreboard players set @e[name=qr_main,scores={qr_prg=101}] qr_prg 102

#
#execute as @e[name=qr_main,scores={qr_prg=102}] run function QR/sup
function QR_new/sup
function QR_new/sup
function QR_new/sup
function QR_new/sup
function QR_new/sup
function QR_new/sup
function QR_new/sup
function QR_new/sup
function QR_new/sup
function QR_new/sup

#
execute as @e[name=qr_main,scores={qr_prg=8}] run kill @e[name=qr_sup]
execute as @e[name=qr_main,scores={qr_prg=8}] run fill ~1~~ ~64~~ minecraft:white_concrete [] replace minecraft:air []
execute as @e[name=qr_main,scores={qr_prg=8}] if score mode qr_uid matches 2 run fill ~1~1~ ~24~~ minecraft:white_concrete [] replace minecraft:air []
execute as @e[name=qr_main,scores={qr_prg=8}] if score mode qr_uid matches 3 run fill ~1~1~ ~64~~ minecraft:white_concrete [] replace minecraft:air []
execute as @e[name=qr_main,scores={qr_prg=8}] if score mode qr_uid matches 4.. run fill ~1~1~ ~64~1~ minecraft:white_concrete [] replace minecraft:air []
execute as @e[name=qr_main,scores={qr_prg=8}] if score mode qr_uid matches 4 run fill ~1~2~ ~40~2~ minecraft:white_concrete [] replace minecraft:air []
execute as @e[name=qr_main,scores={qr_prg=8}] if score mode qr_uid matches 5.. run fill ~1~2~ ~64~2~ minecraft:white_concrete [] replace minecraft:air []
execute as @e[name=qr_main,scores={qr_prg=8}] if score mode qr_uid matches 5 run fill ~1~3~ ~24~3~ minecraft:white_concrete [] replace minecraft:air []

#
execute as @e[name=qr_main,scores={qr_prg=8}] as @e[name=qr_decode] at @s run function QR/decode
execute as @e[name=qr_main,scores={qr_prg=8}] as @e[name=qr_decode,scores={qr_decode_uid=-1}] run scoreboard players operation @s GF_2 = @s qr_decode
execute as @e[name=qr_main,scores={qr_prg=8}] as @e[name=qr_decode,scores={qr_decode_uid=-1}] run function QR/GF_2
execute as @e[name=qr_main,scores={qr_prg=8}] as @e[name=qr_decode,scores={qr_decode_uid=0..}] run scoreboard players operation @s GF_2 += @e[name=qr_decode,scores={qr_decode_uid=-1}] GF_1
execute as @e[name=qr_main,scores={qr_prg=8}] as @e[name=qr_decode,scores={qr_decode_uid=0..,GF_2=255..}] run scoreboard players operation @s GF_2 %= "255" NUM
scoreboard players set @e[name=qr_main,scores={qr_prg=8}] qr_prg 9
#
execute as @e[name=qr_main,scores={qr_prg=9}] as @e[name=qr_decode,scores={qr_decode_uid=0..}] run scoreboard players operation @s GF_1 = @s GF_2
execute as @e[name=qr_main,scores={qr_prg=9}] as @e[name=qr_decode,scores={qr_decode_uid=0..}] run function QR/GF_1
execute as @e[name=qr_main,scores={qr_prg=9}] as @e[name=qr_decode,scores={qr_decode_uid=0..}] at @s run summon minecraft:armor_stand qr_encode_sub ~~~
execute as @e[name=qr_main,scores={qr_prg=9}] run scoreboard players add @e[name=qr_encode_sub] qr_encode 0
execute as @e[name=qr_main,scores={qr_prg=9}] run scoreboard players set @e[name=qr_encode_sub] qr_encode_l 8
execute as @e[name=qr_main,scores={qr_prg=9}] as @e[name=qr_decode,scores={qr_decode_uid=0..}] at @s run scoreboard players operation @e[c=1,r=2,name=qr_encode_sub,scores={qr_encode=0}] qr_encode = @s GF_2
scoreboard players set @e[name=qr_main,scores={qr_prg=9}] qr_prg 10
execute if entity @e[name=qr_encode_sub] run function QR_new/encode_sub
execute if entity @e[name=qr_encode_sub] run function QR_new/encode_sub
execute if entity @e[name=qr_encode_sub] run function QR_new/encode_sub
execute if entity @e[name=qr_encode_sub] run function QR_new/encode_sub
execute if entity @e[name=qr_encode_sub] run function QR_new/encode_sub
execute if entity @e[name=qr_encode_sub] run function QR_new/encode_sub
execute if entity @e[name=qr_encode_sub] run function QR_new/encode_sub
execute if entity @e[name=qr_encode_sub] run function QR_new/encode_sub
#tellraw @a { "rawtext": [ { "score": {"name": "@e[name=qr_main]", "objective": "qr_prg" } } ] }

#
execute as @e[name=qr_main,scores={qr_prg=11}] run summon minecraft:armor_stand qr_xor ~1~~4
execute as @e[name=qr_main,scores={qr_prg=11}] run summon minecraft:armor_stand qr_xor_1 ~2~~4
execute as @e[name=qr_main,scores={qr_prg=11}] run summon minecraft:armor_stand qr_xor_1 ~0~~4
execute as @e[name=qr_main,scores={qr_prg=11}] as @e[name=qr_xor] at @s run tp @s ~~~ facing ~1~~
execute as @e[name=qr_main,scores={qr_prg=11}] as @e[name=qr_xor_1] at @s run tp @s ~~~ facing @e[name=qr_xor]
execute as @e[name=qr_main,scores={qr_prg=11}] run fill ~1~~4 ~64~20~4 minecraft:air
scoreboard players set @e[name=qr_main,scores={qr_prg=11}] qr_prg 12

#异或运算
function QR_new/xor
function QR_new/xor
function QR_new/xor
function QR_new/xor
function QR_new/xor
function QR_new/xor
function QR_new/xor
function QR_new/xor
function QR_new/xor
function QR_new/xor

#
execute as @e[name=qr_main,scores={qr_prg=13}] run kill @e[name=qr_xor]
execute as @e[name=qr_main,scores={qr_prg=13}] run kill @e[name=qr_xor_1]
execute as @e[name=qr_main,scores={qr_prg=13,qr_code=0}] run structure save qr_1 ~64~20~ ~1~~ 
execute as @e[name=qr_main,scores={qr_prg=13}] run structure save qr_2 ~64~20~4 ~1~~4 
execute as @e[name=qr_main,scores={qr_prg=13,qr_code=0}] run structure load qr_1 ~1~~6 0_degrees none false true
execute as @e[name=qr_main,scores={qr_prg=13}] run structure load qr_2 ~1~~ 0_degrees none false true
scoreboard players set @e[name=qr_main,scores={qr_prg=13}] qr_prg 14
#
execute as @e[name=qr_main,scores={qr_prg=14}] as @e[name=qr_decode,scores={qr_decode_uid=0..}] run scoreboard players operation @s GF_2 = @s qr_xor
execute as @e[name=qr_main,scores={qr_prg=14}] run scoreboard players add @s qr_code 1
execute as @e[name=qr_main,scores={qr_prg=14}] run tellraw @a { "rawtext": [ { "text": "正在计算纠错码: "},{ "score": {"name": "@s", "objective": "qr_code" } },{"text":"/" },{ "score": {"name": "@s", "objective": "qr_xor" } } ] }
execute as @e[name=qr_main,scores={qr_prg=14}] unless score @s qr_code = @s qr_xor run scoreboard players set @s qr_prg 8
execute as @e[name=qr_main,scores={qr_prg=14}] if score @s qr_code = @s qr_xor run tellraw @a { "rawtext": [ { "text": "纠错码计算完成"}]}
execute as @e[name=qr_main,scores={qr_prg=14}] if score @s qr_code = @s qr_xor run scoreboard players set @s qr_prg 15
#
execute as @e[name=qr_main,scores={qr_prg=15}] as @e[name=qr_decode,scores={qr_decode_uid=-1}] at @s if block ~~~ minecraft:white_concrete [] if block ~-1~~ minecraft:white_concrete [] if block ~-2~~ minecraft:white_concrete [] if block ~-3~~ minecraft:white_concrete [] if block ~-4~~ minecraft:white_concrete [] if block ~-5~~ minecraft:white_concrete [] if block ~-6~~ minecraft:white_concrete [] if block ~-7~~ minecraft:white_concrete [] run scoreboard players set @e[name=qr_main,scores={qr_prg=15}] qr_prg 103

execute as @e[name=qr_main,scores={qr_prg=103}] run summon minecraft:armor_stand qr_sup ~~~
execute as @e[name=qr_main,scores={qr_prg=103}] run scoreboard players add @s GF_1 -8
scoreboard players set @e[name=qr_main,scores={qr_prg=103}] qr_prg 104

#
execute as @e[name=qr_main,scores={qr_prg=104}] as @e[name=qr_sup] at @s run structure save qr_sup ~9~~ ~64~~ 
execute as @e[name=qr_main,scores={qr_prg=104}] as @e[name=qr_sup] at @s run structure load qr_sup ~1~~ 0_degrees none false true
execute as @e[name=qr_main,scores={qr_prg=104}] as @e[name=qr_sup] at @s run structure save qr_sup ~1~1~ ~8~1~ 
execute as @e[name=qr_main,scores={qr_prg=104}] as @e[name=qr_sup] at @s run structure load qr_sup ~57~~ 0_degrees none false true
execute as @e[name=qr_main,scores={qr_prg=104}] as @e[name=qr_sup] at @s run tp @s ~~1~
execute as @e[name=qr_main,scores={qr_prg=104}] as @e[name=qr_sup] at @s if block ~1~1~ minecraft:air [] run structure save qr_sup ~9~~ ~64~~
execute as @e[name=qr_main,scores={qr_prg=104}] as @e[name=qr_sup] at @s if block ~1~1~ minecraft:air [] run structure load qr_sup ~1~~ 0_degrees none false true
execute as @e[name=qr_main,scores={qr_prg=104}] as @e[name=qr_sup] at @s if block ~1~1~ minecraft:air [] run fill ~57~~ ~64~~ minecraft:air
execute as @e[name=qr_main,scores={qr_prg=104}] as @e[name=qr_sup] at @s if block ~1~1~ minecraft:air [] run scoreboard players set @e[name=qr_main,scores={qr_prg=104}] qr_prg 15

#
execute as @e[name=qr_main,scores={qr_prg=15}] run kill @e[name=qr_sup]
execute as @e[name=qr_main,scores={qr_prg=15}] run kill @e[name=qr_decode]
execute as @e[name=qr_main,scores={qr_prg=15}] run tp @s ~~0.5~
scoreboard players set @e[name=qr_main,scores={qr_prg=15}] qr_prg 16
#填充
execute as @e[name=qr_main,scores={qr_prg=16}] run kill @e[name=qr_sup]
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 1 run structure load qr_mode_1 ~1~~8 0_degrees none false true
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 2 run structure load qr_mode_2 ~1~~8 0_degrees none false true
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 3 run structure load qr_mode_3 ~1~~8 0_degrees none false true
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 4 run structure load qr_mode_4 ~1~~8 0_degrees none false true
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 5 run structure load qr_mode_5 ~1~~8 0_degrees none false true
#execute as @e[name=qr_main,scores={qr_prg=16}] run tellraw @a { "rawtext": [ { "text": "二维码框架已生成\n开始填充"}]}
execute as @e[name=qr_main,scores={qr_prg=16}] run summon minecraft:armor_stand qr_read ~1~~6
execute as @e[name=qr_main,scores={qr_prg=16}] run setblock ~~2~ minecraft:redstone_block

#By Baby_2016