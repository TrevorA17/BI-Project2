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
