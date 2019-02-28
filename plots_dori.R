library(sf)
library(maps)

# Tweet area
data_states <- read.csv("/Users/dori/Documents/Challenge/States.csv")
sf_data<- st_as_sf(data_states, coords = c("Lon", "Lat"))
buffer <- st_buffer(sf_data, dist = 1.6) # unit 100km
st_demo <- c("CA", "CO", "CT", "DE", "IL", "ME", "MD", "MA", "MN", "NV", "NH", "NJ", "NY", "OR", "RI", "VA","WA")

par(mar = c(5,2,3,2))
map("state", plot = T, fill = TRUE, col = "Violet", lwd = 0.6)
map("state", regions = st_demo, add = T, fill = T, col = "Deep Sky Blue", lwd = 0.6)
plot(st_geometry(buffer), add = T, col = "snow", lwd = 0.7)
plot(st_geometry(sf_data), add = T, cex = 0.5, pch = 20)
title("Tweets Area", cex.main = 0.9)
legend("bottomleft", legend = c("Democratic states", "Republican states"), fill = c("Deep Sky Blue","Violet"), cex = 0.8, pt.cex = 0.7, box.lty = 0, bg = rgb(0,0,0,0))

# Analytical plots
data <- read.csv("/Users/dori/Documents/Challenge/twitter_query_28Feb.csv") # output of tweet.py
data <- data[-c(1,4,5)]
data <- data[order(data$state),]
data$num <- 1
data$day <- substr(data$date, 4, 10)

data_st <- aggregate(data$num ~ data$state + data$party, FUN = sum)
colnames(data_st) <- c("state", "party", "number")
par(mar = c(7.5,4,4,2))
barplot(data_st$number, names.arg = data_st$state, col = c("blue", "red")[data_st$party], main = "State analysis \n(28 Feb - 23 Feb)", space = 0.75, las = 2)

data_day <- aggregate(data$num ~ data$day, FUN = sum)
colnames(data_day) <- c("day", "number")
par(mar = c(5,4,4,2))
barplot(data_day$number, names.arg = data_day$day, col = "Deep Sky Blue", main = "Number of Tweets per day", density = 35, las = 2)

