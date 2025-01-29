mv input_MAE input
mpiexec -np 10 vampire-parallel
mv input input_MAE
mv output output_MAE
mv input_no_MAE input
mpiexec -np 10 vampire-parallel
mv input input_no_MAE
mv output output_no_MAE
gnuplot -p plotting.gp 
