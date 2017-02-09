###Evaluation of published plot
#

#Loads the ggplot package
library(ggplot2)

#Counts the number of rows in the diamonds and prints to the console 
print(nrow(diamonds))

#Chooses a specific state of random number generation which can later be used with the sample function to always give a consistant subset
set.seed(1410)

#Sets the variable "dsmall" as a tibble (trimmed dataframe) that contains a subset of the dataframe "diamonds"
dsmall <- diamonds[sample(nrow(diamonds), 100), ]

#Uses "dsmall" to create a scatterplot of y vs x that is colored by z value and faceted (broken up) by cut
plot1 <- ggplot(dsmall, aes(x, y, color = z)) +
  geom_point() +
  facet_wrap(~cut)

#Creates a scatterplot of price vs carat, colored by cut, and smoothed (using method lm without confidence intervals)
plot2 <- ggplot(dsmall, aes(carat, price, color = cut)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

#Creates a density plot of carat, faceted and colored by clarity
plot3 <- ggplot(dsmall, aes(carat, color = clarity)) +
  geom_density() +
  facet_wrap(~clarity)

#Creates a boxplot of price as a function of cut
plot4 <- ggplot(dsmall, aes(cut, price)) +
  geom_boxplot()

#Creates a scatterplot of y versus x with red points, a blue dashed smoothing line, and custom x and y axis labels
plot5 <- ggplot(dsmall, aes(x, y,)) +
  geom_point(color = "red") +
  geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = 2)+
  labs(x = "x, in mm", y = "y, in mm")
  