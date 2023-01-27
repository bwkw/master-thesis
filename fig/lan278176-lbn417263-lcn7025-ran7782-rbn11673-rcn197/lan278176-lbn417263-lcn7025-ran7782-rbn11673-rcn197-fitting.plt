set term pdf
set out 'lan278176-lbn417263-lcn7025-ran7782-rbn11673-rcn197-fitting.pdf'
set xlabel '{/Arial-Italic x}'
set ylabel '{/Arial-Italic density}'
set xlabel font 'Arial,15'
set ylabel font 'Arial,15'
set xrange [0.2:0.8]
set tics font 'Arial,10'
set key font 'Arial,16'

da(x) = (dal+dag)/2 - ((dal-dag)/2)*tanh((x-a)/(2*b))
db(x) = (dbl+dbg)/2 - ((dbl-dbg)/2)*tanh((x-c)/(2*d))
dc(x) = (dcl+dcg)/2 - ((dcl-dcg)/2)*tanh((x-e)/(2*f))
a=0.5
b=0.006
c=0.5
d=0.006
dal=0.3
dag=0.03
dbl=0.3
dbg=0.03
dcl=0.005
dcg=0.001
fit da(x) 'lan278176-lbn417263-lcn7025-ran7782-rbn11673-rcn197.density' u 1:2 via a, b, dal, dag
fit db(x) 'lan278176-lbn417263-lcn7025-ran7782-rbn11673-rcn197.density' u 1:3 via c, d, dbl, dbg
fit dc(x) 'lan278176-lbn417263-lcn7025-ran7782-rbn11673-rcn197.density' u 1:4 via e, f, dcl, dcg

plot 'lan278176-lbn417263-lcn7025-ran7782-rbn11673-rcn197.density' u 1:2 title 'A' with points pt 1, 'lan278176-lbn417263-lcn7025-ran7782-rbn11673-rcn197.density' u 1:3 title 'B' with points pt 1, 'lan278176-lbn417263-lcn7025-ran7782-rbn11673-rcn197.density' u 1:4 title 'C' with points pt 1, da(x) notitle with line lt 1 lc rgb hsv2rgb(0.1, 1, 1), db(x) notitle with line lt 1 lc rgb hsv2rgb(0.5, 1, 1), dc(x) notitle with line lt 1 lc rgb hsv2rgb(0.9, 1, 1)
