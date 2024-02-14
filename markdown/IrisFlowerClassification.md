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
