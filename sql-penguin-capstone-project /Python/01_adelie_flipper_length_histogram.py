# import the libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# read the file
penguins = pd.read_csv('~/course-sql-read/clean-penguins.csv')

# filter the data for a particular species
penguins_2 = penguins[penguins["Species"] == "Adelie Penguin (Pygoscelis adeliae)"]

# create a histogram with seaborn
sns.histplot(data=penguins_2["Flipper_Length_mm"], color='purple')

# set the title
plt.title("Adelie Penguins Flipper Length (mm) Histogram")

# display the figure
plt.show()