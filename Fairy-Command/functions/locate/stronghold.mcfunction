#查找要塞
##计分板
scoreboard objectives add lo_t dummy
scoreboard objectives add lo_a dummy
scoreboard objectives add lo_b dummy
scoreboard objectives add lo_c dummy
scoreboard objectives add lo_w1 dummy
scoreboard objectives add lo_w2 dummy
scoreboard objectives add lo_w3 dummy

##确定两线
scoreboard players add @a lo_t 0
execute as @e[name=lo_a1] at @s run tp @s ~~~
execute as @e[name=lo_a2] at @s run tp @s ~~~
execute as @e[type=eye_of_ender_signal] at @s as @p[scores={lo_t=0}] at @s run summon minecraft:armor_stand lo_a1
execute as @e[type=eye_of_ender_signal] at @s run scoreboard players add @p[scores={lo_t=0..19}] lo_t 1
execute as @e[type=eye_of_ender_signal] at @s as @p[scores={lo_t=20}] at @s as @e[name=lo_a1] at @s run tp @s ~~~ facing @e[type=minecraft:eye_of_ender_signal]
execute as @e[type=eye_of_ender_signal] at @s as @p[scores={lo_t=20}] at @s as @e[name=lo_a1] at @s run summon minecraft:armor_stand lo_a2 ^ ^ ^10
execute as @e[type=eye_of_ender_signal] at @s as @p[scores={lo_t=20}] at @s run kill @e[type=eye_of_ender_signal]
