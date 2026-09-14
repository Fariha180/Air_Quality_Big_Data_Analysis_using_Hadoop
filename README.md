# Air Quality Big Data Analysis using Hadoop

## Overview

This project performs large-scale **Air Quality Data Analysis** using the Hadoop ecosystem.

The project is based on historical air quality monitoring data from the **U.S. Environmental Protection Agency (EPA)** and demonstrates how Hadoop **MapReduce** and **Apache Pig** can be used to process and analyze large datasets.

## Technologies Used

- Hadoop 3.2.4
- HDFS
- Hadoop MapReduce
- Hadoop Streaming
- Apache Pig 0.17.0
- Python 3
- WSL / Ubuntu
- GitHub

## Dataset

The project uses EPA AirData historical air quality monitoring data.

Source:

https://aqs.epa.gov/aqsweb/airdata/download_files.html

The project contains data from multiple years between **2000 and 2020**.

The merged dataset contains approximately:

- **1.69 million records**
- **879 MB**

The large dataset files are not included in this GitHub repository because GitHub has a 100 MB individual file limit.

See [`dataset/README.md`](dataset/README.md) for dataset details and preparation instructions.

---

# MapReduce Analysis

Three Hadoop MapReduce jobs were implemented.

## MR1 — Average Pollutant Concentration

Calculates the average arithmetic mean concentration for each pollutant.

**Input:** Air quality monitoring records

**Output:**

```text
Pollutant    Average Concentration










---

## MR2 — Highest Pollution Location

Finds the highest recorded pollution value for each pollutant and county.

**Output:**

```text
Pollutant | State | County | Highest Value


Folder:

`mapreduce/MR2_HighestPollutionLocation/`

---

## MR3 — Pollution Trend

Calculates the average pollutant concentration for each year and pollutant.

**Output:**

```text
Year | Pollutant | Average Concentration




Folder:

`mapreduce/MR3_PollutionTrend/`

---

# Apache Pig Analysis

Five Apache Pig jobs were implemented.

## P1 — Average Pollutant

Calculates the average concentration for each pollutant.

Folder:

`pig/P1_AveragePollutant/`

---

## P2 — Location Analysis

Calculates the average pollutant concentration for each state and county.

Folder:

`pig/P2_LocationAnalysis/`

---

## P3 — Pollution Trend

Analyzes changes in average pollutant concentration across different years.

Folder:

`pig/P3_PollutionTrend/`

---

## P4 — Top 10 Polluted Locations

Finds the top 10 pollutant-location combinations based on their highest recorded value.

Folder:

`pig/P4_TopPollutedLocations/`

---

## P5 — Pollutant Analysis

Groups pollutants by their measurement units and calculates:

- Number of observations
- Average concentration

Folder:

`pig/P5_PollutantAnalysis/`

---

# Results

The project successfully completed:

- 3 MapReduce jobs
- 5 Apache Pig jobs
- 8 total Big Data processing jobs

---

# Author

**Fariha**

GitHub:

https://github.com/Fariha180




































































































































































































































































































