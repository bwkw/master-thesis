set term pdf
set out 'ln78732-rn10976-ld0.629856-rd0.087808-T1.0-fitting.pdf'
set xlabel '{/Arial-Italic x}'
set ylabel '{/Arial-Italic density}'
set xlabel font 'Arial,15'
set ylabel font 'Arial,15'
set xrange [0.2:0.8]
set tics font 'Arial,10'
set key font 'Arial,16'

da(x) = (dal+dag)/2 + ((dal-dag)/2)*tanh((x-a)/(2*b))

fit da(x) 'ln78732-rn10976-ld0.629856-rd0.087808-T1.0.density' u 1:2 via a, b, dal, dag

plot 'ln78732-rn10976-ld0.629856-rd0.087808-T1.0.density' u 1:2 title 'density' with points pt 1, da(x) title 'density-fit' with line lt 1 lc rgb hsv2rgb(0, 1, 1)
