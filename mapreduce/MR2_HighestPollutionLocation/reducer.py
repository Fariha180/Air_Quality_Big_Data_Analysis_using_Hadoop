#!/usr/bin/env python3

import sys

current_key = None
highest_value = float("-inf")

for line in sys.stdin:
    line = line.strip()

    if not line:
        continue

    try:
        key, value = line.split("\t", 1)
        value = float(value)
    except ValueError:
        continue

    if current_key == key:
        if value > highest_value:
            highest_value = value
    else:
        if current_key is not None:
            print(f"{current_key}\t{highest_value:.4f}")

        current_key = key
        highest_value = value

# Output the last key
if current_key is not None:
    print(f"{current_key}\t{highest_value:.4f}")
