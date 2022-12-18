# 密度ファイルから共沸点を取得するファイル
# コマンドライン引数に、系の長さ、Aの組成比分割個数、温度、シグマを入れる

import os
import re
import sys
from uncertainties import ufloat

## fitting結果が出力されたファイルから粒子Aの気相・液相密度、粒子Bの気相・液相密度取得
def loadfile(filename):
    with open(filename) as f:
        parameter = []
        a_composition_ratio = 0
        dal = 0
        dag = 0
        dbl = 0
        dbg = 0
        for line in f:
            if re.match("FIT:    data read from ", line):
                result = re.findall(r"\d+", line)
                a_number = int(result[7])
                b_number = int(result[8])
                c_number = int(result[9])
                a_composition_ratio = round(a_number/(a_number+b_number+c_number), 5)
            if re.match("dal             =", line):
                result = line.split()
                dal_average = float(result[2])
                dal_uncertainty = float(result[4])
                dal = ufloat(dal_average, dal_uncertainty)
            if re.match("dag             =", line):
                result = line.split()
                dag_average = float(result[2])
                dag_uncertainty = float(result[4])
                dag = ufloat(dag_average, dag_uncertainty)
            if re.match("dbl             =", line):
                result = line.split()
                dbl_average = float(result[2])
                dbl_uncertainty = float(result[4])
                dbl = ufloat(dbl_average, dbl_uncertainty)
            if re.match("dbg             =", line):
                result = line.split()
                dbg_average = float(result[2])
                dbg_uncertainty = float(result[4])
                dbg = ufloat(dbg_average, dbg_uncertainty)
            if ((a_composition_ratio!=0) and (dal!=0) and (dag!=0) and (dbl!=0) and (dbg!=0)):
                parameter.append(a_composition_ratio)
                parameter.append(dal)
                parameter.append(dag)
                parameter.append(dbl)
                parameter.append(dbg)
                parameters.append(parameter)
                parameter = []
                a_composition_ratio = 0
                dal = 0
                dag = 0
                dbl = 0
                dbg = 0

## ABの気液密度ファイル作成
def make_gas_liquid_density_file(filename, a_composition_ratio, a_gas_density, a_liquid_density, b_gas_density, b_liquid_density):
    with open(filename, "a") as f:
        f.write("{} {} {} {} {}\n".format(a_composition_ratio, a_gas_density, a_liquid_density, b_gas_density, b_liquid_density))

## YZファイル作成
### Y = a_gas_density * b_liquid_density
### Z = a_liquid_density * b_gas_density
def make_yz_file(filename, a_composition_ratio, Y, Z):
    with open(filename, "a") as f:
        f.write("{} {} {} {} {}\n".format(a_composition_ratio, Y.n, Y.s, Z.n, Z.s))

## Aの組成比・Xファイル作成
### X = Y-Z
def make_azeotrope_file(filename, a_composition_ratio, X):
    with open(filename, "a") as f:
        f.write("{} {} {}\n".format(a_composition_ratio, X.n, X.s))

## Bの気液濃度ファイル作成
def make_b_gas_liquid_concentration_file(filename, b_gas_concentration, b_liquid_concentration):
    with open(filename, "a") as f:
        f.write("{} {} {}\n".format(b_gas_concentration, b_liquid_concentration, b_gas_concentration-b_liquid_concentration))

## 共沸pltファイル作成
def make_azeotrope_plt_file(filename, length, temperature, composition_number, variable_epsilon, c_density):
    with open(filename, "w") as f:
        f.write("set term pdf\n")
        f.write("set out 'azeotrope/azeotrope_img/L{}T{}CN{}E{}CD{}.pdf'\n".format(length, temperature, composition_number, variable_epsilon, c_density))
        f.write("set xlabel '{/Arial-Italic A-composition-ratio}'\n")
        f.write("set ylabel '{/Arial-Italic X}'\n")
        f.write("set xlabel font 'Arial,15'\n")
        f.write("set ylabel font 'Arial,15'\n")
        f.write("set xrange [0.0:1.0]\n")
        f.write("set tics font 'Arial,10'\n")
        f.write("set nokey\n")
        f.write("plot 'azeotrope/azeotrope/L{}T{}CN{}E{}CD{}.dat' with yerrorbars pt 0, 0.0\n".format(length, temperature, composition_number, variable_epsilon, c_density))

