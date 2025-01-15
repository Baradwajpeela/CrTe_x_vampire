# Read the file and scale Jxx, Jyy, and Jzz by a factor of 2
input_file = 'vampire.UCF'
output_file = 'vampire_scaled.ucf'

# Open the input file for reading and the output file for writing
with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
    for line in infile:
        # Split each line into columns
        columns = line.split()
        
        # If the line contains the expected number of columns, process it
        if len(columns) >= 15:  # Ensure there's enough data in each line
            # Convert the Jxx, Jyy, and Jzz values to floats and scale them
            columns[6] = str(float(columns[6]) * 2*9/4)  # Jxx
            columns[10] = str(float(columns[10]) * 2*9/4)  # Jyy
            columns[14] = str(float(columns[14]) * 2*9/4)  # Jzz
        
        # Write the modified line to the output file
        outfile.write(" ".join(columns) + "\n")

print(f'Scaled data written to {output_file}')
