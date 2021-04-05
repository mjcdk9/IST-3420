##############################################################
# Data Analysis - Basic Graphs                               #
# IST 3420-Intro to Data Science & Management, Cui Zou       #
##############################################################

# Clean the environment
rm(list = ls())

###### Basic Graphs ######

## Simple Bar Plots ##
car.cyl <- table(mtcars$cyl) # Create cross tabulation
car.cyl
str(car.cyl)

# A simple bar plot
# Note that columns of the table are plotted on x-axis 
barplot(car.cyl)

# A simple bar plot with more details
barplot(car.cyl, 
        main = "Distribution of Car Cylinders", 
        xlab = "Number of Cylinders",
        names.arg = c("4 Cylinders", "6 Cylinders", "8 Cylinders"),
        col = rainbow(3))

## Stacked Bar Plots ##
cyl.gear <- table(mtcars$cyl,mtcars$gear)
cyl.gear
str(cyl.gear)

# Note again that columns of the table are plotted on x-axis 
barplot(cyl.gear,
        main="Distribution of Cylinders by Gear",
        xlab="Number of Gears",
        ylab = "Number of Cylinders",
        col=rainbow(3),
        legend = rownames(cyl.gear))

# Question: How can we draw a stacked bar plot for the distribution of gears by cylinders

## Grouped Bar Plots ##
barplot(cyl.gear,
        main="Distribution of Cylinders by Gear",
        xlab="Number of Gears",
        ylab = "Number of Cylinders",
        col=rainbow(3),
        legend = rownames(cyl.gear),
        beside=TRUE)



## Pie Plot ##
car.cyl <- table(mtcars$cyl)
car.cyl
pie(car.cyl)
lb1 <- paste(names(car.cyl), " cylinders\n", car.cyl, sep="")
lb1

pie(car.cyl,
    labels = lb1,
    main="Pie Chart of Cylinders\n (with count of cars)",
    col=rainbow(length(lb1))
)

# Calculate percentage 
pct <- round(car.cyl/sum(car.cyl)*100, digits = 1)
pct
lb2 <- paste(names(car.cyl), " cylinders\n", paste(pct,"%"), sep="")
lb2
pie(car.cyl,
    labels = lb2,
    main="Pie Chart of Cylinders",
    col=rainbow(length(lb2))
)



## Dot Plots ##

# A simple dot plot
?dotchart
dotchart(mtcars$mpg,
         labels = row.names(mtcars),
         cex = 0.6,
         main="Gas Milage",
         xlab = "MPG")

# A dot plot with grouped elements
x <- mtcars[c("mpg","cyl")]
x
x <- x[order(x$mpg),]
x

x$color <- x$cyl
x
x$color <- dplyr::recode(x$color,`4` = "red", `6` = "green", `8` = "blue")
x
x$cyl <- as.factor(x$cyl) # In order to show factor label in dotchart
str(x)

dotchart(x$mpg,
         labels = row.names(x),
         cex = 0.6,
         main="Gas Milage\nGrouped by Cylinder",
         xlab = "MPG",
         groups = x$cyl,
         color = x$color)



## Box Plots ##

# Five-Number Summary
z1 <- c(23,12,24,55,60,34,20,17,19,37,43,51)
z1[order(z1)] # Sort data
quantile(z1,type = 7)  # Default type 
quantile(z1,type = 2)  # Simple manual caculation method
?quantile

# Box plot of a variable
set.seed(1)
x1 <- rnorm(100, mean = 5, sd = 2)
x1[88] <- 12; x1[89] <- 11.8  # Set two outliers
quantile(x1)

boxplot(x1)
boxplot(x1,notch=TRUE)  # Draw a notch in each side of the box

# Box plot of a variable by group
boxplot(mpg ~ cyl, data = mtcars,
        main = "Mileage by Cylinder")

boxplot(mpg ~ cyl*am, data = mtcars,
        main = "Mileage by Cylinder and Transmission",
        col = rainbow(3))

## Line Charts ##

x <- c(0:10); y <- x^2; z <- 100-y # create data to plot

plot(x,y) # Create a plot with default parameters

plot(x,y,type = "o") # Create a plot with overplotted points and lines

# Use plot() to create a plot without points and lines, then use lines(x,y) to add points and lines
plot(x,y,type = "n", main = "A Line Chart", ylab = "y and z")
lines(x,y,type = "o", col = "green")
lines(x,z,type = "o", col = "blue")
legend(6,95,legend = c("y","z"),lty=c(1,1),col=c("green","blue"))



## Density Plots ##

# Histograms
par(mfrow=c(2,1)) # Only show 2*1 plots on a page

hist(mtcars$mpg)

hist(mtcars$mpg,
     main = "Distribution of MPG",
     xlab = "MPG",
     probability = TRUE)
# Add a normal curve
curve(dnorm(x, mean=mean(mtcars$mpg),
            sd=sd(mtcars$mpg)),
      col="blue",
      add=TRUE)

par(mfrow=c(1,1))

# Set different number of bins
range(mtcars$mpg) # Range of mpg: 10.4~33.9

par(mfrow=c(2,2)) # Only show 2*2 plots on a page
hist(mtcars$mpg, main = "3 Bins",
     breaks = seq(10,34, l= 4))

hist(mtcars$mpg, main = "5 Bins",
     breaks = seq(10,34, l= 6))

hist(mtcars$mpg, main = "10 Bins",
     breaks = seq(10,34, l= 11))

hist(mtcars$mpg, main = "20 Bins",
     breaks = seq(10,34, l= 21))

par(mfrow=c(1,1))


# Kernel density plot
dst <- density(mtcars$mpg) # Calculate kernel density estimate
plot(dst, type = "n", main = "Kernel Density Estimate of MPG")
polygon(dst, col = "wheat")



## Scatter Plots ##
plot(mtcars$mpg, mtcars$wt,
     xlab="MPG", ylab="Weight")
abline(lm(mtcars$wt~mtcars$mpg), col="red") # Add regression fit line (y~x)
lines(lowess(mtcars$mpg,mtcars$wt), col="blue") # Add lowess fit line (x,y)

# Scatterplot Matrix
pairs(~mpg+disp+hp+wt,data=mtcars, 
      main="A Scatterplot Matrix")

# Simulate different patterns of relationship between x and y

set.seed(1)
x <- runif(100,min = 0, max = 10)
y <- x + 0.3 + rnorm(100, mean = 0, sd = 1)
plot(x,y, main = "Positive Relationship")
abline(lm(y~x),col = "blue")

set.seed(1)
y <- 10 - x + rnorm(100, mean = 0, sd = 1)
plot(x,y, main = "Negative Relationship")
abline(lm(y~x),col = "blue")

set.seed(1)
y <- x^2 - 10*x + 25 + rnorm(100, mean = 0, sd = 1)
plot(x,y, main = "Curvilinear Relationship")
lines(lowess(x,y), col="blue")

set.seed(8)
y <- rnorm(100, mean = 5, sd = 1.4)
plot(x,y, main = "No Relationship")
abline(lm(y~x),col = "blue")
