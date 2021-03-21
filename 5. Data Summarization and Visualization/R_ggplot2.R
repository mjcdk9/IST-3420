##############################################################
# Data Analysis - Visualizing Data Using ggplot2 Package     #
# IST 3420-Intro to Data Science & Management, Cui Zou       #
##############################################################

# Clean the environment
rm(list = ls())

###### Visualize Data Using ggplot2 Package ######
library(ggplot2)

str(mtcars)



## Quick Plotting ##

# Use default geoms
qplot(mpg, data = mtcars)
qplot(mpg, data = mtcars, geom="histogram")
# geom defaults to "point" if x and y are specified, and "histogram" if only x is specified.

qplot(mpg, wt, data = mtcars)
qplot(mpg, wt, data = mtcars, colour = cyl)
qplot(mpg, wt, data = mtcars, size = cyl)
qplot(mpg, wt, data = mtcars, facets = vs ~ am)

# Use different geoms
qplot(mpg, data = mtcars, geom = "density")
qplot(mpg, data = mtcars, geom = "dotplot")
qplot(cyl, mpg, data = mtcars, geom = "boxplot")
qplot(cyl, data = mtcars, geom = "bar")
qplot(mpg, wt, data = mtcars, geom = c("path","point"))
qplot(mpg, wt, data = mtcars, geom = "smooth")
qplot(mpg, wt, data = mtcars, geom=c("point", "smooth"))
qplot(mpg, wt, data = mtcars, geom=c("point", "smooth"), color = factor(cyl))
qplot(mpg, wt, data = mtcars, geom=c("point", "smooth"), shape = factor(cyl))

qplot(cyl, wt, data = mtcars, geom = c("boxplot", "point"))
qplot(factor(cyl), wt, data = mtcars, geom = c("boxplot", "jitter"))

## Use theme to customize display ##
p <- qplot(factor(cyl), wt, data = mtcars, geom = c("boxplot", "jitter"), fill = cyl)
# Use print(p) or simply use "p" to show the graphy p
print(p) 
p
# Use "+" to chain ggplot2 functions to draw the final graph
p + theme_bw()

p + theme_classic()

p + theme_bw() + 
  theme(axis.title=element_text(face="bold.italic", size="14", color="blue"),
        legend.position="bottom")



## Use ggplot() to Plot ##

# Construct basic plot
p1 <- ggplot(data = mtcars, aes(x = wt, y = mpg))
p2 <- ggplot(data = mtcars, aes(x = cyl, y = mpg))

# Plot points with default display style
p1 + geom_point()
p2 + geom_boxplot()

# Use different display
p1 + geom_point(size = 4)

p1 + geom_point(col = "blue")

p1 + geom_point(aes(col = cyl))

p1 + geom_point(col = "blue") + geom_line()

# Add smoothing line (by default using loess smoothing method)
p1 + geom_point(col = "blue") + geom_smooth()

# Add smoothing line using linear regression method
p1 + geom_point(col = "red") + geom_smooth(method = "lm")
p1 + geom_point(col = "red") + geom_smooth(method = "lm", se = FALSE)
p1 + geom_point(col = "red") + geom_smooth(method = "lm", se = FALSE) + theme_bw()

p1 + geom_point(aes(col = factor(cyl))) + 
  geom_smooth(method = "lm", se = FALSE) + theme_bw() +
  labs(title = "Relationship between Weight and MPG", x="Weight", y = "Miles per Gallon") +
  scale_color_discrete(name = "", labels = c("4 cylinders","6 cylinders", "8 cylinders"))

p1 + geom_point(aes(col = factor(am))) + 
  geom_smooth(method = "lm", se = FALSE) + theme_bw() +
  labs(title = "Relationship between Weight and MPG", x="Weight", y = "Miles per Gallon") +
  scale_color_discrete(name = "Tansmission")
