import os
import re

def convert_atom(atom):
    return str(int(atom[2:]) - 1)

def meV_to_joules(meV):
    return float(meV) * 1.60218e-22

def extract_numbers(s):
    return re.findall(r'-?\d+\.?\d*', s)

def process_file():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    input_file = os.path.join(script_dir, "interactions.txt")
    output_file = os.path.join(script_dir, "vampire_isotropic.ucf")

    with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
        for line_num, line in enumerate(infile):
            parts = line.split()
            
            if len(parts) < 8:
                continue  # Skip lines that don't have enough parts
            
            atom_i = convert_atom(parts[0])
            atom_j = convert_atom(parts[1])
            
            # Extract x, y, z values
            xyz = extract_numbers(' '.join(parts[2:6]))
            if len(xyz) != 3:
                continue  # Skip if we don't have exactly 3 values for x, y, z
            
            x, y, z = xyz
            
            # Find and convert energy value
            energy_value = next((part for part in parts[6:] if part.replace('-', '').replace('.', '').isdigit()), None)
            if energy_value is None:
                continue  # Skip if we can't find a valid energy value
            
            energy = meV_to_joules(energy_value)
            
            new_line = f"{line_num} {atom_i} {atom_j} {x} {y} {z} {energy:.6e}\n"
            outfile.write(new_line)
    
    print(f"Output file created: {output_file}")

if __name__ == "__main__":
    process_file()
