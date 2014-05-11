## Comments

I have put code for generating images with default background and
transparent background. The ones with transparent background are of 
size 504 x 504 to get close to images provided. I think on some systems this
would create a bit depth which would match the provided images exactly.

Dataset: [Electric power consumption](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)

As the data set is large and I prefer to use files in gzip format, I unzipped the file and then compressed it using gzip command.
I kept the file in the gzip format and use native R functions which can read from the gzip format.

```
wget https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
unzip exdata%2Fdata%2Fhousehold_power_consumption.zip
rm exdata%2Fdata%2Fhousehold_power_consumption.zip
gzip household_power_consumption.txt
```

## Background

This code is for the project 1 of [Exploratory Data Analysis](https://class.coursera.org/exdata-002/).
More details about the project can be found at the following GitHub repository: [https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)

## Code to generate the images

```
R CMD BATCH plot1.R
R CMD BATCH plot2.R
R CMD BATCH plot3.R
R CMD BATCH plot4.R
```

Outputs: plot1.png, plot1-T.png, plot2.png, plot2-T.png, plot3.png, plot3-T.png, plot4.png, plot4-T.png.

## My Plot 1
![plot 1](plot1.png)

## My Plot 1 Transparent
![plot 1 Transparent](plot1-T.png)

## Reference Plot 1 from assignment
![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


## My Plot 2
![plot 2](plot2.png)

## My Plot 2 Transparent
![plot 2 Transparent](plot2-T.png)

## Reference Plot 2 from assignment
![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


## My Plot 3
![plot 3](plot3.png)

## My Plot 3 Transparent
![plot 3 Transparent](plot3-T.png)

## Reference Plot 3 from assignment
![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


## My Plot 4
![plot 4](plot4.png)

## My Plot 4 Transparent
![plot 4](plot4-T.png)

## Reference Plot 4 from assignment
![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png)
