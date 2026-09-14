#!/usr/bin/env python3

import sys

current_key = None
total = 0.0
count = 0

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
        total += value
        count += 1
    else:
        if current_key is not None and count > 0:
            average = total / count
            print(f"{current_key}\t{average:.4f}")

        current_key = key
        total = value
        count = 1

# Output the last key
if current_key is not None and count > 0:
    average = total / count
    print(f"{current_key}\t{average:.4f}")
