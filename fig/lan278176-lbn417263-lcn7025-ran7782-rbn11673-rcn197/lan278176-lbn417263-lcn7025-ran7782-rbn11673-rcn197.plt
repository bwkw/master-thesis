set term pdf
set out 'lan278176-lbn417263-lcn7025-ran7782-rbn11673-rcn197.pdf'
set xlabel '{/Arial-Italic x}'
set ylabel '{/Arial-Italic density}'
set xlabel font 'Arial,15'
set ylabel font 'Arial,15'
set xrange [0.2:0.8]
set tics font 'Arial,10'
set key font 'Arial,16'

plot 'lan278176-lbn417263-lcn7025-ran7782-rbn11673-rcn197.density' u 1:2 title 'A-density' with points pt 1, 'lan278176-lbn417263-lcn7025-ran7782-rbn11673-rcn197.density' u 1:3 title 'B-density' with points pt 1, 'lan278176-lbn417263-lcn7025-ran7782-rbn11673-rcn197.density' u 1:4 title 'C-density' with points pt 1
