#dataframes in R tool
data()

mtcars

"mtcars
A data frame with 32 observations on 11 (numeric) variables.
[, 1] 	mpg 	Miles/(US) gallon
[, 2] 	cyl 	Number of cylinders
[, 3] 	disp 	Displacement (cu.in.)
[, 4] 	hp 	Gross horsepower
[, 5] 	drat 	Rear axle ratio
[, 6] 	wt 	Weight (1000 lbs)
[, 7] 	qsec 	1/4 mile time
[, 8] 	vs 	Engine (0 = V-shaped, 1 = straight)
[, 9] 	am 	Transmission (0 = automatic, 1 = manual)
[,10] 	gear 	Number of forward gears "



str(mtcars)

summary(mtcars)

plot(mtcars)

plot(mtcars$mpg)

#Grid chart the margin of the grid(mar),
#no of rows and columns(mfrow),
#whether a border is to be included(bty) and position of the
#labels(las: 1 for horizontal, las: 0 for vertical).
par(mfrow=c(2,2), mar=c(2,5,2,1), las=1, bty="n")

# Simple Histogram
#A histogram is very common plot.
#It plots the frequencies that data appears
#within certain ranges.
hist(mtcars$mpg, main="Histogram",xlab='MPG',col="blue",ylim=c(0,30))


#Simple Scatterplot
#A scatter plot provides a graphical view of
#the relationship between two sets of numbers.
plot(mtcars$wt, mtcars$mpg, main="Scatterplot Example",
     xlab="Car Weight ", ylab="Miles Per Gallon ", pch=1,
     col=c("blue", "green"))


# Simple Bar Plot
#Barplots are useful for comparing the distribution of
#a quantitative variable (numeric) between groups or categories.
counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution",
        xlab="Number of Gears",horiz=TRUE)

# Stacked Bar Plot with Colors and Legend
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts))


# Grouped Bar Plot
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)

# Simple Pie Chart
slices <- c(15,10, 12,4, 16, 8)
lbls <- c("India","US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

# Boxplot of MPG by Car Cylinders
#A boxplot provides a graphical view of the median, quartiles,
#maximum, and minimum of a data set.
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data",
        xlab="Number of Cylinders", ylab="Miles Per Gallon")


EuStockMarkets
