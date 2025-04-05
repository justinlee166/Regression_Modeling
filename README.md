# AMS 315 Project 1: Data Imputation and Regression Modeling

**Author:** Justin Lee  
**Course:** AMS 315 - Data Analysis, Spring 2024  
**Instructor:** Professor Yan Yu

---

## 📌 Overview
This repository contains my solutions and analysis for the AMS 315 Project 1 assignment, focused on linear regression, data imputation, and exploratory analysis with transformations. The assignment consists of two main parts, emphasizing the handling of missing data and functional form recovery using regression analysis.

---

## Project Description

### Part A: Missing Data and Regression
- Merged two datasets based on subject IDs (containing independent and dependent variables).
- Evaluated the extent of missing data and clearly reported the number of complete/incomplete cases.
- Implemented data imputation using R's `MICE` library (excluding simple methods such as mean or median imputation).
- Conducted linear regression and provided results including ANOVA table, confidence intervals, and residual analysis.

### Part B: Functional Form Recovery
- Analyzed the relationship between the independent and dependent variables through transformations.
- Binned near-repeated independent variable values and performed approximate Lack-of-Fit (LOF) tests.
- Identified the most appropriate transformation, fitted linear models, and evaluated results using R² values, residual plots, and confidence intervals.

The primary objective was to recover the function underlying the dependent variable using regression methods and evaluate the adequacy of the resulting models.

---

## Tools & Libraries
- **Programming Language:** R
- **Libraries:** `mice`, `alr3`, `remotes`, `knitr`
- **Documentation:** LaTeX for reporting results clearly and professionally.

---

## Key Results

### Part A
- Best-fitting model explained **43.26%** of the variance in the dependent variable.
- Correlation coefficient of **0.649** indicated a moderately strong positive linear relationship.
- Statistically significant association (**p < 0.0001**).

### Part B
- Optimal transformation: `DV^(-2/3) = 0.39504 * IV^(2) + 1.43968`.
- Explained **46.22%** of the dependent variable variance.
- Correlation coefficient of **0.681** suggested a moderately strong positive relationship.
- Adequate fit confirmed by LOF test (**p = 0.9827**).

<pre> ## 📁 Repository Structure ``` AMS315-Project1/ ├── data/ │ ├── partA/ │ │ ├── independent.csv # Part A: Independent variable dataset │ │ └── dependent.csv # Part A: Dependent variable dataset │ └── partB/ │ └── full_dataset.csv # Part B: Combined IV/DV dataset ├── plots/ │ ├── scatter_original.png │ ├── scatter_iv_dv_transform.png │ ├── scatter_iv_inverse.png │ └── scatter_iv2_dv_transform.png ├── scripts/ │ ├── data_merge.R # Merges and cleans Part A data │ ├── imputation.R # Handles missing data using MICE │ └── regression_analysis.R # Performs regression & transformations ├── report.tex # LaTeX source for the final report ├── report.pdf # Compiled PDF report └── README.md # This file ``` </pre>

## Contact
Justin Lee  
Double Major in Computer Science and Applied Mathematics
JustinYuilLee@gmail.com
[LinkedIn](https://www.linkedin.com/in/justinyuillee/)