#!/usr/bin/env python3

import sys
import csv

reader = csv.reader(sys.stdin)

for row in reader:
    try:
        # Skip header
        if row[0] == "State Code":
            continue

        parameter_name = row[8]
        max_value = row[29]
        state_name = row[50]
        county_name = row[51]

        if not parameter_name or not max_value:
            continue

        max_value = float(max_value)

        # Skip invalid values
        if max_value < 0:
            continue

        key = f"{parameter_name}|{state_name}|{county_name}"

        print(f"{key}\t{max_value}")

    except (ValueError, IndexError):
        continue
