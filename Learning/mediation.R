#### Mediation Examples

library(mediation) #Mediation package
library(multilevel) # Sobel Test
library(bda) #Another Sobel Test option
library(gvlma) #Testing Model Assumptions
library(stargazer) #Handy regression tables
library(QuantPsyc) # Quant psych package
library(pequod) # Moderated regression with extra stuff

setwd("r/Learning")

# Moderation Data
set.seed(123)

N <- 100
X <- rnorm(N, 175, 7) # IV; hours since dawn
M <- 0.7*X + rnorm(N, 0, 5) #Suspected mediator; coffee consumption
Y <- 0.4*M + rnorm(N, 0, 5) #DV; wakefulness
Meddata <- data.frame(X, M, Y)

## Method 1: Baron & Kenny

#1. Total Effect
fit <- lm(Y ~ X, data=Meddata)
summary(fit)

#2. Path A (X on M)
fita <- lm(M ~ X, data=Meddata)
summary(fita)

#3. Path B (M on Y, controlling for X)
fitb <- lm(Y ~ M + X, data=Meddata)
summary(fitb)

#4. Reversed Path C (Y on X, controlling for M)
fitc <- lm(X ~ Y + M, data=Meddata)
summary(fitc)

#Summary Table
stargazer(fit, fita, fitb, fitc, type = "text", title = "Baron and Kenny Method")

#Sobel Test - Testing if the mediation is significant
sobel(Meddata$X, Meddata$M, Meddata$Y)

#or use below; Sobel Test seen as outdated ### Couldn't find method in bda package
#mediation.test(M,X,Y)

## Using the mediation package

# IV on M; Hours since dawn predicting coffee consumption
fitM <- lm(M ~ X, data = Meddata)

# IV and M on DV; Hours since dawn and coffee predicting wakefulness
fitY <- lm(Y ~ X + M, data=Meddata)

# Data is positively skewed; could log transform
gvlma(fitM)

# Gives assumption checking of a linear model
gvlma(fitY)

fitMed <- mediate(fitM, fitY, treat="X", mediator="M")
summary(fitMed)