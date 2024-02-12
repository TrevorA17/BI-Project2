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


# Calculate range, variance, and standard deviation for sepal_length
range_sepal_length <- range(iris_data$sepal_length)
variance_sepal_length <- var(iris_data$sepal_length)
sd_sepal_length <- sd(iris_data$sepal_length)

cat("Measures of Distribution for sepal_length:\n")
cat(paste0("Range: ", paste(range_sepal_length, collapse = " - ")), "\n")
cat(paste0("Variance: ", round(variance_sepal_length, 2)), "\n")
cat(paste0("Standard Deviation: ", round(sd_sepal_length, 2)), "\n\n")

# Calculate range, variance, and standard deviation for sepal_width
range_sepal_width <- range(iris_data$sepal_width)
variance_sepal_width <- var(iris_data$sepal_width)
sd_sepal_width <- sd(iris_data$sepal_width)

cat("Measures of Distribution for sepal_width:\n")
cat(paste0("Range: ", paste(range_sepal_width, collapse = " - ")), "\n")
cat(paste0("Variance: ", round(variance_sepal_width, 2)), "\n")
cat(paste0("Standard Deviation: ", round(sd_sepal_width, 2)), "\n\n")

# Calculate range, variance, and standard deviation for petal_length
range_petal_length <- range(iris_data$petal_length)
variance_petal_length <- var(iris_data$petal_length)
sd_petal_length <- sd(iris_data$petal_length)

cat("Measures of Distribution for petal_length:\n")
cat(paste0("Range: ", paste(range_petal_length, collapse = " - ")), "\n")
cat(paste0("Variance: ", round(variance_petal_length, 2)), "\n")
cat(paste0("Standard Deviation: ", round(sd_petal_length, 2)), "\n\n")

# Calculate range, variance, and standard deviation for petal_width
range_petal_width <- range(iris_data$petal_width)
variance_petal_width <- var(iris_data$petal_width)
sd_petal_width <- sd(iris_data$petal_width)

cat("Measures of Distribution for petal_width:\n")
cat(paste0("Range: ", paste(range_petal_width, collapse = " - ")), "\n")
cat(paste0("Variance: ", round(variance_petal_width, 2)), "\n")
cat(paste0("Standard Deviation: ", round(sd_petal_width, 2)), "\n\n")

# Assuming iris_data is the name of your dataset

# Calculate correlation coefficients for numerical columns
cor_sepal <- cor(iris_data[, c("sepal_length", "sepal_width")])
cor_petal <- cor(iris_data[, c("petal_length", "petal_width")])
cor_all <- cor(iris_data[, c("sepal_length", "sepal_width", "petal_length", "petal_width")])

cat("Correlation Coefficients for Sepal Length and Sepal Width:\n")
print(cor_sepal)
cat("\n")

cat("Correlation Coefficients for Petal Length and Petal Width:\n")
print(cor_petal)
cat("\n")

cat("Correlation Coefficients for All Numerical Columns:\n")
print(cor_all)
cat("\n")



