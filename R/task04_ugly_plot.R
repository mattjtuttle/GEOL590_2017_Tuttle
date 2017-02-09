#Loads the ggplot package
library(ggplot2)

#creates subset of diamond dataframe (only used for testing)
set.seed(1410)
dsmall <- diamonds[sample(nrow(diamonds), 100), ]

#Creates an ugly, unreadable plot
#Assigns the plot to variable x for ease of testing plot in the console
#Plots price vs carats with the color of datapoints assigned to cut
x <- ggplot(diamonds, aes(carat, price, color = cut)) +
  
  #creates sqrt fit of data, coes first so that it is underneath the scatterplot data
  stat_smooth(method = "lm", formula = y~sqrt(x), size = 3, color = "brown", linetype = 1, show.legend = TRUE, fullrange = TRUE, span = 0.1) +
  
  #Creates a scatterplot of data
  geom_point(shape = "square", size = 8) +
  
  #facets data by clarityy and moves label
  facet_wrap(~clarity, strip.position = c("left")) +
  
  #Assigns title text to plot
  ggtitle("price as a function of color", subtitle = "OF DIAMONDS DATASET") +
 
  #Assigns fixed (continuous) scales for axes
  scale_x_continuous(limits = c(0, 5), position = "top") +
  scale_y_continuous(limits = c(-1000, 25000), position = "right") +
  
  #Assigns theme to plot to change layout, sizes, and colors
  theme(
    text = element_text(color = "yellow"),
    axis.text = element_text(size = 8, color = "yellow"),
    legend.key = element_rect(fill = "navy"),
    legend.background = element_rect(fill = "red"),
    legend.position = c(0.14, 0.80),
    legend.text = element_text(color = "orange", size = 40),
    panel.grid.major = element_line(color = "grey40", size = 4),
    panel.grid.minor = element_line(color = "green", size = 2),
    panel.background = element_rect(fill = "blue"),
    plot.background = element_rect(fill = "pink"),
    strip.text = element_text(size = 40, color = "yellow"),
    strip.background = element_rect(fill = "orange", color = "blue", size = 2),
    plot.title = element_text(color = "orange")
  )