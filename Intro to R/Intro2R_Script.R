##############################################################
# IST 3420-Intro to Data Science & Management                #
# INTRODUCTION TO R                                          #
# Cui Zou                                                    #
##############################################################

# Use "?" to search help
? ls
? pi
help(ls)
help.search("linear model")


# Simple R expressions
3+5
3-5
3*5
7/3
2^3
8^(1/3)

# Inf, NaN, and NULL
1/0
0/0
1/0 + 1/0
1/0 - 1/0
sin(Inf)
dim(1) # 1 is treated as a vector with only one element. Dimensions of vectors do not exist. 

# Logical expressions
1.5 < 3.1
-5 >= -3
T == TRUE  # T is shorthand for TRUE
F != TRUE  # F is shorthand for FALSE
F == false  # R is case sensitive


# Use variables
x <- 3/2
ls()
class(x)
y <- "Hello R!"
ls()
class(y)
z <- F
class(z)
x  # Print the value of variable x
z
ls()
rm(x)  # Remove object x
ls()
class(ls)

x <-4
x
sqrt(x)
class(x)
class(sqrt)

# Functions
sqrt(16)
exp(1)
log(1)
log(0)
pi
cos(pi)
sum(1,2,3)
sum(1:4)
"Hello R!"
rep("Hello R!",4)
help(rep)
example(rep)

Sys.time()  # Show current time
Sys.Date()  # Show today's date
Sys.info()  # Show system and user info


# Environment
rm(list=ls())  # Clean the workspace
getwd()  # Get the current directory
setwd()	 # Set the current directory
list.files()  # List files under the current directory
dir()  # Another function
dir("c://")

# Packages
#   The basic syntax is:
#   install.packages("package-name")  # Install package with the name
#   remove.packages("package-name")  # Remove package with the name
#   library("package-name")  # Load packages previously installed

install.packages("XML")
library("XML")
detach("package:XML", unload=TRUE)  # Unload the package