## Bの気液濃度pltファイル作成
def make_b_gas_liquid_concentration_plt_file(filename, length, temperature, composition_number, variable_epsilon, c_density):
    with open(filename, "w") as f:
        f.write("set term pdf\n")
        f.write("set out 'azeotrope/b_gas_liquid_concentration_img/L{}T{}CN{}E{}CD{}.pdf'\n".format(length, temperature, composition_number, variable_epsilon, c_density))
        f.write("set xlabel '{/Arial-Italic 液相密度}'\n")
        f.write("set ylabel '{/Arial-Italic 気相密度}'\n")
        f.write("set xlabel font 'Arial,15'\n")
        f.write("set ylabel font 'Arial,15'\n")
        f.write("set tics font 'Arial,10'\n")
        f.write("set nokey\n")
        f.write("plot 'azeotrope/b_gas_liquid_concentration/L{}T{}CN{}E{}CD{}.dat' u 2:1 with yerrorbars pt 0, x\n".format(length, temperature, composition_number, variable_epsilon, c_density))


## fitting結果が出力されたファイルのロード
parameters = []
length = int(sys.argv[1])
temperature = float(sys.argv[2])
composition_number = int(sys.argv[3])
variable_epsilon = float(sys.argv[4])
c_density = float(sys.argv[5])
loadfile("density/density_fitting/L{}T{}CN{}E{}CD{}.log".format(length, temperature, composition_number, variable_epsilon, c_density))

## フォルダが存在しなかった場合、作成
if not os.path.exists('azeotrope'):
    os.mkdir('azeotrope')
if not os.path.exists('azeotrope/gas_liquid_density'):
    os.mkdir('azeotrope/gas_liquid_density')
if not os.path.exists('azeotrope/yz'):
    os.mkdir('azeotrope/yz')
if not os.path.exists('azeotrope/azeotrope'):
    os.mkdir('azeotrope/azeotrope')
if not os.path.exists('azeotrope/b_gas_liquid_concentration'):
    os.mkdir('azeotrope/b_gas_liquid_concentration')
if not os.path.exists('azeotrope/azeotrope_plt'):
    os.mkdir('azeotrope/azeotrope_plt')
if not os.path.exists('azeotrope/b_gas_liquid_concentration_plt'):
    os.mkdir('azeotrope/b_gas_liquid_concentration_plt')

## 取得したパラメタを基に、各ファイルを作成
parameters = sorted(parameters)
for parameter in parameters:
    a_composition_ratio = parameter[0]
    a_liquid_density = parameter[1]
    a_gas_density = parameter[2]
    b_liquid_density = parameter[3]
    b_gas_density = parameter[4]
    make_gas_liquid_density_file("azeotrope/gas_liquid_density/L{}T{}CN{}E{}CD{}.dat".format(length, temperature, composition_number, variable_epsilon, c_density), a_composition_ratio, a_gas_density, a_liquid_density, b_gas_density, b_liquid_density)

    Y = a_gas_density * b_liquid_density
    Z = a_liquid_density * b_gas_density
    X = Y-Z
    print(X)
    make_yz_file("azeotrope/yz/L{}T{}CN{}E{}CD{}.dat".format(length, temperature, composition_number, variable_epsilon, c_density), a_composition_ratio, Y, Z)

    make_azeotrope_file("azeotrope/azeotrope/L{}T{}CN{}E{}CD{}.dat".format(length, temperature, composition_number, variable_epsilon, c_density), a_composition_ratio, X)

    b_gas_concentration = b_gas_density / (a_gas_density + b_gas_density)
    b_liquid_concentration = b_liquid_density / (a_liquid_density + b_liquid_density)
    make_b_gas_liquid_concentration_file("azeotrope/b_gas_liquid_concentration/L{}T{}CN{}E{}CD{}.dat".format(length, temperature, composition_number, variable_epsilon, c_density), b_gas_concentration, b_liquid_concentration)

make_azeotrope_plt_file("azeotrope/azeotrope_plt/L{}T{}CN{}E{}CD{}.plt".format(length, temperature, composition_number, variable_epsilon, c_density), length, temperature, composition_number, variable_epsilon, c_density)
make_b_gas_liquid_concentration_plt_file("azeotrope/b_gas_liquid_concentration_plt/L{}T{}CN{}E{}CD{}.plt".format(length, temperature, composition_number, variable_epsilon, c_density), length, temperature, composition_number, variable_epsilon, c_density)
