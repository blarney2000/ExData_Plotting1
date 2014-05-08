# Basic idea to read the file modified from Peter Huber's post
# on the discussion forums
# https://class.coursera.org/exdata-002/forum/profile?user_id=3051102
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
df<-read.table(tc,sep=";",header=TRUE, col.names = colnames(read.table(
  "household_power_consumption.txt.gz",
  nrow = 1, header = TRUE, sep=";")), na.strings = "?")

# convert Date and Time variables to Date/Time classes
df$Date <- as.Date(df$Date , "%d/%m/%Y")
df$Time <- paste(df$Date, df$Time, sep=" ")
df$Time <- strptime(df$Time, "%Y-%m-%d %H:%M:%S")

# output to png the Global Active Power histogram plot
png("plot1.png", width = 504, height = 504, bg = "transparent")
hist(df$Global_active_power, main = "Global Active power", col = "red", xlab = "Global Active Power (kilowatts)", )
dev.off
