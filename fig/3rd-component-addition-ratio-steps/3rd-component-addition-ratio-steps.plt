set term pdf
set out '3rd-component-addition-ratio-steps.pdf
set xlabel '{/Arial-Italic Cの添加割合(%)}'
set ylabel '{/Arial-Italic 三段で到達する目的物質Bの濃度}'
set xlabel font 'Arial,15'
set ylabel font 'Arial,15'
set xrange [0.0:2.0]
set tics font 'Arial,10'
set key font 'Arial,16'

plot '3rd-component-addition-ratio-steps.dat' pt 1 ps 1 notitle
