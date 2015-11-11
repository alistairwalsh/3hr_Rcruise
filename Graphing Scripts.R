
# www.cyclismo.org tutorial -----------------------------------------------
# http://www.cyclismo.org/tutorial/R/intermediatePlotting.html#print-to-a-file

# Scatter Plots -----------------------------------------------------------
#note this is using the 'trees91.csv' file
plot(tree$STBM,tree$LFBM)
cor(tree$STBM,tree$LFBM)
#[1] 0.911595
plot(tree$STBM,tree$LFBM,
     main="Relationship Between Stem and Leaf Biomass",
     xlab="Stem Biomass",
     ylab="Leaf Biomass")

x <- rnorm(10,sd=5,mean=20)
y <- 2.5*x - 1.0 + rnorm(10,sd=9,mean=0)
cor(x,y)
[1] 0.7400576
plot(x,y,xlab="Independent",ylab="Dependent",main="Random Stuff")
x1 <- runif(8,15,25)
y1 <- 2.5*x1 - 1.0 + runif(8,-6,6)
points(x1,y1,col=2)
x2 <- runif(8,15,25)
y2 <- 2.5*x2 - 1.0 + runif(8,-6,6)
points(x2,y2,col=3,pch=2)

# Add legend --------------------------------------------------------------
plot(x,y,xlab="Independent",ylab="Dependent",main="Random Stuff")
points(x1,y1,col=2,pch=3)
points(x2,y2,col=4,pch=5)
legend(14,70,c("Original","one","two"),col=c(1,2,4),pch=c(1,3,5))

# Set Axis Limits --------------------------------------------------------------
plot(x,y,xlab="Independent",ylab="Dependent",main="Random Stuff",xlim=c(0,30),ylim=c(0,100))
points(x1,y1,col=2,pch=3)
points(x2,y2,col=4,pch=5)
legend(0,100,c("Original","one","two"),col=c(1,2,4),pch=c(1,3,5))


# Add Error Bars ----------------------------------------------------------
plot(x,y,xlab="Independent",ylab="Dependent",main="Random Stuff")
xHigh <- x
yHigh <- y + abs(rnorm(10,sd=3.5))
xLow <- x
yLow <- y - abs(rnorm(10,sd=3.1))
arrows(xHigh,yHigh,xLow,yLow,col=2,angle=90,length=0.1,code=3)

numberWhite <- rhyper(400,4,5,3)
numberChipped <- rhyper(400,2,7,3)

# Multiple Graphs on One Plot ---------------------------------------------
par(mfrow=c(2,3))
# mfrow=c(number of rows,number of columns)
boxplot(numberWhite,main="first plot")
boxplot(numberChipped,main="second plot")
plot(jitter(numberWhite),jitter(numberChipped),xlab="Number White Marbles Drawn",
       ylab="Number Chipped Marbles Drawn",main="Pulling Marbles With Jitter")
hist(numberWhite,main="fourth plot")
hist(numberChipped,main="fifth plot")
mosaicplot(table(numberWhite,numberChipped),main="sixth plot")


# Pairwise Plots ----------------------------------------------------------
uData <- rnorm(20)
vData <- rnorm(20,mean=5)
wData <- uData + 2*vData + rnorm(20,sd=0.5)
xData <- -2*uData+rnorm(20,sd=0.1)
yData <- 3*vData+rnorm(20,sd=2.5)
d <- data.frame(u=uData,v=vData,w=wData,x=xData,y=yData)
pairs(d)


# Shaded Areas ------------------------------------------------------------
par(mfrow=c(1,1))
x = c(-1,1,1,-1,-1)
y = c(-1,-1,1,1,-1)
plot(x,y)
polygon(x,y,col='blue')

stdDev <- 0.75;
x <- seq(-5,5,by=0.01)
y <- dnorm(x,sd=stdDev)
right <- qnorm(0.95,sd=stdDev)
plot(x,y,type="l",xaxt="n",ylab="p",
       xlab=expression(paste('Assumed Distribution of ',bar(x))),
       axes=FALSE,ylim=c(0,max(y)*1.05),xlim=c(min(x),max(x)),
       frame.plot=FALSE)
axis(1,at=c(-5,right,0,5),
       pos = c(0,0),
       labels=c(expression(' '),expression(bar(x)[cr]),expression(mu[0]),expression(' ')))
