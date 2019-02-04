data <- read.csv("/Users/dori/Documents/Challenge/twitter_query.csv") 
data <- data[-c(1,4,5)]
data <- data[order(data$state),]
data$num <- 1
data$day <- substr(data$date, 1, 10)

data_st <- aggregate(data$num ~ data$state + data$party, FUN = sum)
colnames(data_st) <- c("state", "party", "number")
par(mar = c(7.5,4,4,2))
barplot(data_st$number, names.arg = data_st$state, col = c("blue", "red")[data_st$party], main = "State analysis \n(27 Jan - 2 Feb)", space = 0.75, las = 2)
#legend("topright", legend = c("Democrats", "Republicans"), fill = c("blue", "red"), cex = 0.8,  box.lty = 0, inset = c(0,-0.1))

data_dy <- aggregate(data$num ~ data$day, FUN = sum)
colnames(data_dy) <- c("day", "number")
par(mar = c(5,4,4,2))
barplot(data_dy$number, names.arg = data_dy$day, las = 2)

data_dy2 <- data.frame(number = c(64, 77, 95, 427, 715, 543, 554, 401), day = c("Jan 26", "Jan 27", "Jan 28", "Jan 29", "Jan 30", "Jan 31", "Feb 01", "Feb 02")) 
barplot(data_dy2$number, names.arg = data_dy2$day, col = "Deep Sky Blue", main = "Number of Tweets per day", density = 35, las = 2)
