# Air Quality Dataset

This project uses historical air quality monitoring data from the U.S. Environmental Protection Agency (EPA) AirData.

## Data Source

EPA AirData:
https://aqs.epa.gov/aqsweb/airdata/download_files.html

The dataset contains annual air quality measurements collected from monitoring locations across the United States.

## Dataset Used

The project uses annual concentration-by-monitor data covering these years:

- 2000
- 2001
- 2003–2010
- 2012–2020

The available annual files were merged into:

`Air_Quality.csv`

The merged dataset contains approximately **1.69 million records** and is approximately **879 MB**.

## Why the Dataset Is Not Included

The raw dataset is larger than GitHub's 100 MB individual file limit, so the full CSV is intentionally excluded from this repository using `.gitignore`.

The Pig processing dataset is also excluded because it is approximately 162 MB.

## Dataset Preparation

The annual CSV files were merged using:

```bash
head -n 1 annual_conc_by_monitor_2000.csv > Air_Quality.csv

for file in annual_conc_by_monitor_*.csv; do
    tail -n +2 "$file" >> Air_Quality.csv
done
