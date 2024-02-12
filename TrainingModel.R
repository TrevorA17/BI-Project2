# Load dataset
iris_data <- read.csv("data/iris.csv", colClasses = c(
  sepal_length = "numeric",
  sepal_width = "numeric",
  petal_length = "numeric",
  petal_width = "numeric",
  species = "character"
))

# Define levels for categorical column
species_levels <- c("Iris-setosa", "Iris-versicolor", "Iris-virginica")

# Update factor column with levels
iris_data$species <- factor(iris_data$species, levels = species_levels)

# Display the dataset
View(iris_data)

# Assuming iris_data is the name of your dataset

# Install and load necessary libraries if not already installed
if (!require("caTools")) {
  install.packages("caTools")
}
library(caTools)

# Set seed for reproducibility
set.seed(123)

# Split the data into training and testing sets
split <- sample.split(iris_data$species, SplitRatio = 0.8)
train_data <- subset(iris_data, split == TRUE)
test_data <- subset(iris_data, split == FALSE)

# Display the number of observations in each set
cat("Number of observations in the training set:", nrow(train_data), "\n")
cat("Number of observations in the testing set:", nrow(test_data), "\n")

