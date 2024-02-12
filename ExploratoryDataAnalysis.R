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

# Display frequency and percentage of sepal_length
table_sepal_length <- table(iris_data$sepal_length)
percentage_sepal_length <- prop.table(table_sepal_length) * 100
cat("Frequency and Percentage of sepal_length:\n")
cat(table_sepal_length, "\n")
cat(paste0("Percentage:\n", round(percentage_sepal_length, 2)), "\n\n")

# Display frequency and percentage of sepal_width
table_sepal_width <- table(iris_data$sepal_width)
percentage_sepal_width <- prop.table(table_sepal_width) * 100
cat("Frequency and Percentage of sepal_width:\n")
cat(table_sepal_width, "\n")
cat(paste0("Percentage:\n", round(percentage_sepal_width, 2)), "\n\n")

# Display frequency and percentage of petal_length
table_petal_length <- table(iris_data$petal_length)
percentage_petal_length <- prop.table(table_petal_length) * 100
cat("Frequency and Percentage of petal_length:\n")
cat(table_petal_length, "\n")
cat(paste0("Percentage:\n", round(percentage_petal_length, 2)), "\n\n")

# Display frequency and percentage of petal_width
table_petal_width <- table(iris_data$petal_width)
percentage_petal_width <- prop.table(table_petal_width) * 100
cat("Frequency and Percentage of petal_width:\n")
cat(table_petal_width, "\n")
cat(paste0("Percentage:\n", round(percentage_petal_width, 2)), "\n\n")



