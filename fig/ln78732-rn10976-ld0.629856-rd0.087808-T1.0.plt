set term pdf
set out 'ln78732-rn10976-ld0.629856-rd0.087808-T1.0.pdf'
set xlabel '{/Arial-Italic x}'
set ylabel '{/Arial-Italic density}'
set xlabel font 'Arial,15'
set ylabel font 'Arial,15'
set xrange [0.2:0.8]
set tics font 'Arial,10'
set nokey
plot 'ln78732-rn10976-ld0.629856-rd0.087808-T1.0.density' u 1:2
