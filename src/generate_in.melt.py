# dump出力用スクリプト

import math
import os

def make_file(filename, length, temperature, left_a_num, left_b_num, left_c_num, right_a_num, right_b_num, right_c_num, variable_epsilon, c_density):
    with open(filename, "w") as f:
        f.write("units lj\n")
        f.write("atom_style atomic\n")
        f.write("boundary p p p\n\n")
        f.write("read_data data/atoms/L{}CD{}/lan{}-lbn{}-lcn{}-ran{}-rbn{}-rcn{}.atoms\n\n".format(length, c_density, left_a_num, left_b_num, left_c_num, right_a_num, right_b_num, right_c_num))
        f.write("mass 1 1.0\n")
        f.write("mass 2 1.0\n")
        f.write("mass 3 1.0\n\n")
        f.write("reset_timestep  0\n")
        f.write("timestep        0.001\n\n")
        f.write("pair_style lj/cut 3.0\n")
        f.write("pair_coeff 1 1 1.0 1.0 3.0\n")
        f.write("pair_coeff 1 2 0.9 1.05 3.0\n")
        f.write("pair_coeff 2 2 1.0 1.0 3.0\n")
        f.write("pair_coeff 1 3 {} 1.0 3.0\n".format(variable_epsilon))
        f.write("pair_coeff 2 3 1.0 1.0 3.0\n")
        f.write("pair_coeff 3 3 1.0 1.0 3.0\n")
        f.write("fix 1 all nvt temp {} {} 0.01\n\n".format(temperature, temperature))
        f.write("run 6000000\n\n")
        f.write("dump id all atom 1000 ../../../../../../work/k0117/k011706/symmetric_variable_epsilon_density/data/dump.melt/L{}T{}E{}CD{}/lan{}-lbn{}-lcn{}-ran{}-rbn{}-rcn{}.dump\n\n".format(length, temperature, variable_epsilon, c_density, left_a_num, left_b_num, left_c_num, right_a_num, right_b_num, right_c_num))
        f.write("dump id 3 atom 1000 ../../../../../../work/k0117/k011706/symmetric_variable_epsilon_density/data/dump.melt/L{}T{}E{}CD{}/lan{}-lbn{}-lcn{}-ran{}-rbn{}-rcn{}-for-c.dump\n\n".format(length, temperature, variable_epsilon, c_density, left_a_num, left_b_num, left_c_num, right_a_num, right_b_num, right_c_num))
        f.write("run 1000000")


## 標準入力（paramファイル）からパラメータ取得
param_dic = {}
for l in range(5):
    a, b = input().split("=")
    param_dic[a] = b

length = int(param_dic["length"])
a_composition_ratio = float(param_dic["a_composition_ratio"])
temperature = float(param_dic["temperature"])
variable_epsilon = float(param_dic["variable_epsilon"])
c_density = float(param_dic["c_density"])

half_volume = length**3
left_s = round(math.pow((half_volume*0.7/4), 1/3))
right_s = round(math.pow((half_volume*0.02/4), 1/3))
left_num = left_s**3*4
right_num = right_s**3*4
left_c_num = round(left_num * c_density)
left_ab_num = left_num - left_c_num
left_a_num = round(left_ab_num * a_composition_ratio)
left_b_num = left_ab_num - left_a_num
right_c_num = round(right_num * c_density)
right_ab_num = right_num - right_c_num
right_a_num = round(right_ab_num * a_composition_ratio)
right_b_num = right_ab_num - right_a_num

if not os.path.exists('data/in.melt'):
    os.mkdir('data/in.melt')
if not os.path.exists('data/in.melt/L{}T{}E{}CD{}'.format(length, temperature, variable_epsilon, c_density)):
    os.mkdir(('data/in.melt/L{}T{}E{}CD{}'.format(length, temperature, variable_epsilon, c_density)))
make_file("data/in.melt/L{}T{}E{}CD{}/lan{}-lbn{}-lcn{}-ran{}-rbn{}-rcn{}.in".format(length, temperature, variable_epsilon, c_density, left_a_num, left_b_num, left_c_num, right_a_num, right_b_num, right_c_num),
length, temperature, left_a_num, left_b_num, left_c_num, right_a_num, right_b_num, right_c_num, variable_epsilon, c_density)
