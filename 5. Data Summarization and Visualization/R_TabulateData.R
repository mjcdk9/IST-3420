##############################################################
# Data Analysis - Tabulate Data                              #
# IST 3420-Intro to Data Science & Management, Cui Zou       #
##############################################################

# Clean the environment
rm(list = ls())

###### Tabulate A Single Variable ######

## Part 1. Tabulate Qualitative Data ##

# Calculate frequency
gear.freq <- table(mtcars$gear)
gear.freq

cbind(gear.freq)  # Print frequency in column format

# Calculate relative frequency
gear.rel.freq <- gear.freq/nrow(mtcars)
gear.rel.freq

cbind(gear.rel.freq)  # Print relative frequency

cbind(gear.freq, gear.rel.freq)  # Print frequency and relative frequency


## Part 2. Tabulate Quantitative Data ##

mpg <- mtcars$mpg

# Calculate range
range(mpg)

# Determine break points
breaks <- seq(10,35, by = 5)
breaks

# Classify observations into sub-intervals
mpg.cut <- cut(mpg, breaks, right = FALSE)

# Calculate frequency in each sub-interval
mpg.freq <- table(mpg.cut)
mpg.freq
cbind(mpg.freq)  # Print in column format

# Calculate cumulative frequency
mpg.cum.freq = cumsum(mpg.freq)
mpg.cum.freq
cbind(mpg.cum.freq)

# Calculate relative frequency
mpg.rel.freq <- mpg.freq/nrow(mtcars)
mpg.rel.freq
cbind(mpg.rel.freq)

# Calculate cumulative relative frequency
mpg.cum.rel = cumsum(mpg.rel.freq)
mpg.cum.rel
cbind(mpg.cum.rel)

# Print all in column format
cbind(mpg.freq, mpg.cum.freq, mpg.rel.freq, mpg.cum.rel)


###### Tabulate Multiple Categorical Variables ######

# Create a two-way frequency table
cyl_gear <- table(mtcars$cyl,mtcars$gear)
cyl_gear

# Calculate table margin
margin.table(cyl_gear,1)
margin.table(cyl_gear,2)

# Create a three-way frequency table
cyl_gear_carb <- table(mtcars$cyl,mtcars$gear, mtcars$carb)
cyl_gear_carb
ftable(cyl_gear_carb) # Print as flat contingency table

# Use xtabs() to create contingency tables
xtabs(~ cyl + gear, data = mtcars)
ftable(xtabs(~ cyl + gear + carb, data = mtcars))


###### Tabulate Categorical and Quantitative Variables ######

## Cross tabulate mpg and cylinder ##
car1 <- mtcars

range(car1$mpg)
break1 <- seq(10,35, by = 5)
break1

# Create factor variable "mpg.cut" by cutting quantitative variable "mpg"
car1$mpg.cut <- cut(car1$mpg, break1, right = FALSE)
str(mtcars)
str(car1)

xtabs(~ mpg.cut + cyl, data = car1)
