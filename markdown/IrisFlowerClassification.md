Iris Flower Classification Model
================
Trevor Okinda

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
- [Understanding the Dataset (Exploratory Data Analysis
  (EDA))](#understanding-the-dataset-exploratory-data-analysis-eda)
  - [Loading the Dataset](#loading-the-dataset)
    - [Source:](#source)
    - [Reference:](#reference)

# Student Details

|                       |                               |
|-----------------------|-------------------------------|
| **Student ID Number** | 134780                        |
| **Student Name**      | Trevor Okinda                 |
| **BBIT 4.2 Group**    | C                             |
| **Project Name**      | A Flower Classification Model |

# Setup Chunk

**Note:** the following KnitR options have been set as the global
defaults: <BR>
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy = TRUE)`.

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

# Understanding the Dataset (Exploratory Data Analysis (EDA))

## Loading the Dataset

### Source:

The dataset that was used can be downloaded here: *\<<a
href="https://www.kaggle.com/datasets/zaraavagyan/weathercsv/discussion\"
class="uri">https://www.kaggle.com/datasets/zaraavagyan/weathercsv/discussion\</a>\>*

### Reference:

*\<Avagyan, Z. (2017). Weather CSV \[Data set\]. Kaggle.
<a href="https://www.kaggle.com/datasets/zaraavagyan/weathercsv\"
class="uri">https://www.kaggle.com/datasets/zaraavagyan/weathercsv\</a>\>  
Refer to the APA 7th edition manual for rules on how to cite datasets:
<https://apastyle.apa.org/style-grammar-guidelines/references/examples/data-set-references>*

``` r
# Load dataset
iris_data <- read.csv("iris.csv", colClasses = c(
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
```

``` r
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

# Calculate measures of central tendency for sepal_length
mean_sepal_length <- mean(iris_data$sepal_length)
median_sepal_length <- median(iris_data$sepal_length)
mode_sepal_length <- Mode(iris_data$sepal_length)

cat("Measures of Central Tendency for sepal_length:\n")
```

    ## Measures of Central Tendency for sepal_length:

``` r
cat(paste0("Mean: ", round(mean_sepal_length, 2)), "\n")
```

    ## Mean: 5.84

``` r
cat(paste0("Median: ", median_sepal_length), "\n")
```

    ## Median: 5.8

``` r
cat(paste0("Mode: ", mode_sepal_length), "\n\n")
```

    ## Mode: 5

``` r
# Calculate measures of central tendency for sepal_width
mean_sepal_width <- mean(iris_data$sepal_width)
median_sepal_width <- median(iris_data$sepal_width)
mode_sepal_width <- Mode(iris_data$sepal_width)

cat("Measures of Central Tendency for sepal_width:\n")
```

    ## Measures of Central Tendency for sepal_width:

``` r
cat(paste0("Mean: ", round(mean_sepal_width, 2)), "\n")
```

    ## Mean: 3.05

``` r
cat(paste0("Median: ", median_sepal_width), "\n")
```

    ## Median: 3

``` r
cat(paste0("Mode: ", mode_sepal_width), "\n\n")
```

    ## Mode: 3

``` r
# Calculate measures of central tendency for petal_length
mean_petal_length <- mean(iris_data$petal_length)
median_petal_length <- median(iris_data$petal_length)
mode_petal_length <- Mode(iris_data$petal_length)

cat("Measures of Central Tendency for petal_length:\n")
```

    ## Measures of Central Tendency for petal_length:

``` r
cat(paste0("Mean: ", round(mean_petal_length, 2)), "\n")
```

    ## Mean: 3.76

``` r
cat(paste0("Median: ", median_petal_length), "\n")
```

    ## Median: 4.35

``` r
cat(paste0("Mode: ", mode_petal_length), "\n\n")
```

    ## Mode: 1.5

``` r
# Calculate measures of central tendency for petal_width
mean_petal_width <- mean(iris_data$petal_width)
median_petal_width <- median(iris_data$petal_width)
mode_petal_width <- Mode(iris_data$petal_width)

cat("Measures of Central Tendency for petal_width:\n")
```

    ## Measures of Central Tendency for petal_width:

``` r
cat(paste0("Mean: ", round(mean_petal_width, 2)), "\n")
```

    ## Mean: 1.2

``` r
cat(paste0("Median: ", median_petal_width), "\n")
```

    ## Median: 1.3

``` r
cat(paste0("Mode: ", mode_petal_width), "\n\n")
```

    ## Mode: 0.2

``` r
# Calculate range, variance, and standard deviation for sepal_length
range_sepal_length <- range(iris_data$sepal_length)
variance_sepal_length <- var(iris_data$sepal_length)
sd_sepal_length <- sd(iris_data$sepal_length)

cat("Measures of Distribution for sepal_length:\n")
```

    ## Measures of Distribution for sepal_length:

``` r
cat(paste0("Range: ", paste(range_sepal_length, collapse = " - ")), "\n")
```

    ## Range: 4.3 - 7.9

``` r
cat(paste0("Variance: ", round(variance_sepal_length, 2)), "\n")
```

    ## Variance: 0.69

``` r
cat(paste0("Standard Deviation: ", round(sd_sepal_length, 2)), "\n\n")
```

    ## Standard Deviation: 0.83

``` r
# Calculate range, variance, and standard deviation for sepal_width
range_sepal_width <- range(iris_data$sepal_width)
variance_sepal_width <- var(iris_data$sepal_width)
sd_sepal_width <- sd(iris_data$sepal_width)

cat("Measures of Distribution for sepal_width:\n")
```

    ## Measures of Distribution for sepal_width:

``` r
cat(paste0("Range: ", paste(range_sepal_width, collapse = " - ")), "\n")
```

    ## Range: 2 - 4.4

``` r
cat(paste0("Variance: ", round(variance_sepal_width, 2)), "\n")
```

    ## Variance: 0.19

``` r
cat(paste0("Standard Deviation: ", round(sd_sepal_width, 2)), "\n\n")
```

    ## Standard Deviation: 0.43

``` r
# Calculate range, variance, and standard deviation for petal_length
range_petal_length <- range(iris_data$petal_length)
variance_petal_length <- var(iris_data$petal_length)
sd_petal_length <- sd(iris_data$petal_length)

cat("Measures of Distribution for petal_length:\n")
```

    ## Measures of Distribution for petal_length:

``` r
cat(paste0("Range: ", paste(range_petal_length, collapse = " - ")), "\n")
```

    ## Range: 1 - 6.9

``` r
cat(paste0("Variance: ", round(variance_petal_length, 2)), "\n")
```

    ## Variance: 3.11

``` r
cat(paste0("Standard Deviation: ", round(sd_petal_length, 2)), "\n\n")
```

    ## Standard Deviation: 1.76

``` r
# Calculate range, variance, and standard deviation for petal_width
range_petal_width <- range(iris_data$petal_width)
variance_petal_width <- var(iris_data$petal_width)
sd_petal_width <- sd(iris_data$petal_width)

cat("Measures of Distribution for petal_width:\n")
```

    ## Measures of Distribution for petal_width:

``` r
cat(paste0("Range: ", paste(range_petal_width, collapse = " - ")), "\n")
```

    ## Range: 0.1 - 2.5

``` r
cat(paste0("Variance: ", round(variance_petal_width, 2)), "\n")
```

    ## Variance: 0.58

``` r
cat(paste0("Standard Deviation: ", round(sd_petal_width, 2)), "\n\n")
```

    ## Standard Deviation: 0.76

``` r
# Calculate correlation coefficients for numerical columns
cor_sepal <- cor(iris_data[, c("sepal_length", "sepal_width")])
cor_petal <- cor(iris_data[, c("petal_length", "petal_width")])
cor_all <- cor(iris_data[, c("sepal_length", "sepal_width", "petal_length", "petal_width")])

cat("Correlation Coefficients for Sepal Length and Sepal Width:\n")
```

    ## Correlation Coefficients for Sepal Length and Sepal Width:

``` r
print(cor_sepal)
```

    ##              sepal_length sepal_width
    ## sepal_length    1.0000000  -0.1093692
    ## sepal_width    -0.1093692   1.0000000

``` r
cat("\n")
```

``` r
cat("Correlation Coefficients for Petal Length and Petal Width:\n")
```

    ## Correlation Coefficients for Petal Length and Petal Width:

``` r
print(cor_petal)
```

    ##              petal_length petal_width
    ## petal_length    1.0000000   0.9627571
    ## petal_width     0.9627571   1.0000000

``` r
cat("\n")
```

``` r
cat("Correlation Coefficients for All Numerical Columns:\n")
```

    ## Correlation Coefficients for All Numerical Columns:

``` r
print(cor_all)
```

    ##              sepal_length sepal_width petal_length petal_width
    ## sepal_length    1.0000000  -0.1093692    0.8717542   0.8179536
    ## sepal_width    -0.1093692   1.0000000   -0.4205161  -0.3565441
    ## petal_length    0.8717542  -0.4205161    1.0000000   0.9627571
    ## petal_width     0.8179536  -0.3565441    0.9627571   1.0000000

``` r
cat("\n")
```

``` r
# Perform ANOVA for sepal_length by species
anova_sepal_length <- aov(sepal_length ~ species, data = iris_data)
summary(anova_sepal_length)
```

    ##              Df Sum Sq Mean Sq F value Pr(>F)    
    ## species       2  63.21  31.606   119.3 <2e-16 ***
    ## Residuals   147  38.96   0.265                   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# Perform ANOVA for sepal_width by species
anova_sepal_width <- aov(sepal_width ~ species, data = iris_data)
summary(anova_sepal_width)
```

    ##              Df Sum Sq Mean Sq F value Pr(>F)    
    ## species       2  10.98   5.489   47.36 <2e-16 ***
    ## Residuals   147  17.04   0.116                   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# Perform ANOVA for petal_length by species
anova_petal_length <- aov(petal_length ~ species, data = iris_data)
summary(anova_petal_length)
```

    ##              Df Sum Sq Mean Sq F value Pr(>F)    
    ## species       2  436.6  218.32    1179 <2e-16 ***
    ## Residuals   147   27.2    0.19                   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# Perform ANOVA for petal_width by species
anova_petal_width <- aov(petal_width ~ species, data = iris_data)
summary(anova_petal_width)
```

    ##              Df Sum Sq Mean Sq F value Pr(>F)    
    ## species       2  80.60   40.30   959.3 <2e-16 ***
    ## Residuals   147   6.18    0.04                   
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
library(ggplot2)

# Create univariate plots for sepal_length, sepal_width, petal_length, and petal_width
ggplot(iris_data, aes(x = sepal_length)) +
  geom_histogram(binwidth = 0.1, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Sepal Length", x = "Sepal Length", y = "Frequency") +
  theme_minimal()
```

![](IrisFlowerClassification_files/figure-gfm/Univariate%20Plots-1.png)<!-- -->

``` r
ggplot(iris_data, aes(x = sepal_width)) +
  geom_histogram(binwidth = 0.1, fill = "green", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Sepal Width", x = "Sepal Width", y = "Frequency") +
  theme_minimal()
```

![](IrisFlowerClassification_files/figure-gfm/Univariate%20Plots-2.png)<!-- -->

``` r
ggplot(iris_data, aes(x = petal_length)) +
  geom_histogram(binwidth = 0.1, fill = "orange", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Petal Length", x = "Petal Length", y = "Frequency") +
  theme_minimal()
```

![](IrisFlowerClassification_files/figure-gfm/Univariate%20Plots-3.png)<!-- -->

``` r
ggplot(iris_data, aes(x = petal_width)) +
  geom_histogram(binwidth = 0.1, fill = "red", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Petal Width", x = "Petal Width", y = "Frequency") +
  theme_minimal()
```

![](IrisFlowerClassification_files/figure-gfm/Univariate%20Plots-4.png)<!-- -->

``` r
# Scatterplot matrix
scatter_matrix <- ggplot(iris_data, aes(x = sepal_length, y = sepal_width, color = species)) +
  geom_point() +
  labs(title = "Scatterplot Matrix", color = "Species") +
  theme_minimal()

print(scatter_matrix)
```

![](IrisFlowerClassification_files/figure-gfm/Multivariate%20plots-1.png)<!-- -->

``` r
# Pairwise Scatterplot with Species color differentiation
pairwise_scatterplot <- ggplot(iris_data, aes(color = species)) +
  geom_point(aes(x = sepal_length, y = sepal_width)) +
  geom_point(aes(x = petal_length, y = petal_width)) +
  geom_point(aes(x = sepal_length, y = petal_length)) +
  geom_point(aes(x = sepal_width, y = petal_width)) +
  labs(title = "Pairwise Scatterplot with Species Color Differentiation") +
  theme_minimal()

print(pairwise_scatterplot)
```

![](IrisFlowerClassification_files/figure-gfm/Multivariate%20plots-2.png)<!-- -->

``` r
# 3D Scatterplot
three_d_scatterplot <- ggplot(iris_data, aes(x = sepal_length, y = sepal_width, z = petal_length, color = species)) +
  geom_point() +
  labs(title = "3D Scatterplot with Species Color Differentiation") +
  theme_minimal() +
  theme(legend.position = "bottom")

print(three_d_scatterplot)
```

![](IrisFlowerClassification_files/figure-gfm/Multivariate%20plots-3.png)<!-- -->

``` r
# Check for missing values in the entire dataset
any_missing_values <- any(is.na(iris_data))

# Print the result
if (any_missing_values) {
  cat("There are missing values in the Iris dataset.\n")
} else {
  cat("There are no missing values in the Iris dataset.\n")
}
```

    ## There are no missing values in the Iris dataset.

``` r
library(caTools)

# Set seed for reproducibility
set.seed(123)

# Split the data into training and testing sets
split <- sample.split(iris_data$species, SplitRatio = 0.8)
train_data <- subset(iris_data, split == TRUE)
test_data <- subset(iris_data, split == FALSE)

# Display the number of observations in each set
cat("Number of observations in the training set:", nrow(train_data), "\n")
```

    ## Number of observations in the training set: 120

``` r
cat("Number of observations in the testing set:", nrow(test_data), "\n")
```

    ## Number of observations in the testing set: 30

``` boostrapping
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
```

``` r
library(caret)
```

    ## Loading required package: lattice

``` r
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
```

    ## CART 
    ## 
    ## 120 samples
    ##   4 predictor
    ##   3 classes: 'Iris-setosa', 'Iris-versicolor', 'Iris-virginica' 
    ## 
    ## No pre-processing
    ## Resampling: Cross-Validated (5 fold) 
    ## Summary of sample sizes: 96, 96, 96, 96, 96 
    ## Resampling results across tuning parameters:
    ## 
    ##   cp    Accuracy   Kappa 
    ##   0.00  0.9416667  0.9125
    ##   0.45  0.8250000  0.7375
    ##   0.50  0.3333333  0.0000
    ## 
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final value used for the model was cp = 0.

``` r
# Repeated Cross-Validation
cv_control_repeated <- trainControl(method = "repeatedcv", number = 5, repeats = 3)  # Repeated cross-validation with 5 folds and 3 repeats

model_repeated_cv <- train(species ~ sepal_length + sepal_width + petal_length + petal_width,
                           data = train_data,
                           method = "rpart",
                           trControl = cv_control_repeated)

print(model_repeated_cv)
```

    ## CART 
    ## 
    ## 120 samples
    ##   4 predictor
    ##   3 classes: 'Iris-setosa', 'Iris-versicolor', 'Iris-virginica' 
    ## 
    ## No pre-processing
    ## Resampling: Cross-Validated (5 fold, repeated 3 times) 
    ## Summary of sample sizes: 96, 96, 96, 96, 96, 96, ... 
    ## Resampling results across tuning parameters:
    ## 
    ##   cp    Accuracy   Kappa    
    ##   0.00  0.9388889  0.9083333
    ##   0.45  0.8777778  0.8166667
    ##   0.50  0.3333333  0.0000000
    ## 
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final value used for the model was cp = 0.

``` r
# Leave-One-Out Cross-Validation (LOOCV)
cv_control_loocv <- trainControl(method = "LOOCV")  # Leave-One-Out Cross-Validation

model_loocv <- train(species ~ sepal_length + sepal_width + petal_length + petal_width,
                     data = train_data,
                     method = "rpart",
                     trControl = cv_control_loocv)

print(model_loocv)
```

    ## CART 
    ## 
    ## 120 samples
    ##   4 predictor
    ##   3 classes: 'Iris-setosa', 'Iris-versicolor', 'Iris-virginica' 
    ## 
    ## No pre-processing
    ## Resampling: Leave-One-Out Cross-Validation 
    ## Summary of sample sizes: 119, 119, 119, 119, 119, 119, ... 
    ## Resampling results across tuning parameters:
    ## 
    ##   cp    Accuracy   Kappa 
    ##   0.00  0.9500000   0.925
    ##   0.45  0.3333333   0.000
    ##   0.50  0.0000000  -0.500
    ## 
    ## Accuracy was used to select the optimal model using the largest value.
    ## The final value used for the model was cp = 0.

``` r
library(rpart)

# Set seed for reproducibility
set.seed(123)

# Split the data into training and testing sets (you can adjust this based on your preference)
split <- createDataPartition(iris_data$species, p = 0.8, list = FALSE)
train_data <- iris_data[split, ]
test_data <- iris_data[-split, ]

# Train a Decision Tree classification model
dt_model <- rpart(species ~ sepal_length + sepal_width + petal_length + petal_width, data = train_data, method = "class")

# Make predictions on the test set
predictions <- predict(dt_model, newdata = test_data, type = "class")

# Evaluate the model
confusion_matrix <- table(predictions, test_data$species)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

# Display the confusion matrix and accuracy
print("Confusion Matrix:")
```

    ## [1] "Confusion Matrix:"

``` r
print(confusion_matrix)
```

    ##                  
    ## predictions       Iris-setosa Iris-versicolor Iris-virginica
    ##   Iris-setosa              10               0              0
    ##   Iris-versicolor           0              10              2
    ##   Iris-virginica            0               0              8

``` r
cat("Accuracy:", round(accuracy, 4), "\n")
```

    ## Accuracy: 0.9333

``` r
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
```

    ## 
    ## Call:
    ## summary.resamples(object = results)
    ## 
    ## Models: DecisionTree, RandomForest, kNN 
    ## Number of resamples: 5 
    ## 
    ## Accuracy 
    ##                   Min.   1st Qu.    Median      Mean   3rd Qu.      Max. NA's
    ## DecisionTree 0.9333333 0.9333333 0.9333333 0.9533333 0.9666667 1.0000000    0
    ## RandomForest 0.9333333 0.9666667 0.9666667 0.9600000 0.9666667 0.9666667    0
    ## kNN          0.9000000 0.9666667 0.9666667 0.9666667 1.0000000 1.0000000    0
    ## 
    ## Kappa 
    ##              Min. 1st Qu. Median Mean 3rd Qu. Max. NA's
    ## DecisionTree 0.90    0.90   0.90 0.93    0.95 1.00    0
    ## RandomForest 0.90    0.95   0.95 0.94    0.95 0.95    0
    ## kNN          0.85    0.95   0.95 0.95    1.00 1.00    0

``` r
bwplot(results)
```

![](IrisFlowerClassification_files/figure-gfm/Training%20with%20resamples%20and%20model%20performance%20evaluation-1.png)<!-- -->

``` r
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
```

    ## [1] Iris-setosa
    ## Levels: Iris-setosa Iris-versicolor Iris-virginica

``` r
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
```
