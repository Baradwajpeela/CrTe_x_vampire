# Conversion factor from meV to Joules
meV_to_J = 1.60218e-22

# Input and output file names
input_file = "interactions.txt"
output_file = "interactions_new.ucf"

# Read data from the input file
with open(input_file, "r") as infile:
    lines = infile.readlines()

# Process the data
converted_lines = []
interaction_number = 0  # Initialize interaction number
for line in lines:
    # Split line into components
    parts = line.split()
    # Convert the last column (meV to Joules)
    if parts:  # Check if line is not empty
        last_column_meV = float(parts[-1])
        last_column_J = last_column_meV * meV_to_J
        # Create a new row with interaction number and converted value
        converted_row = [str(interaction_number)] + parts[:-1] + [f"{last_column_J:.6e}"]
        interaction_number += 1  # Increment interaction number
        # Join the converted row and add to the converted_lines
        converted_lines.append(" ".join(converted_row))

# Write the converted data into the output file
with open(output_file, "w") as outfile:
    outfile.write("\n".join(converted_lines))

print(f"Converted data with interaction numbers has been written to {output_file}.")

