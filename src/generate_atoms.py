# 粒子生成用スクリプト

import math
import os
import random

## 粒子クラス
class Atom:
    def __init__(self, x, y, z, xvel, yvel, zvel, type):
        self.x = x
        self.y = y
        self.z = z
        self.vx = xvel
        self.vy = yvel
        self.vz = zvel
        self.type = type

## 各粒子のパラメータを決定する関数
def add_ball(atoms, left_num, left_a_num, left_c_num, right_num, right_a_num, right_c_num, length):
    left_n = round((left_num/4)**(1/3))
    left_s = length/left_n
    left_h = left_s/2

    left_xvel_list = [0] * (left_num)
    left_yvel_list = [0] * (left_num)
    left_zvel_list = [0] * (left_num)
    for i in range(len(left_xvel_list)):
        random_x = random.uniform(-1, 1)
        left_xvel_list[i] = random_x
    for i in range(len(left_yvel_list)):
        random_y = random.uniform(-1, 1)
        left_yvel_list[i] = random_y
    for i in range(len(left_zvel_list)):
        random_z = random.uniform(-1, 1)
        left_zvel_list[i] = random_z
    left_xvel_list_av = sum(left_xvel_list)/len(left_xvel_list)
    left_yvel_list_av = sum(left_yvel_list)/len(left_yvel_list)
    left_zvel_list_av = sum(left_zvel_list)/len(left_zvel_list)
    left_xvel_list = list(map(lambda x: x - left_xvel_list_av, left_xvel_list))
    left_yvel_list = list(map(lambda y: y - left_yvel_list_av, left_yvel_list))
    left_zvel_list = list(map(lambda z: z - left_zvel_list_av, left_zvel_list))

    left_type_list = [2] * (left_num)
    for i in range(left_a_num):
        left_type_list[i] = 1
    for j in range(left_a_num, left_a_num+left_c_num):
        left_type_list[j] = 3
    random.shuffle(left_type_list)

    num=0
    for ix in range(left_n):
        for iy in range(left_n):
            for iz in range(left_n):
                x = ix*left_s
                y = iy*left_s
                z = iz*left_s
                atoms.append(Atom(x, y, z, left_xvel_list[num], left_yvel_list[num], left_zvel_list[num], left_type_list[num]))
                atoms.append(Atom(x+left_h, y+left_h, z, left_xvel_list[num+1], left_yvel_list[num+1], left_zvel_list[num+1], left_type_list[num+1]))
                atoms.append(Atom(x+left_h, y, z+left_h, left_xvel_list[num+2], left_yvel_list[num+2], left_zvel_list[num+2], left_type_list[num+2]))
                atoms.append(Atom(x, y+left_h, z+left_h, left_xvel_list[num+3], left_yvel_list[num+3], left_zvel_list[num+3], left_type_list[num+3]))
                num+=4
    
    right_n = round((right_num/4)**(1/3))
    right_s = length/right_n
    right_h = right_s/2
    
    right_xvel_list = [0] * (right_num)
    right_yvel_list = [0] * (right_num)
    right_zvel_list = [0] * (right_num)
    for i in range(len(right_xvel_list)):
        random_x = random.uniform(-1, 1)
        right_xvel_list[i] = random_x
    for i in range(len(right_yvel_list)):
        random_y = random.uniform(-1, 1) 
        right_yvel_list[i] = random_y
    for i in range(len(right_zvel_list)):
        random_z = random.uniform(-1, 1)
        right_zvel_list[i] = random_z
    right_xvel_list_av = sum(right_xvel_list)/len(right_xvel_list)
    right_yvel_list_av = sum(right_yvel_list)/len(right_yvel_list)
    right_zvel_list_av = sum(right_zvel_list)/len(right_zvel_list)  
    right_xvel_list = list(map(lambda x: x - right_xvel_list_av, right_xvel_list))
    right_yvel_list = list(map(lambda y: y - right_yvel_list_av, right_yvel_list))
    right_zvel_list = list(map(lambda z: z - right_zvel_list_av, right_zvel_list))

    right_type_list = [2] * (right_num)
    for i in range(right_a_num):
        right_type_list[i] = 1
    for j in range(right_a_num, right_a_num+right_c_num):
        right_type_list[j] = 3
    random.shuffle(right_type_list)

    num=0
    for ix in range(right_n):
        for iy in range(right_n):
            for iz in range(right_n):
                x = length + ix*right_s
                y = iy*right_s
                z = iz*right_s
                atoms.append(Atom(x, y, z, right_xvel_list[num], right_yvel_list[num], right_zvel_list[num], right_type_list[num]))
                atoms.append(Atom(x+right_h, y+right_h, z, right_xvel_list[num+1], right_yvel_list[num+1], right_zvel_list[num+1], right_type_list[num+1]))
                atoms.append(Atom(x+right_h, y, z+right_h, right_xvel_list[num+2], right_yvel_list[num+2], right_zvel_list[num+2], right_type_list[num+2]))
                atoms.append(Atom(x, y+right_h, z+right_h, right_xvel_list[num+3], right_yvel_list[num+3], right_zvel_list[num+3], right_type_list[num+3]))
                num+=4


## atomsファイルを作成する関数
def make_file(filename, atoms, length):
    with open(filename, "w") as f:
        f.write("Position Data\n\n")
        f.write("{} atoms\n".format(len(atoms)))
        f.write("3 atom types\n\n")
        f.write("0.0 {} xlo xhi\n".format(length*2))
        f.write("0.0 {} ylo yhi\n".format(length))
        f.write("0.0 {} zlo zhi\n".format(length))
        f.write("\n")
        f.write("Atoms\n\n")
        for i, a in enumerate(atoms):
            f.write("{} {} {} {} {}\n".format(i+1, a.type, a.x, a.y, a.z))
        f.write("\n")
        f.write("Velocities\n\n")
        for i, a in enumerate(atoms):
            f.write("{} {} {} {}\n".format(i+1, a.vx, a.vy, a.vz))


## 標準入力（paramファイル）からパラメータ取得
param_dic = {}
for l in range(5):
    a, b = input().split("=")
    param_dic[a] = b

length = int(param_dic["length"])
a_composition_ratio = float(param_dic["a_composition_ratio"])
c_density = float(param_dic["c_density"])

half_volume = length**3
left_s = round(math.pow((half_volume*0.7/4), 1/3))
right_s = round(math.pow((half_volume*0.02/4), 1/3))
left_num = left_s**3*4
right_num = right_s**3*4
total_num = left_num + right_num

atoms = []
left_c_num = round(left_num * c_density)
left_ab_num = left_num - left_c_num
left_a_num = round(left_ab_num * a_composition_ratio)
left_b_num = left_ab_num - left_a_num
right_c_num = round(right_num * c_density)
right_ab_num = right_num - right_c_num
right_a_num = round(right_ab_num * a_composition_ratio)
right_b_num = right_ab_num - right_a_num

add_ball(atoms, left_num, left_a_num, left_c_num, right_num, right_a_num, right_c_num, length)

if not os.path.exists('data/atoms'):
    os.mkdir('data/atoms')
if not os.path.exists('data/atoms/L{}CD{}'.format(length, c_density)):
    os.mkdir(('data/atoms/L{}CD{}'.format(length, c_density)))
make_file("data/atoms/L{}CD{}/lan{}-lbn{}-lcn{}-ran{}-rbn{}-rcn{}.atoms".format(length, c_density, left_a_num, left_b_num, left_c_num, right_a_num, right_b_num, right_c_num), atoms, length)
