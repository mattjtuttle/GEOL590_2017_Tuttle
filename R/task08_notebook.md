# Task 08 - R Notebook

# Introduction

This R Markdown Notebook has been created for as part of Task 08 for the course GEOL 590. This task is an introduction to functions, flow control, and error handling.

# Tasks

## Function tasks
* Complete this task by creating an R notebook (.Rmd file) and accompanying .md file

## Functions and error handling:
Write a function that fulfills the following criteria:

* It should be tidyverse compatible (i.e., the first argument must be a data frame)
* It should add two arbitrary columns of the data frame (specified by the user) and put them in a new column of that data frame, with the name of the new column specified by the user
* It should throw an informative warning if any invalid arguments are provided. Invalid arguments might include:
    * The first argument is not a data frame
    * Less than two valid columns are specified to add (e.g., one or both of the column names isn't in the supplied data frame) 
    * The columns specified are not numeric, and therefore can't be added - use `tryCatch()` for this
* If the columns to add aren't valid but the new column name is, the function should create a column of NA values


```r
library(tidyverse) #Loads the packages associated with the tidyverse
```

```
## Loading tidyverse: ggplot2
## Loading tidyverse: tibble
## Loading tidyverse: tidyr
## Loading tidyverse: readr
## Loading tidyverse: purrr
## Loading tidyverse: dplyr
```

```
## Conflicts with tidy packages ----------------------------------------------
```

```
## filter(): dplyr, stats
## lag():    dplyr, stats
```

```r
#Creates a function that adds two columns in a dataframe as specified above
column_addition <- function(df, col1, col2, name){
  
  #Checks that the first argument is a dataframe
  if(is.data.frame(df) != TRUE)
    stop("The first argument is not a dataframe.")
  
  #Checks that two valid columns were input as arguments for the function
  `%!in%` <- function(x,y){!(`%in%`(x,y))} #Creates a "not in" operator
  if(TRUE) #Need to fix this
    warning("One (or both) of the columns was not found in the specified dataframe.")
  
  #Checks that both columns specified are numeric
  if(is.numeric(col1) != TRUE | is.numeric(col2) != TRUE)
    warning("One of the specified columns is not numeric.")
  
  #Adds two columns and places the output in a new column within the existing dataframe
  df[[name]] <- df[[col1]] + df[[col2]] #Need to use "[[]]" notation in place of "$" notation
}

a <- mutate(mtcars, bad.col = "X")
test1 <- column_addition(mtcars, "mpg", "cyl", "added_values")
```

```
## Warning in column_addition(mtcars, "mpg", "cyl", "added_values"): One (or
## both) of the columns was not found in the specified dataframe.
```

```
## Warning in column_addition(mtcars, "mpg", "cyl", "added_values"): One of
## the specified columns is not numeric.
```


## Loop and performance metric tasks
* Write a function named that uses a for loop to calculate the sum of the elements of a vector, which is passed as an argument (i.e., it should do the same thing that `sum()` does with vectors). `your_fun(1:10^4)` should return 50005000.
* Use the `microbenchmark::microbenchmark` function to compare the performace of your function to that of `sum` in adding up the elements of the vector `1:10^4`. The benchmarking code should look something like:
```
test.vec <- 1:10^4
microbenchmark(
    my_sum(test.vec),
    sum(test.vec)
    )
```
Is there a difference? Why?


