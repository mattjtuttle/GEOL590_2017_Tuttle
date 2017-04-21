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
  if(col1 %!in% colnames(df) | col2 %!in% colnames(df))
    warning("One (or both) of the columns was not found in the specified dataframe.")
  
  
  tryCatch(
    
    #Adds two columns and places the output in a new column within the existing dataframe
    {
    add_col <- lazyeval::interp(~ a + b, a = as.name(col1), b = as.name(col2))
    df %>% mutate_(.dots = setNames(list(add_col), name)) #Needed to use standard evaluation functions
    },
    
    #Checks that both columns specified are numeric. If not, returns NA
    #"[[]]" not "$" notation required for selecting column names as argument
    warning = if(is.numeric(df[[col1]]) != TRUE | is.numeric(df[[col2]]) != TRUE){
      message("One of the specified columns is not numeric.")
      na_col <- mutate_(df, .dots = setNames(list(NA), name))
      return(na_col)
      
  })
}

#Inculded to test code in development
test1 <- column_addition(mtcars, "mpg", "cyl", "added_values") #Checks normal adding
na_mtcars <- mutate(mtcars, new = NA)
test2 <- column_addition(na_mtcars, "mpg", "new", "added_values") #Checks adding when a column is "bad"
```

```
## One of the specified columns is not numeric.
```


## Loop and performance metric tasks
* Write a function named `my_sum` that uses a for loop to calculate the sum of the elements of a vector, which is passed as an argument (i.e., it should do the same thing that `sum()` does with vectors). `your_fun(1:10^4)` should return 50005000.
* Use the `microbenchmark::microbenchmark` function to compare the performace of your function to that of `sum` in adding up the elements of the vector `1:10^4`. The benchmarking code should look something like:
```
test.vec <- 1:10^4
microbenchmark(
    my_sum(test.vec),
    sum(test.vec)
    )
```
Is there a difference? Why?


```r
#Does the same thing as the sum() function using a for loop
my_sum <- function(vec){
  adding.vector <- 0
  for (num in vec){
    adding.vector = adding.vector + num
  }
  return(adding.vector)
}

#Compares the functions of sum() and my_sum()
test.vec <- 1:10^4
microbenchmark::microbenchmark(
  my_sum(test.vec),
  sum(test.vec)
)
```

```
## Unit: microseconds
##              expr     min       lq       mean   median       uq      max
##  my_sum(test.vec) 4239.57 4437.326 5517.65107 5290.658 6299.757 9617.593
##     sum(test.vec)    7.45    8.804   15.42792   12.868   16.931  182.180
##  neval
##    100
##    100
```

```r
#Included to test code development
test2 <- my_sum(1:10^4)
test3 <- sum(1:10^4)
print(test2)
```

```
## [1] 50005000
```

```r
print(test3)
```

```
## [1] 50005000
```

One difference between the `sum()` function and the `my_sum` function, as indicated by the microbenchmark test, is that the for loop of `my_sum` takes more computing time to calculate its sum when compare the `sum()` function. This is due to the fact that for loops are inherently slow and the `sum()` function of base R has been optimized for speed. Additionally, in the example code given above, the `sum()` function is able to work with and return an integer while the `my_sum()` function must return a double.
