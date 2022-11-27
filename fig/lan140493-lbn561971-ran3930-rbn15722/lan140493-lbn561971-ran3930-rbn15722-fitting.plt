set term pdf
set out 'lan140493-lbn561971-ran3930-rbn15722-fitting.pdf'
set xlabel '{/Arial-Italic x}'
set ylabel '{/Arial-Italic density}'
set xlabel font 'Arial,15'
set ylabel font 'Arial,15'
set xrange [0.2:0.8]
set tics font 'Arial,10'
set key font 'Arial,16'

da(x) = (dal+dag)/2 - ((dal-dag)/2)*tanh((x-a)/(2*b))
db(x) = (dbl+dbg)/2 - ((dbl-dbg)/2)*tanh((x-c)/(2*d))

fit da(x) 'lan140493-lbn561971-ran3930-rbn15722.density' u 1:2 via a, b, dal, dag
fit db(x) 'lan140493-lbn561971-ran3930-rbn15722.density' u 1:3 via c, d, dbl, dbg

plot 'lan140493-lbn561971-ran3930-rbn15722.density' u 1:2 title 'A-density' with points pt 1, da(x) title 'A-density-fit' with line lt 1 lc rgb hsv2rgb(0, 1, 1), 'lan140493-lbn561971-ran3930-rbn15722.density' u 1:3 title 'B-density' with points pt 1, db(x) title 'B-density-fit' with line lt 1 lc rgb hsv2rgb(1, 1, 0)
