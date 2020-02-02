#### Practical Regression and Anova using R
# Notes. This looks like a really good book. I like it.
# Messy datasets and practical knowledge.

# When you have a data set it is helpful to inspect it with descriptives first
# so you start with summary() of the dataset. In the book an example is given
# of diastolic being 0 for a min. That is impossible.

# So you sort the data by sort(pima$diastolic) with the data and variable

# Then you replace each value that is 0 with an NA
# pima$diastolic[pima$diastolic == 0] <- NA do this for all values

# There is also stuff on making sure a thing is known as a factor or categorical
# in this example data set it was test. You set the variable itself to
# a factored version of it pima$test <- factor(pima$test)

# I did a plot of a histogram with hist() specifically hist(pima$diastolic)

# R sets the bins on a plot. To get a smoothed version do Kernel
# Density estimates plot(density(pima$diastolic,na.rm=TRUE))

# plot bivariate by using the tilde ~ plot(y ~ x, data)

# R studio saves all of these plots. You just have to cycle through
# them.

# pairs(dataset) will give you a correlation matrix of all variables

# abline(0,1) adds some line directly to the plot

# made the regression eq and then added it to the plot with
# abline(g$coef, lty = 5)

#### CH.2 Estimation