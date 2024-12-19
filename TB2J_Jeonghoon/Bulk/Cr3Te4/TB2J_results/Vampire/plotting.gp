set terminal pdfcairo enhanced font "Arial,12" linewidth 1.5 size 5,3
set output "Tc_Cr3Te4_bulk_70nm.pdf"
set grid 
set mouse
set xlabel "Temperature"
set ylabel "|M|"
set title "Magnetisation-length vs temperature"
set yrange [0:1]

Tc= 150
beta =0.35
m(x)=x<Tc? (1-(x/Tc))**beta:0.0
fit m(x) "output" u 1:2 via Tc,beta
plot "output" u 1:2 w p title "VAMPIRE", m(x) w l title "fit"
