set term pdf
set out 'L100T1.0E1.05.pdf'
set xlabel '{/Arial-Italic B-composition-ratio}'
set ylabel '{/Arial-Italic X}'
set xlabel font 'Arial,15'
set ylabel font 'Arial,15'
set xrange [0.35:0.39]
set tics font 'Arial,10'
set nokey
plot 'L100T1.0E1.05.dat' with yerrorbars pt 0, 0.0
