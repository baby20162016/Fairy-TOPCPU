execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 1 run summon minecraft:armor_stand qr_fill ~1~-0.5~28
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 2 run summon minecraft:armor_stand qr_fill ~1~-0.5~32
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 3 run summon minecraft:armor_stand qr_fill ~1~-0.5~36
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 4 run summon minecraft:armor_stand qr_fill ~1~-0.5~40
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 5 run summon minecraft:armor_stand qr_fill ~1~-0.5~44

execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 1 run scoreboard players set @e[name=qr_read] qr_encode_lall 152
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 1 run scoreboard players set @e[name=qr_read] qr_xor 56
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 2 run scoreboard players set @e[name=qr_read] qr_encode_lall 272
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 2 run scoreboard players set @e[name=qr_read] qr_xor 80
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 3 run scoreboard players set @e[name=qr_read] qr_encode_lall 440
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 3 run scoreboard players set @e[name=qr_read] qr_xor 120
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 4 run scoreboard players set @e[name=qr_read] qr_encode_lall 640
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 4 run scoreboard players set @e[name=qr_read] qr_xor 160
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 5 run scoreboard players set @e[name=qr_read] qr_encode_lall 864
execute as @e[name=qr_main,scores={qr_prg=16}] if score mode qr_uid matches 5 run scoreboard players set @e[name=qr_read] qr_xor 208

execute as @e[name=qr_main,scores={qr_prg=16}] run scoreboard players set @a qr_decode 0
scoreboard players add @e[name=qr_read] qr_code 0

execute as @e[name=qr_main,scores={qr_prg=16}] run scoreboard players set @e[name=qr_fill] qr_prg 1
scoreboard players set @e[name=qr_main,scores={qr_prg=16}] qr_prg 17
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read] at @s if block ~~~ minecraft:white_concrete [] at @e[name=qr_fill] run setblock ~~~ minecraft:white_concrete []
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read] at @s if block ~~~ minecraft:black_concrete [] at @e[name=qr_fill] run setblock ~~~ minecraft:black_concrete []

execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read] at @s run tp @s ~1~~
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read] at @s run scoreboard players add @s qr_encode 1

execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read,scores={qr_code=0}] run scoreboard players operation @s qr_return = @s qr_encode
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read,scores={qr_code=0}] run scoreboard players operation @s qr_return %= "64" NUM
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read,scores={qr_code=0,qr_return=0}] at @s run tp @s ~-64~1~
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read,scores={qr_code=2,qr_encode=64}] run tp @s ~1~1~
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read,scores={qr_code=2,qr_encode=128}] run tp @s ~1~2~
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read,scores={qr_code=2,qr_encode=192}] run tp @s ~1~3~

execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read] if score @s qr_encode = @s qr_encode_lall run scoreboard players add @s qr_code 1
execute if score mode qr_uid matches 1 as @e[name=qr_read,scores={qr_code=2..,qr_encode=56}] run kill @s
execute if score mode qr_uid matches 2 as @e[name=qr_read,scores={qr_code=2..,qr_encode=80}] run kill @s
execute if score mode qr_uid matches 3 as @e[name=qr_read,scores={qr_code=2..,qr_encode=120}] run kill @s
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read,scores={qr_code=1}] run tp @s ~1~~
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read,scores={qr_code=1}] run scoreboard players set @s qr_encode 0
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read,scores={qr_code=1}] run scoreboard players operation @s qr_encode_lall = @s qr_xor
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_read,scores={qr_code=1}] run scoreboard players set @s qr_code 2

execute as @e[name=qr_fill] run scoreboard players set @e[name=qr_fill] qr_code 0
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill] run scoreboard players add @a qr_decode 1
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill] at @s if block ~~1~ minecraft:red_wool [] run scoreboard players set @s qr_code 1 
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill] at @s if block ~~1~ minecraft:blue_wool [] run scoreboard players set @s qr_code 2
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill] at @s if block ~~1~ minecraft:black_wool [] run scoreboard players set @s qr_code 3 
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill] at @s if block ~~1~ minecraft:green_wool [] run scoreboard players set @s qr_code 4 
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill] at @s if block ~~1~ minecraft:pink_wool [] run scoreboard players set @s qr_code 5 
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill] at @s if block ~~1~ minecraft:yellow_wool [] run scoreboard players set @s qr_code 6 
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill] at @s if block ~~1~ minecraft:purple_wool [] run scoreboard players set @s qr_code 7
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill] at @s if block ~~1~ minecraft:bedrock [] run scoreboard players set @s qr_code 8 
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill] at @s if block ~~1~ minecraft:orange_wool [] run scoreboard players set @s qr_code 9
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill] at @s if block ~~1~ minecraft:light_blue_wool [] run scoreboard players set @s qr_code 10

execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=0}] at @s run tp @s ~~~-1
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=1..}] at @s run setblock ~~1~ minecraft:air
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=1}] at @s run tp @s ~1~~1
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=2}] at @s run tp @s ~-1~~1
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=3}] at @s run tp @s ~1~~
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=4}] at @s run tp @s ~2~~1
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=5}] at @s run tp @s ~-2~~1
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=6}] at @s run tp @s ~8~~-1
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=7}] at @s run tp @s ~~~-2
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=9}] at @s run tp @s ~6~~1
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=10}] at @s run tp @s ~-6~~1
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=8}] at @s run tellraw @a { "rawtext": [ { "text": "填充完毕\n与掩码图案进行异或运算"}]}
execute as @e[name=qr_main,scores={qr_prg=17}] as @e[name=qr_fill,scores={qr_code=8}] at @s run scoreboard players set @e[name=qr_main,scores={qr_prg=17}] qr_prg 18
execute as @e[name=qr_fill,scores={qr_code=8}] at @s run kill @s
#
execute if score mode qr_uid matches 1..3 as @e[name=qr_main,scores={qr_prg=18}] positioned ~1~~8 run structure save qr_4 ~28~~28 ~~~ 
execute if score mode qr_uid matches 4..6 as @e[name=qr_main,scores={qr_prg=18}] positioned ~1~~8 run structure save qr_4 ~40~~40 ~~~ 

execute if score mode qr_uid matches 1..3 as @e[name=qr_main,scores={qr_prg=18}] positioned ~1~~40 run structure load qr_4 ~~~
execute if score mode qr_uid matches 4..6 as @e[name=qr_main,scores={qr_prg=18}] positioned ~1~~52 run structure load qr_4 ~~~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~1~~72 run structure load qr_4 ~~~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~33~~8 run structure load qr_4 ~~~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~33~~40 run structure load qr_4 ~~~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~33~~72 run structure load qr_4 ~~~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~65~~8 run structure load qr_4 ~~~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~65~~40 run structure load qr_4 ~~~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~65~~72 run structure load qr_4 ~~~

execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 1 positioned ~1~~40 run structure load qr_ym1_0 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 1 positioned ~1~~72 run structure load qr_ym1_1 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 1 positioned ~33~~8 run structure load qr_ym1_2 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 1 positioned ~33~~40 run structure load qr_ym1_3 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 1 positioned ~33~~72 run structure load qr_ym1_4 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 1 positioned ~65~~8 run structure load qr_ym1_5 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 1 positioned ~65~~40 run structure load qr_ym1_6 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 1 positioned ~65~~72 run structure load qr_ym1_7 ~~1~

execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 2 positioned ~1~~40 run structure load qr_ym2_0 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 2 positioned ~1~~72 run structure load qr_ym2_1 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 2 positioned ~33~~8 run structure load qr_ym2_2 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 2 positioned ~33~~40 run structure load qr_ym2_3 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 2 positioned ~33~~72 run structure load qr_ym2_4 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 2 positioned ~65~~8 run structure load qr_ym2_5 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 2 positioned ~65~~40 run structure load qr_ym2_6 ~~1~
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 2 positioned ~65~~72 run structure load qr_ym2_7 ~~1~

execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 3 positioned ~1~~40 run structure load qr_ym3_0 ~~1~ 0_degrees none false true
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 4 positioned ~1~~52 run structure load qr_ym4_0 ~~1~ 0_degrees none false true
execute as @e[name=qr_main,scores={qr_prg=18}] if score mode qr_uid matches 5 positioned ~1~~52 run structure load qr_ym5_0 ~~1~ 0_degrees none false true

execute if score mode qr_uid matches 1..3 as @e[name=qr_main,scores={qr_prg=18}] positioned ~1~~40 run summon minecraft:armor_stand qr_ym ~~-0.5~
execute if score mode qr_uid matches 4..6 as @e[name=qr_main,scores={qr_prg=18}] positioned ~1~~52 run summon minecraft:armor_stand qr_ym ~~-0.5~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~1~~72 run summon minecraft:armor_stand qr_ym ~~-0.5~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~33~~8 run summon minecraft:armor_stand qr_ym ~~-0.5~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~33~~40 run summon minecraft:armor_stand qr_ym ~~-0.5~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~33~~72 run summon minecraft:armor_stand qr_ym ~~-0.5~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~65~~8 run summon minecraft:armor_stand qr_ym ~~-0.5~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~65~~40 run summon minecraft:armor_stand qr_ym ~~-0.5~
execute if score mode qr_uid matches 1..2 as @e[name=qr_main,scores={qr_prg=18}] positioned ~65~~72 run summon minecraft:armor_stand qr_ym ~~-0.5~

scoreboard players set @e[name=qr_main,scores={qr_prg=18}] qr_prg 19
#
execute if score mode qr_uid matches 1..3 as @e[name=qr_main,scores={qr_prg=19}] run scoreboard players set @e[name=qr_ym] GF_1 29
execute if score mode qr_uid matches 4..6 as @e[name=qr_main,scores={qr_prg=19}] run scoreboard players set @e[name=qr_ym] GF_1 41
execute as @e[name=qr_main,scores={qr_prg=19}] as @e[name=qr_ym] at @s run function QR/ym
