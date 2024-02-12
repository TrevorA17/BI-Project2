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

# Assuming iris_data is the name of your dataset

# Install and load necessary libraries if not already installed
if (!require("boot")) {
  install.packages("boot")
}
library(boot)

# Set seed for reproducibility
set.seed(123)

# Define a function to calculate the statistic of interest
calculate_statistic <- function(data, indices) {
  sample_data <- data[indices, ]
  mean_sepal_length <- mean(sample_data$sepal_length)
  return(mean_sepal_length)
}

# Perform bootstrap resampling
boot_results <- boot(data = iris_data, statistic = calculate_statistic, R = 1000)

# Display the bootstrap results
print(boot_results)

# Calculate the bootstrap confidence interval
bootstrap_ci <- boot.ci(boot_results, type = "basic")
print(bootstrap_ci)

# Assuming iris_data is the name of your dataset

# Install and load necessary libraries if not already installed
if (!require("caret")) {
  install.packages("caret")
}
library(caret)

# Set seed for reproducibility
set.seed(123)

# Split the data into training and testing sets (you can adjust this based on your preference)
split <- createDataPartition(iris_data$species, p = 0.8, list = FALSE)
train_data <- iris_data[split, ]
test_data <- iris_data[-split, ]

# Define the control parameters for cross-validation
cv_control <- trainControl(method = "cv", number = 5)  # Basic cross-validation with 5 folds

# Train a classification model (e.g., Decision Tree) using basic cross-validation
model_basic_cv <- train(species ~ sepal_length + sepal_width + petal_length + petal_width,
                        data = train_data,
                        method = "rpart",
                        trControl = cv_control)

# Display the results
print(model_basic_cv)

# Repeated Cross-Validation
cv_control_repeated <- trainControl(method = "repeatedcv", number = 5, repeats = 3)  # Repeated cross-validation with 5 folds and 3 repeats

model_repeated_cv <- train(species ~ sepal_length + sepal_width + petal_length + petal_width,
                           data = train_data,
                           method = "rpart",
                           trControl = cv_control_repeated)

print(model_repeated_cv)

# Leave-One-Out Cross-Validation (LOOCV)
cv_control_loocv <- trainControl(method = "LOOCV")  # Leave-One-Out Cross-Validation

model_loocv <- train(species ~ sepal_length + sepal_width + petal_length + petal_width,
                     data = train_data,
                     method = "rpart",
                     trControl = cv_control_loocv)

print(model_loocv)


# Install and load necessary libraries if not already installed
if (!require("rpart")) {
  install.packages("rpart")
}
library(rpart)

# Set seed for reproducibility
set.seed(123)

# Split the data into training and testing sets (you can adjust this based on your preference)
split <- createDataPartition(iris_data$species, p = 0.8, list = FALSE)
train_data <- iris_data[split, ]
test_data <- iris_data[-split, ]

# Train a Decision Tree classification model
model <- rpart(species ~ sepal_length + sepal_width + petal_length + petal_width, data = train_data, method = "class")

# Make predictions on the test set
predictions <- predict(model, newdata = test_data, type = "class")

# Evaluate the model
confusion_matrix <- table(predictions, test_data$species)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

# Display the confusion matrix and accuracy
print("Confusion Matrix:")
print(confusion_matrix)
cat("Accuracy:", round(accuracy, 4), "\n")


# Install and load necessary libraries if not already installed
if (!require("caret")) {
  install.packages("caret")
}
library(caret)

# Set seed for reproducibility
set.seed(123)

# Define the control parameters for cross-validation
cv_control <- trainControl(method = "cv", number = 5)  # 5-fold cross-validation

# Specify the models to compare (e.g., Decision Tree, Random Forest, k-Nearest Neighbors)
models <- list(
  DecisionTree = train(species ~ sepal_length + sepal_width + petal_length + petal_width,
                       data = iris_data,
                       method = "rpart",
                       trControl = cv_control),
  RandomForest = train(species ~ sepal_length + sepal_width + petal_length + petal_width,
                       data = iris_data,
                       method = "rf",
                       trControl = cv_control),
  kNN = train(species ~ sepal_length + sepal_width + petal_length + petal_width,
              data = iris_data,
              method = "knn",
              trControl = cv_control)
)

# Compare models using resampling
results <- resamples(models)

# Summarize and visualize the results
summary(results)
bwplot(results)

