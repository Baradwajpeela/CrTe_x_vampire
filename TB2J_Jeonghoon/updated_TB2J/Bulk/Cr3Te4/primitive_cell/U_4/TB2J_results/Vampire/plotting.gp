set terminal wxt
set grid 
set mouse
set xlabel "Temperatrue"
set ylabel "|M|"
set title "Magnetisation-length vs temperature"
set yrange [0:1]

Tc= 70
beta =0.4
m(x)=x<Tc? (1-(x/Tc))**beta:0.0
fit m(x) "output" u 1:5 via Tc,beta
plot "output" u 1:5 w p, m(x) w l

