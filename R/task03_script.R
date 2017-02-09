#################################################
##### Simple operations and data structures #####
#################################################

### This code belongs to the first question on task 03
a <- 1
b <- 2
c <- a + b

set.seed(0)
d <- rnorm(20)
e <- rnorm(20)
f <- d + e
# a-f are all double vectors


### Three ways to make data analysis more reproducible using attributes:
# 1. To provide descriptive metadata about objects so that they are more easily understood by others who may work with the data.
# 2. To define factors so that only data that corresponds with that particular factor will be included in the data analysis.
# 3. To assign a date to a given dataset.


### Creates a vector of length five and gives this vector 2 attributes
g <- c(1, 2, 3, 4, 5)
attr(g, "attribute1") <- "This vector is atomic."
attr(g, "attribute2") <- "This is a second attribute."


### AR 2.2.2.2: "What happens to a factor when you modify its levels?"
f1 <- factor(letters)
levels(f1) <- rev(levels(f1))
# When you modify the levels of a factor, it changes the values that are allowed to be present in the factor. In this case, the above code creates the factor f1 and reverses the order of both the vector and levels that make up the factor.


### AR 2.2.2.3: What does this code do?
f2 <- rev(factor(letters))
f3 <- factor(letters, levels = rev(letters))
# This code creates two factors of the letters of the alphabet. Factor f2's vector component is reversed while factor f3's levels component is reversed.


### AR 2.3.1.1: What does `dim` return when applied to a vector, **and why**?
# Dim returns NULL when aplied to a vector because vectors are a one-dimensional data structure.


### AR 2.4.5.1: What attributes does a data frame possess?
# A dataframe the attributes names, row.names, and class.


### AR 2.4.5.2: What does `as.matrix()` do when applied to a dataframe with columns of different types?
dataframe1 <- data.frame(
  x = 1:3,
  y = c("a", "b", "c"),
  stringsAsFactors = FALSE)
matrix1 <- as.matrix(dataframe1)
# This function creates a matrix out of the data in the dataframe.


### AR 2.4.5.3: Can you have a data frame with 0 rows? What about 0 columns?
dataframe2 <- data.frame()
# Yes.


#############################
##### Simple operations #####
#############################

fluorescence1 <- read.csv(file = "~/Projects/GEOL_590/data/2016_10_11_plate_reader.csv")
fluorescence2 <- read.csv(file = "~/Projects/GEOL_590/data/2016_10_11_plate_reader.csv", skip = 33)
# The optional argument "skip = 33" ignores the first 33 rows of the spreadsheet and only uses data from the 34th row onward.
# A dataframe was created by importing this data. The columns of the object are each vectors.

library(tidyverse)
fluorescence3 <- read_csv(file = "~/Projects/GEOL_590/data/2016_10_11_plate_reader.csv", skip = 33)
# When the tidyverse packages is loaded and the file is read, the output looks the same.


######################
##### Subsetting #####
######################

### Looking at the dataframe "mtcars", a dataset that comes with R:
# "nrow(mtcars)" gives the output 32. This function measures the number of rows mtcars has.
# "length(mtcars)" gives the output 11. This function measures the length of objects. In this case length is a measure of the number of columns. Normally this function ot used on dataframes.
# "ncol(mtcars)" gives the output 11. This function measures the number of columns mtcars has.


# Creates a vector that is the "cyl" column of "mtcars" two ways
cyl1 <- mtcars$cyl
cyl2 <- mtcars[, 2]


# Creates a dataframe with cars in mtcars that have less than 3 or more than 4 cylinders
wt.mtcars <- mtcars[mtcars$cyl < 3 | mtcars$cyl > 4, ]


# Creates a dataframe that contains all rows but only the mpg and wt columns
mpg.and.wt <- data.frame(mtcars$mpg, mtcars$wt)


# Creates a dataframe that only contains cars that get gas milage equal to the median of the dataset
median.cars <- mtcars[mtcars$mpg == median(mtcars$mpg), ]


### AR 3.1.7.1 Fix the following common subsetting errors:
# mtcars[mtcars$cyl = 4, ] # Trying to create a data frame of cars with 4 cylinders only
# mtcars[-1:4, ]
# mtcars[mtcars$cyl <= 5]
# mtcars[mtcars$cyl == 4 | 6, ] # The | is an 'or' operator - you want a data frame of cars with 4 OR 6 cylinder engines

AR1 <- mtcars[mtcars$cyl == 4, ]
AR2 <- mtcars[2:4, ]
AR3 <- mtcars[mtcars$cyl <= 5, ]
AR4 <- mtcars[mtcars$cyl == 4 | mtcars$cyl == 6, ]