
# Install and load necessary libraries if not already installed
if (!require("caret")) {
  install.packages("caret")
}
if (!require("randomForest")) {
  install.packages("randomForest")
}
library(caret)
library(randomForest)

# Set seed for reproducibility
set.seed(123)

# Split the data into training and testing sets
split <- createDataPartition(iris_data$species, p = 0.8, list = FALSE)
train_data <- iris_data[split, ]
test_data <- iris_data[-split, ]

# Define the parameter grid for Random Forest
param_grid <- expand.grid(mtry = c(2, 3, 4), nodesize = c(1, 2, 3))

# Define the control parameters for cross-validation
cv_control <- trainControl(method = "cv", number = 5)

# Perform grid search with Random Forest
model <- train(species ~ sepal_length + sepal_width + petal_length + petal_width,
               data = train_data,
               method = "rf",
               tuneGrid = param_grid,
               trControl = cv_control)

# Display the best model and its performance
print(model)


# Install and load necessary libraries if not already installed
if (!require("caret")) {
  install.packages("caret")
}
if (!require("randomForest")) {
  install.packages("randomForest")
}
if (!require("adabag")) {
  install.packages("adabag")
}
if (!require("caretEnsemble")) {
  install.packages("caretEnsemble")
}
library(caret)
library(randomForest)
library(adabag)
library(caretEnsemble)

# Set seed for reproducibility
set.seed(123)

# Split the data into training and testing sets
split <- createDataPartition(iris_data$species, p = 0.8, list = FALSE)
train_data <- iris_data[split, ]
test_data <- iris_data[-split, ]

# Define models for Bagging
model_bagging <- train(species ~ sepal_length + sepal_width + petal_length + petal_width,
                       data = train_data,
                       method = "rf")

# Define models for Boosting
model_boosting <- boosting(species ~ sepal_length + sepal_width + petal_length + petal_width,
                           data = train_data)

# Define models for Stacking
model_stacking <- caretList(
  species ~ sepal_length + sepal_width + petal_length + petal_width,
  data = train_data,
  methodList = c("rf", "knn", "svmRadial")
)

# Bagging: Random Forest
predictions_bagging <- predict(model_bagging, newdata = test_data)

# Boosting: Adaboost
predictions_boosting <- predict(model_boosting, newdata = test_data)

# Stacking: Combine predictions from Random Forest, k-Nearest Neighbors, and Support Vector Machine
predictions_stacking <- predict(model_stacking, newdata = test_data)

# Evaluate the performance of each ensemble
confusion_matrix_bagging <- confusionMatrix(predictions_bagging, test_data$species)
confusion_matrix_boosting <- confusionMatrix(predictions_boosting, test_data$species)
confusion_matrix_stacking <- confusionMatrix(predictions_stacking, test_data$species)

# Display the confusion matrices
cat("Confusion Matrix for Bagging (Random Forest):\n")
print(confusion_matrix_bagging)

cat("\nConfusion Matrix for Boosting (Adaboost):\n")
print(confusion_matrix_boosting)

cat("\nConfusion Matrix for Stacking (Random Forest, k-Nearest Neighbors, SVM):\n")
print(confusion_matrix_stacking)

