# Project Analysis Report

## Author
Milena Vidic
GitHub: [milenavidic](https://github.com/milenavidic)

## Project Analyzed
**Name**: kOrganizify
**Source**: [kOrganizify GitLab Repo](https://gitlab.com/matf-bg-ac-rs/course-rs/projects-2023-2024/kOrganizify)
**Analyzed commit**:

---

## About this report

This report documents the static and dynamic analysis of the kOrganizify project for the Software Verification course.
It outlines the tools used and the results collected during the analysis process.

---

## Tools to Be Used

I plan to use the following 4 tools for the required verification and testing:

1. **Valgrind** – Memory analysis (memcheck, massif)
2. **cppcheck** – Static analysis
3.
4.

Each tool will have its own folder containing:
- Output files (logs, graphs, reports)
- A `run_*.sh` script for reproducibility
- Screenshots if relevant

---

## Repository Structure

├── .github/workflows/ # CI configuration
├── src/kOrganizify # Git submodule of the original project
├── unit_tests/ # Custom unit tests
├── valgrind/ # Valgrind results (memcheck, massif, callgrind)
├── static_analysis/ # Cppcheck outputs
├── images/ # Screenshots, graphs
├── README.md
├── ProjectAnalysisReport.md
└── ProjectAnalysisReport.pdf

This report will be updated progressively as tools are run and results collected.
This is line #50.
