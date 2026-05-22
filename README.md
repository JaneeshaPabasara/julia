# StatFlow

A Statistical Data Analysis REST API built in Julia.

## What It Does

Accepts CSV data, runs statistical analyses, and returns results as JSON.

## Endpoints

| Method | Route | Description |
|--------|-------|-------------|
| POST | `/upload` | Upload a CSV file |
| GET | `/summary` | Statistical summary (mean, median, std, quartiles) |
| GET | `/correlate` | Correlation matrix between columns |
| GET | `/regression` | Simple linear regression between two columns |
| GET | `/histogram` | Histogram data for a column |

## Tech Stack

- Language: [Julia](https://julialang.org/)
- Web framework: Genie.jl
- Data: CSV.jl, DataFrames.jl
- Deployment: Docker

## Project Status

Work in progress — built session by session as a Julia learning project.

## Running Locally

_Instructions will be added as the project progresses._
