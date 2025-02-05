execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 1 run scoreboard players set @e[name=qr_decode_place] qr_encode 8
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 1 run scoreboard players set @s qr_xor 19
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 1 run scoreboard players set @s GF_1 152
execute at @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 1 run tellraw @a { "rawtext": [ { "text": "开始生成(版本: 1,字符数量: "},{ "score": {"name": "uid", "objective": "qr_uid" } },{"text":")\n开始生成生成多项式(7位纠错码)\n开始编码" } ] }

execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 2 run scoreboard players set @e[name=qr_decode_place] qr_encode 11
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 2 run scoreboard players set @s qr_xor 34
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 2 run scoreboard players set @s GF_1 272
execute at @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 2 run tellraw @a { "rawtext": [ { "text": "开始生成(版本: 2,字符数量: "},{ "score": {"name": "uid", "objective": "qr_uid" } },{"text":")\n开始生成生成多项式(10位纠错码)\n开始编码" } ] }

execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 3 run scoreboard players set @e[name=qr_decode_place] qr_encode 16
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 3 run scoreboard players set @s qr_xor 55
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 3 run scoreboard players set @s GF_1 440
execute at @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 3 run tellraw @a { "rawtext": [ { "text": "开始生成(版本: 3,字符数量: "},{ "score": {"name": "uid", "objective": "qr_uid" } },{"text":")\n开始生成生成多项式(15位纠错码)\n开始编码" } ] }

execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 4 run scoreboard players set @e[name=qr_decode_place] qr_encode 21
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 4 run scoreboard players set @s qr_xor 80
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 4 run scoreboard players set @s GF_1 640
execute at @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 4 run tellraw @a { "rawtext": [ { "text": "开始生成(版本: 4,字符数量: "},{ "score": {"name": "uid", "objective": "qr_uid" } },{"text":")\n开始生成生成多项式(20位纠错码)\n开始编码" } ] }

execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 5 run scoreboard players set @e[name=qr_decode_place] qr_encode 27
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 5 run scoreboard players set @s qr_xor 108
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 5 run scoreboard players set @s GF_1 864
execute at @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 5 run tellraw @a { "rawtext": [ { "text": "开始生成(版本: 5,字符数量: "},{ "score": {"name": "uid", "objective": "qr_uid" } },{"text":")\n开始生成生成多项式(26位纠错码)\n开始编码" } ] }

execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 6 run scoreboard players set @e[name=qr_decode_place] qr_encode 19
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 6 run scoreboard players set @s qr_xor 68
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 6 run scoreboard players set @s GF_1 864
execute at @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 6 run tellraw @a { "rawtext": [ { "text": "开始生成(版本: 6,字符数量: "},{ "score": {"name": "uid", "objective": "qr_uid" } },{"text":")\n开始生成生成多项式(26位纠错码)\n开始编码" } ] }

execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 7 run scoreboard players set @e[name=qr_decode_place] qr_encode 21
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 7 run scoreboard players set @s qr_xor 78
execute as @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 7 run scoreboard players set @s GF_1 864
execute at @e[name=qr_main,scores={qr_prg=0}] if score mode qr_uid matches 7 run tellraw @a { "rawtext": [ { "text": "开始生成(版本: 7,字符数量: "},{ "score": {"name": "uid", "objective": "qr_uid" } },{"text":")\n开始生成生成多项式(26位纠错码)\n开始编码" } ] }

