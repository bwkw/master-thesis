set term pdf
set out 'L100T1.0-part-fitting.pdf
set xlabel '{/Arial-Italic 液相濃度}'
set ylabel '{/Arial-Italic 気相濃度}'
set xlabel font 'Arial,15'
set ylabel font 'Arial,15'
set xrange [0.000:0.55]
set tics font 'Arial,10'
set key font 'Arial,16'
set key right bottom

f(x) = a*x + b*x**2 + c*x**3 + d*x**4 + e*x**5
fit f(x) 'L100T1.0-part.dat' u 3:1 via a, b, c, d, e

plot f(x) with line lt 1 lc rgb hsv2rgb(0, 1, 1) title 'fitting', 'L100T1.0-part.dat' u 3:1:($3-$4):($3+$4):($1-$2):($1+$2) with xyerrorbars pt 0 ps 0 title 'original', x notitle
