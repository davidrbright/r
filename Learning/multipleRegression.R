library(foreign)
library(QuantPsyc)
library(tidyverse)
library(broom)
library(car)

setwd("R/work/learning")

# There are books on applied regression in R. I could look into
# doing things exclusively in R. I think when you have your files set
# and a workflow things can be made easier in R

# Easier to set input file and output files at start of work.
inputFile <- "HW1.sav"

# Input data from spss
dataset <- read.spss(inputFile, to.data.frame = TRUE)

# Run the multiple regression. This is a simple version it just uses
# the lm. I'm setting the variables by just setting it.
mulReg <- lm(Aggression ~ Spitefulness + Agreeableness, data = dataset)

# This gives you a summary of the overall model. F and R-squared
summary(mulReg)

# This gives you info on exact coefficients B values of the model
coefficients(mulReg)

# This is anova results
anova(mulReg)

# To run a heirarchical regression you have different regression models and
# just create them. Then compare them with anova
step0 <- lm(Aggression ~ 1, data = dataset)
step1 <- lm(Aggression ~ Agreeableness, data = dataset)
step2 <- lm(Aggression ~ Agreeableness + Spitefulness, data = dataset)

# Get summary data of each model
summary(step0)
summary(step1)
summary(step2)

# An example I'm looking at is saying to look at step0
anova(step0)

anova(step0, step1, step2)

# Beta coeffiencents for all regressions
lm.beta(step1)
lm.beta(step2)

# Rsquared change
r1 <- summary(step1)$r.squared
r2 <- summary(step2)$r.squared

rSquaredChange <- r2 - r1

rSquaredChange

# This will be assumption checking below.
# I stopped. I think I have my information necessary, but I don't
# know the best way to write about things or see data. I will compare to
# spss now.

# calling step2 gives you the formula information and
# the coefficients

# This will add residuals to the dataset. Create a new dataset.
model.diag.metrics <- augment(step1)
head(model.diag.metrics)

# This will create a plot of residuals. Only for the step1 model
# I don't know how to do step 2 plot based on aes.
ggplot(model.diag.metrics, aes(Agreeableness, Aggression)) +
  geom_point() +
  stat_smooth(method = lm, se = FALSE) +
  geom_segment(aes(xend = Agreeableness, yend = .fitted), color = "red", size = 0.3)

# diagnostic plots
# below is nice layout
layout(matrix(c(1,2,3,4),2,2))
plot(step2)

# Assessing Outliers
outlierTest(step2) # Bonferonnie p-value for most extreme obs
qqPlot(step2, main="QQ Plot") #qq plot for studentized resid
leveragePlots(step2) # Leverage plots

vif(step2)
sqrt(vif(step2)) > 2
