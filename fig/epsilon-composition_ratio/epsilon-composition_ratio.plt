set term pdf
set out 'epsilon-composition_ratio.pdf'
set xlabel '{/Arial-Italic epsilon}'
set ylabel '{/Arial-Italic B-compostion-ratio}'
set xlabel font 'Arial,15'
set ylabel font 'Arial,15'
set xrange [0.9:1.3]
set tics font 'Arial,10'
set nokey
plot 'epsilon-composition_ratio.dat' with errorbars pt 0
