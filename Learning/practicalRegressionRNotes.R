#### Practical Regression and Anova using R
# Main library is faraway
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

# This chapter is about estimating regression coefficents. Going into the math behind everything.
# There are proofs that are above my head right now. I don't know how to think about that, but it's okay
# if my math isn't quite up to par.

# least squares is best when errors are correlated or have unequal variances.
# May not be the best though for situations in which that is not the case.
# e.g. nonlinear. Highly correlated predictors. Error distribution long-tailed

# Rsquared is goodness of fit. coefficient of determination or percentage of variance explained
# 1 - RSS / Total SS. Definition of SSM/SST is only applicable for simple linear regression.

# Fit of Rsquared is dependent on research area. It is area dependent.

# They labeled the regression object as gfit

# With R I can calculate values of interest. I can make a package
# and then get the exact output that I actually want. That's pretty cool
# It can have all of the things done in spss, and even more useful things.

# I'm doing a matrix of XtX I don't quite know what this is for.
# I have to set a dataframe as a matrix before being able to multiply.
# The function is as.matrix(x)

# It's constructing the beta coefficients

# inverse taken with solve()
# another way to get the same thing as the inverse matrix is by
# by using cov.unscaled. So you set the summary of the regression mode
# to a variable and then get cov.unscaled. gs <- summary(gfit) gs$cov.unscaled

# This section is calculating the coefficients in R

# There are different types of data available with gfit and gs

# found coefficients with xtxi %*% t(x) %*% y; t() is transpose %*% is matrix multiplication
# I don't know my linear algebra well, but it is intersting to see how the
# coefficients are calculated
# Additional way to do it: solve(t(x) %*% x, t(x) %*% y) this is supposed to be better

# So this section is just calculating all of the values of interest like Rsquared
# It means I can do that on my own. Cool.

# Ch.3 Inference

# It goes into derivation of F statistic. The solution is not SSM/SST. That is only for
# simple linear regression. it is difference in RSS for new and old model/ RSS new model.
# Apparently the anova table is not useful except for giving f value and significance.

# Failure to reject is not the end. Their might be non-linear changes and outliers that obscure things.
# and even if those things aren't occuring, their may just be insufficent data. That's why
# we say "fail to reject" vs. "accept" the null.

# F test is the beginning of investigation.

# I calculated the p value of regression model for data "savings"
# Used pf() function to get f distribution. Intersting to see the pvalue
# calculated.

# You can see if Betai should be dropped by looking at F of model with and without predictor

# So the f statistic of a model with and with out a predictor is equivalent to 
# the individual t statistic

# easiest way to check values is anova(g2, g)

# a predictor is relative to the others in the model. Not possible to look
# at a predictor in isolation. Information about the other predictors is necessary.
# The result of the test may be different if the predictors change.

# I don't get how to know if some predictors can be excluded. I'll have to read
# on this more.

# lm(sr ~ . , savings) is shorthand for full model

# Doing the comparison of > g <- lm(sr ~ . , savings)
#> gr <- lm(sr ~ I(pop15 + pop75) + dpi + ddpi, savings)
# showed that young and old people needed to be treated differently

# offset() function sets a coefficent of a linear model to 1
# You can test if a coefficient can be set to one by doing so and checking
# F statistic. It is better to just use t statistic though.

# A model is aonly an approximation of underlying reality, which makes the meaning of 
# parameters debateable at the very least. Saying Beta1 = 0 is odd, because
# it is very unlikely that there is absolutely no effect. It may be small but it won't be zero.
# significance would eventually occur with a large enough sample size
# This is a reason to prefer confidence intervals. (Why?)

# Statistical significance is not equivalent to practical significance.
# The larger the sample, the smaller the p values. Don't confuse p-values
# with a big predictor effect. With a large dataset predictors may all be significant
# but an effect size difference of 0.1 may be unimportant.

# Confidence intervals on the parameter estimates are a better way
# of assessing the size of an effect.

# Don't give meaning to the size of the p values

## 3.4 Confidence Intervals for Beta (where I left off.)