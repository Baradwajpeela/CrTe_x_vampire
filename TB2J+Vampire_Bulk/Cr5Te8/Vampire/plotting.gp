set terminal wxt size 800,600 enhanced font "Arial,14"
set grid
set mouse
set xlabel "Temperature (in K)"
set ylabel "|M|"
set title "Magnetisation vs Temperature Cr_5Te_8"
set yrange [0:1]

# Define fitting functions
Tc1 = 70
beta1 = 0.4
m1(x) = x < Tc1 ? (1 - (x / Tc1))**beta1 : 0.0

Tc2 = 70  # Reset for second fit
beta2 = 0.4
m2(x) = x < Tc2 ? (1 - (x / Tc2))**beta2 : 0.0

# Perform fitting separately and then plot
# Fit m1(x) to "output_MAE"
fit m1(x) "output_MAE" using 1:5 via Tc1, beta1

# Fit m2(x) to "output_no_MAE"
fit m2(x) "output_no_MAE" using 1:5 via Tc2, beta2

# Now plot the data and fits
plot "output_MAE" using 1:5 with points pt 5 title "MAE = 0.457 meV", \
     m1(x) with lines lw 2 lc rgb "blue" title sprintf("Fit MAE: Tc=%.2f, {/Symbol b}=%.2f", Tc1, beta1), \
     "output_no_MAE" using 1:5 with points pt 5 title "MAE = 0 meV", \
     m2(x) with lines lw 2 lc rgb "red" title sprintf("Fit No MAE: Tc=%.2f, {/Symbol b}=%.2f", Tc2, beta2)