axis(2)
xReject <- seq(right,5,by=0.01)
yReject <- dnorm(xReject,sd=stdDev)
polygon(c(xReject,xReject[length(xReject)],xReject[1]),
          c(yReject,0, 0), col='red')


# Plotting a Surface ------------------------------------------------------
x <- seq(0,2*pi,by=pi/100)
y <- x
xg <- (x*0+1) %*% t(y)
yg <- (x) %*% t(y*0+1)
f <- sin(xg+yg)
persp(x,y,f,theta=-10,phi=40,col="purple")
example(persp)


# Dataset using R’s hypergeometric random number generator ----------------
numberWhite <- rhyper(30,4,5,3)
numberChipped <- rhyper(30,2,7,

# Barplot -----------------------------------------------------------------
numberWhite <- rhyper(30,4,5,3)
numberWhite <- as.factor(numberWhite)
plot(numberWhite)

# barplot command requires a vector of heights, you cannot simply give it raw data
# frequencies for the barplot command can be easily calculated using the table command
numberWhite <- rhyper(30,4,5,3)
totals <- table(numberWhite)
totals
#numberWhite
#0  1  2  3
#4 13 11  2

# you can change the axis labels by setting the row names of the table
totals <- table(numberWhite)
rownames(totals) <- c("none","one","two","three")
totals
#numberWhite
#none   one   two three
#4      13    11     2
barplot(totals,main="Number Draws",ylab="Frequency",xlab="Draws")

# use the sort command with the decreasing option set to TRUE if you want to sort the frequencies along the axis
barplot(sort(totals,decreasing=TRUE),main="Number Draws",ylab="Frequency",xlab="Draws")

# you can change the order of the frequencies manually
totals
#numberWhite
#none   one   two three
#4    13    11     2
sort(totals,decreasing=TRUE)
#numberWhite
#one   two  none three
#13    11     4     2
totals[c(3,1,4,2)]
#numberWhite
#two  none three   one
#11     4     2    13
barplot(totals[c(3,1,4,2)])



# Multiple Representations on One PLot ------------------------------------
x = rexp(20,rate=4)
hist(x,ylim=c(0,18),main="Multi-plot",xlab="X")
boxplot(x,at=16,horizontal=TRUE,add=TRUE)
rug(x,side=1)
d = density(x)
points(d,type='l',col=3)


# Print to File -----------------------------------------------------------




# to find out which devices are available on your computer
help(device)


# Annotation and Formatting -----------------------------------------------
x <- rnorm(10,mean=0,sd=4)
y <- 3*x-1+rnorm(10,mean=0,sd=2)
summary(x)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#-6.1550 -1.9280  1.2000 -0.1425  2.4780  3.1630
summary(y)
#Min.  1st Qu.   Median     Mean  3rd Qu.     Max.
#-17.9800  -9.0060   0.7057  -1.2060   8.2600  10.9200
plot(x,y,axes=FALSE,col=2)
axis(1,pos=c(0,0),at=seq(-7,5,by=1))
axis(2,pos=c(0,0),at=seq(-18,11,by=2))
# at is used to specifiy the tick marks

# Drawing a Box around the Plot
x <- rnorm(10,mean=0,sd=4)
y <- 3*x-1+rnorm(10,mean=0,sd=2)
plot(x,y,bty="7")
# bty= "o", "l", "7", "c", "u", "]", or "n"   where n is no box
plot(x,y,bty="o")
plot(x,y,bty="n")
# box can also be drawn later using the box command (lty = 1,2,3 can be used to specify line type)
box(lty=3)


# use par command to adjust various parameters
par(bty="l")
par(bg="gray")
par(mex=2)
x <- rnorm(10,mean=0,sd=4)
y <- 3*x-1+rnorm(10,mean=0,sd=2)
plot(x,y)
par(bg="white")
plot(x,y)

# add text to your plots
x <- rnorm(10,mean=0,sd=4)
y <- 3*x-1+rnorm(10,mean=0,sd=2)
plot(x,y)
text(-1,-2,"numbers!")
# give the co-ordinates of where you want to place the text
# default text will cut off any characters outside the plot area, override this using the xpd option
text(-7,-2,"outside the area",xpd=TRUE)
