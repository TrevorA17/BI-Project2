# Train Decision Tree Model
dt_model <- train(
  species ~ .,
  data = iris_data,
  method = "rpart",
  trControl = trainControl(method = "cv", number = 5)
)

# Save the Decision Tree model
saveRDS(dt_model, "./models/saved_dt_model.rds")

# Load the saved Decision Tree model
loaded_dt_model <- readRDS("./models/saved_dt_model.rds")

# Arrange variables in the desired order for prediction
new_data <- data.frame(
  sepal_length = 5.0,
  sepal_width = 3.0,
  petal_length = 1.5,
  petal_width = 0.2
)

# Use the loaded Decision Tree model to make predictions
predictions_loaded_dt_model <- predict(loaded_dt_model, newdata = new_data)

# Print predictions
print(predictions_loaded_dt_model)
