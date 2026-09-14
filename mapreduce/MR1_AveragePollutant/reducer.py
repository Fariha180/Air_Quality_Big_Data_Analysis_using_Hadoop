#!/usr/bin/env python3

import sys

current_parameter = None
total = 0.0
count = 0

for line in sys.stdin:
    line = line.strip()

    if not line:
        continue

    try:
        parameter, value = line.split("\t", 1)
        value = float(value)
    except ValueError:
        continue

    if current_parameter == parameter:
        total += value
        count += 1
    else:
        if current_parameter is not None and count > 0:
            average = total / count
            print(f"{current_parameter}\t{average:.4f}")

        current_parameter = parameter
        total = value
        count = 1

# Output the last parameter
if current_parameter is not None and count > 0:
    average = total / count
    print(f"{current_parameter}\t{average:.4f}")
