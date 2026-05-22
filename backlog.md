# StatFlow — Project Backlog

**Project**: StatFlow — Statistical Data Analysis REST API  
**Language**: Julia  
**Commitment**: 1 hour/day  
**Start Date**: 2026-05-19  
**Estimated Completion**: 2026-07-10 (~28 sessions)  
**Current Phase**: Phase 1 — Julia Foundations

---

## What Is StatFlow?

A REST API that accepts CSV data, runs statistical analyses on it, and returns results as JSON. Think of it as a lightweight data analysis backend you'd deploy for a dashboard or data pipeline.

**Why this project?**
- Starts with zero Julia knowledge, no frameworks
- Progresses naturally through the Julia ecosystem
- Ends with a production-deployable, Dockerized REST API
- Every session builds on the last — nothing is throwaway
- Portfolio-worthy and genuinely useful

**Final product features:**
- `POST /upload` — upload a CSV file
- `GET /summary` — get statistical summary (mean, median, std, quartiles)
- `GET /correlate` — correlation matrix between columns
- `GET /regression` — simple linear regression between two columns
- `GET /histogram` — histogram data for a column
- Proper error handling, logging, and JSON responses
- Runs in Docker, deployable to Fly.io or Render

---

## Phase 1 — Julia Foundations
> Goal: Speak Julia. No frameworks, no libraries — just the language.

- [x] **Session 01** (~60 min) — Setup & First Program  
  Install Julia, configure VS Code with Julia extension, run your first script. Write a function `greet(name)` that returns a greeting string. Understand the REPL. Learn `println`, `typeof`, basic arithmetic.

- [ ] **Session 02** (~60 min) — Variables, Types & the Type System  
  Explore Julia's type hierarchy. Practice with `Int64`, `Float64`, `String`, `Bool`, `Char`. Understand `const`. Write a small script that demonstrates type coercion and why Julia is strict about it.

- [ ] **Session 03** (~60 min) — Control Flow  
  `if/elseif/else`, `for`, `while`, `break`, `continue`. Write a function that takes a vector of numbers and returns a Dict with keys `:positive`, `:negative`, `:zero` mapping to counts.

