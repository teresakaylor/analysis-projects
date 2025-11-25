# import the libraries
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# read the file
penguins = pd.read_csv("~/course-sql-read/penguins.csv")

# filter the data for Adelie Penguin species
penguins_adelie = penguins[penguins["Species"] == "Gentoo penguin (Pygoscelis papua)"]

# set the default theme
sns.set(color_codes=True)

# set the palette using the name of a palette
sns.set_palette("Paired")

# set the figure size
fig, ax = plt.subplots(figsize=(8, 5))

# plot the regression line
sns.regplot(
    x="Flipper Length (mm)",
    y="Body Mass (g)",
    data=penguins,
    label="Gentoo Penguin regression",
)

# plot the residuals
sns.residplot(
    x="Flipper Length (mm)",
    y="Body Mass (g)",
    data=penguins,
    label="Gentoo Penguin residuals",
)

# set title and legend
plt.title(label="Gentoo Penguin Flipper Length (mm) and Body Mass (g) Attributes")
plt.legend()

# display the figure
plt.show()