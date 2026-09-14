#!/usr/bin/env python3

import sys
import csv

reader = csv.reader(sys.stdin)

for row in reader:
    try:
        # Skip header
        if row[0] == "State Code":
            continue

        # Dataset columns
        parameter_name = row[8]
        arithmetic_mean = row[27]

        # Skip empty values
        if not parameter_name or not arithmetic_mean:
            continue

        # Check numeric value
        mean_value = float(arithmetic_mean)

        print(f"{parameter_name}\t{mean_value}")

    except (ValueError, IndexError):
        continue