- [ ] **Session 04** (~60 min) — Functions Deep Dive  
  Multiple dispatch (Julia's superpower). Optional args, keyword args, varargs. Short-form functions. Write three versions of a `describe(x)` function dispatched on different types.

- [ ] **Session 05** (~60 min) — Arrays & Matrices  
  1D arrays, 2D arrays, array comprehensions. Slicing, `push!`, `pop!`, `append!`. Column-major memory layout. Write `row_means(M)` and `col_stds(M)` functions for a matrix.

- [ ] **Session 06** (~60 min) — Strings & File I/O  
  String interpolation, `split`, `strip`, `parse`. Read a plain text file line by line. Write a function `count_words(filepath)` that returns a word frequency Dict.

- [ ] **Session 07** (~60 min) — Dictionaries, Sets & Tuples  
  When to use each. NamedTuples. Iteration patterns. Write a function `group_by(data, key_fn)` that groups a vector of values by a computed key.

- [ ] **Session 08** (~60 min) — Structs & Custom Types  
  `struct` vs `mutable struct`. Constructors. Why immutability matters. Define a `DataColumn` struct with fields `name::String` and `values::Vector{Float64}`. Add a constructor that validates no NaN values.

---

## Phase 2 — Data Handling
> Goal: Load, clean, and analyze real CSV data using Julia's ecosystem.

- [ ] **Session 09** (~60 min) — Packages & CSV.jl  
  How `Pkg.jl` works. `Project.toml` and `Manifest.toml`. Add `CSV.jl` and `DataFrames.jl`. Read a CSV file into a DataFrame. Explore it in the REPL.

- [ ] **Session 10** (~60 min) — DataFrames.jl Basics  
  Selecting columns, filtering rows, `nrow`, `ncol`, `describe`. Write `load_csv(path)` that returns a cleaned DataFrame (drop rows with missing values).

- [ ] **Session 11** (~60 min) — Data Transformation  
  `transform`, `select`, `combine`, `groupby`. Write `normalize_column(df, col)` that adds a new column with values scaled to [0, 1].

- [ ] **Session 12** (~60 min) — Statistics  
  `Statistics` stdlib: `mean`, `median`, `std`, `var`, `quantile`. Write `summary_stats(df, col)` returning a NamedTuple with all key stats.

- [ ] **Session 13** (~60 min) — Correlation & Regression  
  `cor` from Statistics. Simple linear regression from scratch (no library). Write `linear_regression(x, y)` returning slope and intercept. Understand what residuals are.

- [ ] **Session 14** (~60 min) — JSON & Data Serialization  
  Add `JSON3.jl`. Serialize a stats result to JSON. Write `stats_to_json(result)`. Understand why JSON output format matters for API consumers.

---

## Phase 3 — Building the API
> Goal: Turn your data functions into a real HTTP API using Genie.jl.

- [ ] **Session 15** (~60 min) — HTTP Basics & Genie.jl Setup  
  How HTTP works (request/response, methods, status codes). Install Genie.jl. Create a bare-bones app with one `GET /ping` route that returns `{"status": "ok"}`.

- [ ] **Session 16** (~60 min) — Routing & Controllers  
  Genie routing patterns. Separate routes from logic. Create a `StatsController` module. Wire up placeholder routes for all 5 endpoints.

- [ ] **Session 17** (~60 min) — File Upload Endpoint  
  `POST /upload` — accept a CSV, store it in memory (or temp file), validate it. Return `{"columns": [...], "rows": N}`. Handle the case where no file is sent.

- [ ] **Session 18** (~60 min) — Summary Endpoint  
  `GET /summary?col=price` — call your `summary_stats` function, return JSON. Handle: column not found, column has non-numeric data, no data uploaded yet.

- [ ] **Session 19** (~60 min) — Correlation & Regression Endpoints  
  Wire up `GET /correlate` (full matrix) and `GET /regression?x=col1&y=col2`. Return clean JSON. Handle mismatched column lengths and missing values.

- [ ] **Session 20** (~60 min) — Histogram Endpoint & Query Params  
  `GET /histogram?col=price&bins=10`. Compute bin edges and counts manually. Return as JSON array of `{bin_start, bin_end, count}` objects.

- [ ] **Session 21** (~60 min) — Error Handling & Middleware  
  Global error handler. Structured error responses `{"error": "...", "code": 400}`. Request logging middleware. Test all your error paths manually.

---

## Phase 4 — Production
> Goal: Make it shippable. Tests, Docker, deployment.

- [ ] **Session 22** (~60 min) — Unit Testing with Test.jl  
  Julia's built-in `Test` module. `@test`, `@testset`, `@test_throws`. Write tests for `summary_stats`, `linear_regression`, and `load_csv`.

- [ ] **Session 23** (~60 min) — Integration Testing  
  Test your actual HTTP endpoints using `HTTP.jl` as a client in tests. Test the happy path and error cases for each endpoint.

- [ ] **Session 24** (~60 min) — Logging & Configuration  
  `Logging` stdlib. Log levels. Read config from environment variables using `ENV`. Add a `config.jl` module. Make port and log level configurable.

- [ ] **Session 25** (~60 min) — Performance Profiling  
  `@time`, `BenchmarkTools.jl`. Profile your CSV parsing and stats functions. Fix at least one performance issue. Understand what "type-stable" means in practice.

- [ ] **Session 26** (~60 min) — Docker Setup  
  Write a `Dockerfile` for a Julia app. Multi-stage build to keep image small. Build and run locally. Test all endpoints inside the container.

- [ ] **Session 27** (~60 min) — Deployment  
  Deploy to Fly.io (free tier). `fly.toml` config. Set environment variables in production. Verify all endpoints work on the live URL.

- [ ] **Session 28** (~60 min) — Project Wrap-up  
  Write a proper `README.md`. Add OpenAPI/Swagger-style endpoint docs as comments. Do a final review: what would you do differently? What did Julia do better than you expected?

---

## Parking Lot (Future Ideas)

Ideas that came up but are out of scope for now. Revisit after Session 28.

- [ ] Add authentication (API keys)
- [ ] Persist uploaded data to SQLite with SQLite.jl
- [ ] Streaming CSV upload for large files
- [ ] WebSocket endpoint for real-time stats
- [ ] React/Vue frontend dashboard
- [ ] Add Pluto.jl notebook interface

---

## Progress

| Phase | Sessions | Completed | Status |
|-------|----------|-----------|--------|
| Phase 1 — Foundations | 8 | 0 | Not started |
| Phase 2 — Data Handling | 6 | 0 | Not started |
| Phase 3 — Building the API | 7 | 0 | Not started |
| Phase 4 — Production | 7 | 0 | Not started |
| **Total** | **28** | **0** | **0%** |
