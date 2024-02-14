# Install and load the required packages
if (!require("httr")) {
  install.packages("httr", dependencies = TRUE, repos = "https://cloud.r-project.org")
}
if (!require("jsonlite")) {
  install.packages("jsonlite", dependencies = TRUE, repos = "https://cloud.r-project.org")
}
library(httr)
library(jsonlite)

# Generate the URL required to access the API
base_url <- "http://127.0.0.1:5022/iris_species"

# Create a named list called "params" with input parameters
params <- list(
  sepal_length = 5.0,
  sepal_width = 3.0,
  petal_length = 1.5,
  petal_width = 0.2
)

# Modify the URL with query parameters
query_url <- httr::modify_url(url = base_url, query = params)

# Print the generated URL
print(query_url)

# Make a GET request to the API
model_prediction <- GET(query_url)

# Extract and print the JSON content
content_json <- content(model_prediction, "text", encoding = "utf-8")
print(content_json)

# Parse the JSON response into a data frame or list
parsed_result <- fromJSON(content_json)
print(parsed_result)

