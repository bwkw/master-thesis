set term pdf
set out 'sigma-composition_ratio.pdf'
set xlabel '{/Arial-Italic sigma}'
set ylabel '{/Arial-Italic B-compostion-ratio}'
set xlabel font 'Arial,15'
set ylabel font 'Arial,15'
set xrange [0.9:1.225]
set yrange [0.35:0.65]
set tics font 'Arial,10'
set nokey
plot 'sigma-composition_ratio.dat' with errorbars pt 0
