set term pdf
set out 'lan140493-lbn561971-ran3930-rbn15722.pdf'
set xlabel '{/Arial-Italic x}'
set ylabel '{/Arial-Italic density}'
set xlabel font 'Arial,15'
set ylabel font 'Arial,15'
set xrange [0.2:0.8]
set tics font 'Arial,10'
set key font 'Arial,16'


plot 'lan140493-lbn561971-ran3930-rbn15722.density' u 1:2 title 'A-density' with points pt 1, 'lan140493-lbn561971-ran3930-rbn15722.density' u 1:3 title 'B-density' with points pt 1
