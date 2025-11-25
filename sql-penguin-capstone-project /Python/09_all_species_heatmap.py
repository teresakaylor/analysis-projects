# import the libraries
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# read the file
penguins = pd.read_csv("~/course-sql-read/penguins.csv")

# set the size of the heatmap
fig, ax = plt.subplots(figsize=(8, 5))

# drop the extraneous columns
penguins.drop(columns=["Sample Number", "Comments"], inplace=True)

# find the correlation in all columns, rounded to 2 decimals
penguins.corr().round(2)

# create an annotated heatmap
sns.heatmap(penguins.corr().round(2), annot=True, vmin=-1, vmax=1, cmap="flare")

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
plt.title("R values for Penguins Dataset")

# display the heatmap
plt.show()