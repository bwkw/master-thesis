set term pdf
set out "tT.pdf"
set xlabel "{/Arial-Italic t}"
set ylabel "{/Arial-Italic T}"
#ticsはメモリ文字
set tics font "Arial,10"
#keyは凡例
set key font"Arial,16"
set key left bottom
plot "tT.dat" u 1:2 with lines title "測定値"
