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

# Check for missing values in the entire dataset
any_missing_values <- any(is.na(iris_data))

# Print the result
if (any_missing_values) {
  cat("There are missing values in the Iris dataset.\n")
} else {
  cat("There are no missing values in the Iris dataset.\n")
}
