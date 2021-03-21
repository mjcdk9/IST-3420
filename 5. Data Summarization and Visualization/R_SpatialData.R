##############################################################
# Data Analysis - Visualizing Spatial Data                   #
# IST 3420-Intro to Data Science & Management, Cui Zou       #
##############################################################

# Clean the environment
rm(list = ls())

###### Visualize Spatial Data ######

# Create a data frame of map data for all states
# install.packages("maps") # Install the maps package if the next statement suggests you to do so
us_states <- ggplot2::map_data("state")
head(us_states)

# Show the list of regions
unique(us_states$region)  # 49 states
# Number of groups
nrow(table(us_states$group))  # 63 groups

aggregate(us_states, by = list(us_states$region), FUN = mean)

# Select Missouri data
mo <- us_states[which(us_states$region=="missouri"),]
mo2 <- dplyr::filter(us_states,region=='missouri')
mo # long:longitude, lat:latitude

# Plot the shape of Missouri state
plot(mo$long,mo$lat)

# A better plot of the shape
plot(mo$long,mo$lat, type = "l")

# Add more details
plot(mo$long,mo$lat, type = "n") # Draw a blank plot
polygon(mo$long,mo$lat, col = "green") # Add polygon
points(-91.774069, 37.954234, col = "red") # Add MST location
text(-91.774069, 37.954234,"MST", pos = 3, cex = 0.6) # Label the location


# Draw boundaries for all states
plot(us_states$long,us_states$lat, type = "n")
col_set = rainbow(63)
for (i in unique(us_states$group)){
  state <- us_states[which(us_states$group == i),]
  polygon(state$long,state$lat, col = col_set[i])
}

plot(us_states$long,us_states$lat, type = "l")

# Use map() function in "maps" package
maps::map(database = "state",region = "missouri", fill = TRUE, col = "green")
maps::map(database = "state", fill = TRUE, col = heat.colors(49))
maps::map(database = "state", fill = TRUE, col = topo.colors(49))
maps::map(database = "state", fill = TRUE, col = terrain.colors(49))
maps::map(database = "state", fill = TRUE, col = cm.colors(49))
maps::map(database = "usa")
maps::map(database = "county")

maps::map(database = "world")
maps::map(database = "world2")
