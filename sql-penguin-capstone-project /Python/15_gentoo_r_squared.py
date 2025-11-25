# import the libraries
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# read the file
penguins = pd.read_csv("~/course-sql-read/clean-penguins.csv")

# drop the extraneous columns
penguins.drop(columns=["Sample_Number"], inplace=True)

# filter the data for Adelie Penguin species
penguins_2 = penguins[penguins["Species"] == "Gentoo penguin (Pygoscelis papua)"]

# find the correlation in all columns, rounded to 2 decimals
cm = penguins_2.corr().round(2)

# find the R squared value
cm2 = cm**2

# set the size of the heatmap
fig, ax = plt.subplots(figsize=(8, 5))

# create an annotated heatmap
sns.heatmap(cm2, annot=True, vmin=-1, vmax=1, cmap="vlag")

# set x and y labels
wrapped_labels = [
    "Culmen\nLength\n(mm)",
    "Culmen\nDepth (mm)",
    "Flipper\nLength\n(mm)",
    "Body Mass\n(g)",
    "Delta 15 N\n(o/oo)",
    "Delta 13 C\n(o/oo)",
]
ax.set_xticklabels(wrapped_labels, rotation=360)
ax.set_yticklabels(wrapped_labels)

# set title
plt.title("R squared values for Gentoo Penguins")

# display the heatmap
plt.show()