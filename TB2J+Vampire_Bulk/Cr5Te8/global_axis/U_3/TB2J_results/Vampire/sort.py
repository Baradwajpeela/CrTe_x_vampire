import re

# File name specification
input_file = "vampire.UCF"  # Original file name
output_file = "vampire2.UCF"  # Name for saving the modified content

# Read the file
with open(input_file, "r") as file:
    lines = file.readlines()

# List to store the processed results
processed_lines = []

# Perform modifications after the # Interactions section
interactions_section = False
for line in lines:
    if "# Interactions" in line:
        interactions_section = True
        processed_lines.append(line)
        continue

    if interactions_section and re.match(r"^\d+", line):
        # If the line starts with a number, perform modifications
        parts = line.split()

        # Check if the line has at least 15 components
        if len(parts) >= 15:
            # Modify components from the 7th to the 15th
            for i in range(6, 15):
                parts[i] = parts[i].replace("(", "").replace(")", "").replace("+0j", "")  # Remove parentheses and +0j
                value = float(parts[i])  # Convert string to a number
                parts[i] = f"{-value}"  # Reverse the sign and convert back to string

        # Reassemble the modified line
        processed_lines.append(" ".join(parts) + "\n")
    else:
        processed_lines.append(line)

# Save the modified content to a new file
with open(output_file, "w") as file:
    file.writelines(processed_lines)

print(f"The modified file has been saved as {output_file}.")
