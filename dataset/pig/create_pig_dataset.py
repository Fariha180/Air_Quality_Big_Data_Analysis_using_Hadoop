#!/usr/bin/env python3

import csv

input_file = "dataset/raw/Air_Quality.csv"
output_file = "dataset/pig/Air_Quality_Pig.tsv"

with open(input_file, "r", newline="", encoding="utf-8") as infile, \
     open(output_file, "w", newline="", encoding="utf-8") as outfile:

    reader = csv.reader(infile)

    # Header
    outfile.write(
        "Year\tState\tCounty\tParameter\tUnits\t"
        "ArithmeticMean\tMaxValue\tLatitude\tLongitude\n"
    )

    for row in reader:
        try:
            if row[0] == "State Code":
                continue

            year = row[13]
            state = row[50]
            county = row[51]
            parameter = row[8]
            units = row[14]
            mean = row[27]
            max_value = row[29]
            latitude = row[5]
            longitude = row[6]

            if not year or not parameter or not mean:
                continue

            float(mean)

            outfile.write(
                f"{year}\t{state}\t{county}\t{parameter}\t"
                f"{units}\t{mean}\t{max_value}\t{latitude}\t{longitude}\n"
            )

        except (ValueError, IndexError):
            continue

print("Pig TSV dataset created successfully.")
