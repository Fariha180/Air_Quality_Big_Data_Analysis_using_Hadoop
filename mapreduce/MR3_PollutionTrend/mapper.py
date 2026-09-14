#!/usr/bin/env python3

import sys
import csv

reader = csv.reader(sys.stdin)

for row in reader:
    try:
        # Skip header
        if row[0] == "State Code":
            continue

        year = row[13]
        parameter_name = row[8]
        arithmetic_mean = row[27]

        # Skip empty values
        if not year or not parameter_name or not arithmetic_mean:
            continue

        mean_value = float(arithmetic_mean)

        # Group by Year + Pollutant
        key = f"{year}|{parameter_name}"

        print(f"{key}\t{mean_value}")

    except (ValueError, IndexError):
        continue
