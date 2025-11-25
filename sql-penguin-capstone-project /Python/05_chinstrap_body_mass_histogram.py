# import the libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# read the file
penguins = pd.read_csv('~/course-sql-read/clean-penguins.csv')

# filter the data for a particular species
penguins_3 = penguins[penguins["Species"] == "Chinstrap penguin (Pygoscelis antarctica)"]

# create a histogram with seaborn
sns.histplot(data=penguins_3["Body_Mass_g"], color='orange')

# set the title
plt.title("Chinstrap Penguins Body Mass (g) Histogram")

# display the figure
plt.show()