####
# This is an R script to demonstrate some basic operations in R
####

# Make three vectors

x <- seq(from=1, to=20, length.out=10)
y <- rnorm(10)
labels <- letters[10]

d <- data.frame(x, y, labels)

# Save a plot
png("test_plot.png", height=3, width=4, units="inches", res=300)
plot (x, y)
dev.off()

# Save a .csv file with the data
write.csv("test_data.csv")