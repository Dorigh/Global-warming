library(sf)
us_map <- st_read("files/states.shp")

# Tweet area
states_map <- us_map[which(!us_map$STATE_ABBR %in% c("HI", "AK")),]
st_demo <- c("CA", "CO", "CT", "DE", "IL", "ME", "MD", "MA", "MN", "NV", "NH", "NJ", "NY", "OR", "RI", "VA","WA")
states_demo <- us_map[which(us_map$STATE_ABBR %in% st_demo),]

data <- read.csv("files/States.csv")
sf_data<- st_as_sf(data, coords = c("Lon", "Lat"))
buffer <- st_buffer(sf_data, dist = 1.6) # unit 100km

plot(st_geometry(states_map), col = "Violet", main = "Tweets area")
plot(st_geometry(states_demo), add = T, col = "Deep Sky Blue")
plot(st_geometry(buffer), add = T, col = "snow")
plot(st_geometry(sf_data), add = T, cex = 0.5, pch = 19)
legend("bottomleft", legend = c("Democratic states", "Republican states"), fill = c("Deep Sky Blue","Violet"), cex = 0.8, pt.cex = 0.7, box.lty = 0, bg = rgb(0,0,0,0))

# Analytical plots
data <- read.csv("files/twitter_query.csv") 
data <- data[-c(1,4,5)]
data <- data[order(data$state),]
data$num <- 1
data$day <- substr(data$date, 1, 10)

data_st <- aggregate(data$num ~ data$state + data$party, FUN = sum)
colnames(data_st) <- c("state", "party", "number")
par(mar = c(7.5,4,4,2))
barplot(data_st$number, names.arg = data_st$state, col = c("blue", "red")[data_st$party], main = "State analysis \n(27 Jan - 2 Feb)", space = 0.75, las = 2)

data_dy <- aggregate(data$num ~ data$day, FUN = sum)
colnames(data_dy) <- c("day", "number")
par(mar = c(5,4,4,2))
data_dy <- data.frame(number = c(64, 77, 95, 427, 715, 543, 554, 401), day = c("Jan 26", "Jan 27", "Jan 28", "Jan 29", "Jan 30", "Jan 31", "Feb 01", "Feb 02")) 
barplot(data_dy$number, names.arg = data_dy$day, col = "Deep Sky Blue", main = "Number of Tweets per day", density = 35, las = 2)


