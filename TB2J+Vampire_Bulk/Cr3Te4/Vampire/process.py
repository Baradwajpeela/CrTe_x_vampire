import re
import numpy as np

# Conversion factor from meV to Joules
meV_to_J = 1.60218e-22

# Read input file
with open("interactions.txt", "r") as file:
    lines = file.readlines()

output_lines = []

for index, line in enumerate(lines):
    parts = line.split()
    if len(parts) != 6:
        continue  # Skip malformed lines
    
    # Convert CrX to numeric indices
    atom1 = int(re.sub("Cr", "", parts[0])) - 1
    atom2 = int(re.sub("Cr", "", parts[1])) - 1
    
    # Keep the middle three columns unchanged
    middle_cols = parts[2:5]
    
    # Convert energy from meV to Joules
    energy_meV = float(parts[5])
    energy_J = energy_meV * meV_to_J
    
    # Construct output line
    output_line = f"{index} {atom1} {atom2} {' '.join(middle_cols)} {energy_J:.6e}"
    output_lines.append(output_line)

# Write to output file
with open("converted_interactions.txt", "w") as file:
    file.write("\n".join(output_lines))

print("Conversion complete. Output saved in 'converted_interactions.txt'.")

