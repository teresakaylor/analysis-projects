# import the pandas and numpy libraries
import pandas as pd
import numpy as np

# read the csv file
penguins = pd.read_csv("~/course-sql-read/clean-penguins.csv")

# filter the data for Adelie Penguin species
penguins_2 = penguins[penguins["Species"] == "Gentoo penguin (Pygoscelis papua)"]

# calculate the slope and y-intercept for x and y
slope, intercept = np.polyfit(
    penguins_2["Flipper_Length_mm"], penguins_2["Body_Mass_g"], 1
)

# print the results
print(f"The slope is: {slope}.")
print(f"The y-intercept is: {intercept}.")