# Linear Regression Script
# This focuses just on linear regression. Following Andy Field's R book.

# set working directory first
setwd("programming/r/Learning")

# Add all dependencies first
library(boot)
library(car)
library(QuantPsyc)
# foriegn library allows you to read SPSS data
library(foreign)

# Add data. This added all of the same data that was in SPSS with variable names
spiteAggData <- read.spss("HW1.sav", to.data.frame = TRUE)

# This is the regression model. The outcome variable is first, predictors
# are second after the ~. By setting data file I don't have to type $ for each
# variable.
spitePred <- lm(Aggression ~ Spitefulness, data = spiteAggData)

# that created the spitePred object which I have to then get a summary of.
summary(spitePred)

# The above gave all of the necessary info to report and understand, except
# for standardized beta coefficients. To get that info I have to use
# the quantpsyc library.
lm.beta(spitePred)
# That just produces the exact beta coefficient needed.

# That's it for this part. It covered everything for linear aggression.
# Except it didn't cover assumption checking!!!
# I may add more to do assumption checking. Not right now though. Later.
# It's needed though. Like the below adds all of the residuals. May do more
# for multiple regression data.
spiteAggData$residuals <- resid(spitePred)