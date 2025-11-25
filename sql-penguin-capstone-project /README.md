# Data Analyst Capstone Project @ NCLab: Palmer Penguins: SQL Analysis to Python Visualization
## Overview
This repository contains all the code, analysis, and documentation for my data analyst capstone project. The project focuses on using SQL (PostgreSQL) for data cleaning, exploration, and statistical modeling, and Python for visualization.

## Project Flow

The analysis follows these major phases:

1.  **Data Preparation (SQL):** Cleaning, subsetting, and performing initial transformations on the raw dataset.
2.  **Descriptive Analysis (SQL & Python):** Calculating key metrics, identifying data distributions, and preparing summary statistics.
3.  **Modeling & Visualization (Python):** Building a linear regression model to predict body mass from flipper length and creating visualizations to communicate findings.
4.  **Reporting:** Drawing conclusions and documenting the entire process.

---

## Technical Stack
* **Database:** PostgreSQL
* **Query Language:** SQL
* **Analysis:** Python 3.x
* **Libraries:** Pandas, NumPy
* **Visualization:** Matplotlib, Seaborn
* **Version Control:** Git & GitHub

---

## Repository Structure

The project files are organized into the following folders:

* **`SQL/`**: Contains all `.sql` scripts used for data cleaning, aggregation, and initial descriptive statistics.
* **`PYTHON/`**: Contains Python scripts and Jupyter Notebooks (e.g., `.ipynb`) for statistical analysis, regression modeling, and generating final visualizations.
* **`DATA/`**: Holds the original raw data file (`raw_data.csv`) and the prepared, cleaned dataset used for modeling.
* **`REPORTS/`**: Contains the final written documentation (`final_report.pdf`) and project reflection.

---

## Key Findings
The initial analysis confirmed that the three penguin species Adelie, Chinstrap, Gentoo) are morphologically distinct, which justified performing all correlation and regression analyses on a species-by-species basis. Data cleaning was critical, and I chose to remove the two extreme Chinstrap body mass outliers (the min at 2,700g and max at 4,800g) because they represented a significant percentage difference from the nearest values and would have heavily skewed the regression model. The corresponding box plots visually verified the presence of these outliers.

The correlation analysis demonstrated that the strength of the relationship between flipper length and body mass varies significantly by species. The Gentoo species exhibited the strongest positive correlation (p=0.70), making it the most predictable group, followed by the Chinstrap (p=0.54) and the Adelie (p=0.33). This strong relationship in Gentoo penguins was modeled successfully by the linear equation: Body Mass = 54.27 * Flipper Length - 6697.36. The R2 value of 0.50 means that flipper length explains 50% of the variation in body mass for Gentoo penguins, confirming the model's reliability for this species.

## Possible Next Steps
The next logical step would be to build the full linear regression models for the other two species, Chinstrap and Adelie, to confirm their respective R2 values and predictive equations. Additionally, to create a more powerful and accurate model, a multiple linear regression should be performed for all three species. This would use several physical attributes (flipper_length_mm, culmen_length_mm, culmen_depth_mm) to predict body mass, rather than relying on a single predictor. I’d also split the Gentoo species by sex and re-run the analysis. Finally, given the strong negative correlation between the two isotope measurements (Delta 15 N and Delta 13 C) in the Gentoo species (R=-0.58), a separate analysis could be performed to explore the ecological implications of that specific inverse feeding relationship.

## Reflection on Lessons Learned
The primary lesson learned was the importance of species-specific analysis; combining all penguins would have diluted the strong, genuine correlations found within the Gentoo group. I also gained practical experience using Common Table Expressions (CTEs) in SQL for multi-step calculations, specifically calculating and implementing species-specific IQR fences to surgically remove outliers. This emphasized that data cleaning is not a single, blanket step but a nuanced process where the decision to keep or delete data must be carefully reasoned and documented. Finally, the exercise reinforced how to properly align Python code with the final mathematical equation, particularly the crucial step of correctly assigning the X (predictor) and Y (target) variables to match the desired linear relationship.

---

## Data Source

The dataset used in this analysis is the Palmer Archipelago (Antarctica) penguin data.

* Source: [https://www.kaggle.com/datasets/parulpandey/palmer-archipelago-antarctica-penguin-data](https://www.kaggle.com/datasets/parulpandey/palmer-archipelago-antarctica-penguin-data)
