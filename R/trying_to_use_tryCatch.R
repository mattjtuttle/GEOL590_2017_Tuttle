library(tidyverse) #Loads the packages associated with the tidyverse

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