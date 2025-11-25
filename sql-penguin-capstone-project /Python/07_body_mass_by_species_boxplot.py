# import the libraries
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# read the file
penguins = pd.read_csv("~/course-sql-read/penguins.csv")

# set the figure dimensions
fig, ax = plt.subplots(figsize=(7, 4))

# create a box plot using seaborn and set the color to mark the median
sns.boxplot(
    x="Body Mass (g)", y="Species", data=penguins, color="k", medianprops={"color": "w"}
)

# set the y axis labels
wrapped_labels = [
    "Adelie\nPenguin\n(Pygoscelis\nadeliae)",
    "Chinstrap\npenguin\n(Pygoscelis\nantarctica)",
    "Gentoo\npenguin\n(Pygoscelis\npapua)",
]
ax.set_yticklabels(wrapped_labels)

# set title
plt.title("Body Mass (g) by Species")

# set grid
plt.grid(color="gray", linestyle="-", linewidth=0.5)

# display the plot
plt.show()