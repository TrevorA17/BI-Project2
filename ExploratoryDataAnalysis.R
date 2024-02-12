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

Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Calculate measures of central tendency for sepal_length
mean_sepal_length <- mean(iris_data$sepal_length)
median_sepal_length <- median(iris_data$sepal_length)
mode_sepal_length <- Mode(iris_data$sepal_length)

cat("Measures of Central Tendency for sepal_length:\n")
cat(paste0("Mean: ", round(mean_sepal_length, 2)), "\n")
cat(paste0("Median: ", median_sepal_length), "\n")
cat(paste0("Mode: ", mode_sepal_length), "\n\n")

# Calculate measures of central tendency for sepal_width
mean_sepal_width <- mean(iris_data$sepal_width)
median_sepal_width <- median(iris_data$sepal_width)
mode_sepal_width <- Mode(iris_data$sepal_width)

cat("Measures of Central Tendency for sepal_width:\n")
cat(paste0("Mean: ", round(mean_sepal_width, 2)), "\n")
cat(paste0("Median: ", median_sepal_width), "\n")
cat(paste0("Mode: ", mode_sepal_width), "\n\n")

# Calculate measures of central tendency for petal_length
mean_petal_length <- mean(iris_data$petal_length)
median_petal_length <- median(iris_data$petal_length)
mode_petal_length <- Mode(iris_data$petal_length)

cat("Measures of Central Tendency for petal_length:\n")
cat(paste0("Mean: ", round(mean_petal_length, 2)), "\n")
cat(paste0("Median: ", median_petal_length), "\n")
cat(paste0("Mode: ", mode_petal_length), "\n\n")

# Calculate measures of central tendency for petal_width
mean_petal_width <- mean(iris_data$petal_width)
median_petal_width <- median(iris_data$petal_width)
mode_petal_width <- Mode(iris_data$petal_width)

cat("Measures of Central Tendency for petal_width:\n")
cat(paste0("Mean: ", round(mean_petal_width, 2)), "\n")
cat(paste0("Median: ", median_petal_width), "\n")
cat(paste0("Mode: ", mode_petal_width), "\n\n")



