# Basic idea to read the file modified from Peter H's post
# on the discussion forums
# https://class.coursera.org/exdata-002/forum/thread?thread_id=19
# Thanks Peter

# data file
f <- gzfile("household_power_consumption.txt.gz","rt");

# read lines that match on dates
nolines <- 100
greped<-c()
repeat {
  lines=readLines(f,n=nolines)       #read lines
  idx <- grep("^[12]/2/2007", lines) #find those that match
  greped<-c(greped, lines[idx])      #add the found lines

  if(nolines!=length(lines)) {
    break #are we at the end of the file?
  }
}
close(f)


# now we create a text connection and load data
tc<-textConnection(greped,"rt") 
df<-read.table(tc,sep=";", col.names = colnames(read.table(
  "household_power_consumption.txt.gz",
  nrow = 1, header = TRUE, sep=";")), na.strings = "?")

# convert Date and Time variables to Date/Time classes
df$Date <- as.Date(df$Date , "%d/%m/%Y")
df$Time <- paste(df$Date, df$Time, sep=" ")
df$Time <- strptime(df$Time, "%Y-%m-%d %H:%M:%S")

# Using transparent background here to match the images in the reference repository
# and images on the project rubric have a transparent background
# Discussion @ https://class.coursera.org/exdata-002/forum/thread?thread_id=46
# But in peer review I plan to give full credit for both white and transparent background

# output to png the Energy Sub Metering vs vs Days plot
png("plot3.png", width = 504, height = 504, bg = "transparent")
ylimits = range(c(df$Sub_metering_1, df$Sub_metering_2, df$Sub_metering_3))
plot(df$Time, df$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black")
par(new = TRUE)
plot(df$Time, df$Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")
par(new = TRUE)
plot(df$Time, df$Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       #bg = "transparent",
       #bty = "n",
       lty = c(1,1,1),
       col = c("black", "red", "blue")
)
