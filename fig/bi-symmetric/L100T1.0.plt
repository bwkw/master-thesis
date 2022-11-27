set term pdf
set out 'L100T1.0.pdf'
set xlabel '{/Arial-Italic A-composition-ratio}'
set ylabel '{/Arial-Italic X}'
set xlabel font 'Arial,15'
set ylabel font 'Arial,15'
set xrange [0.0:1.0]
set tics font 'Arial,10'
set nokey
plot 'L100T1.0.dat' with yerrorbars pt 0, 0.0
