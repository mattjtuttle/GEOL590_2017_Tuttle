###Makes a simple plot and saves it in the plots folder###

#Loads the ggplot package
library(ggplot2)

#Creates a smaller subset of the diamonds dataset
set.seed(1410)
dsmall <- diamonds [sample(nrow(diamonds), 100), ]

#Makes the plot comparing price to carat from the dsmall subset of the diamonds dataset
plot <- ggplot(dsmall, aes(price, carat)) +
  geom_point(shape = 15, color = "red", size = 3) +
  theme(
    text = element_text(color = "navy", size = 20),
    panel.background = element_rect(fill = "black")
  )

#Prints the plot
print(plot)

#Saves the plot to the plots folder
ggsave(filename =  "plots/task05_plot.png", plot = plot)