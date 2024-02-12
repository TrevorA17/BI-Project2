# Load required libraries
library(plumber)
library(rpart)

# Load the saved Decision Tree model
loaded_dt_model <- readRDS("./models/saved_dt_model.rds")

# Define the Plumber API
#* @apiTitle Iris Species Prediction Model API
#* @apiDescription Used to predict the species of iris flowers based on features like sepal length, sepal width, petal length, and petal width.

#* @param sepal_length Sepal length of the iris flower
#* @param sepal_width Sepal width of the iris flower
#* @param petal_length Petal length of the iris flower
#* @param petal_width Petal width of the iris flower

#* @get /iris_species

predict_iris_species <- function(sepal_length, sepal_width, petal_length, petal_width) {
  
  # Create a data frame using the arguments
  to_be_predicted <- data.frame(
    sepal_length = as.numeric(sepal_length),
    sepal_width = as.numeric(sepal_width),
    petal_length = as.numeric(petal_length),
    petal_width = as.numeric(petal_width)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_dt_model, newdata = to_be_predicted)
  
  # Return the prediction
  return(prediction)
}