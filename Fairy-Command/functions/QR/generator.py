#生成多项式
file = open('a.mcfunction','w',encoding='utf-8') 
n = int(input("NUM: "))
for i in range(n):
    a = int(input("enter the item: "))
    file.write("execute as @e[name=qr_decode_place] if score mode qr_uid matches 5 at @s[scores={qr_encode_l=%s}] run scoreboard players set @e[c=1,r=2,name=qr_decode] GF_2 %s\n" % ( i+1 , a ))
print("over")




