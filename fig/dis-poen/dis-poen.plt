set term pdf
set out "dis-poen.pdf"
set xrange [0.5:]
set yrange [-1:4]
set xlabel "{/Arial-Italic r}"
set ylabel "{/Arial-Italic E}"
set xlabel font "Arial,15"
set ylabel font "Arial,15"
set tics font "Arial,10"
set key font"Arial,16"

plot "dis-poen.dat" u 1:3 with lines linewidth 5
