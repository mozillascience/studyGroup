install.packages("car")
install.packages("psych")
install.packages("multcomp")
library(car)
library(psych)
library(multcomp)
View(iris)
View(Wong)
View(mtcars)

#frequencies with table()
#The table() function displays counts of identical observations 
#for either a single data vector or a dataframe

#table
table(mtcars$gear)
#cross tabulate
table(mtcars$gear, mtcars$carb)
#note: first variable as the rows

#mean
#without the na.rm=T argument, mean() will return a 
#null value if there is any missing data in the object
mean(Wong$viq, na.rm=T)

#median
#The median() function finds the median (50th percentile) value
median(Wong$viq, na.rm=T)

#variance and sd
var(Wong$viq, na.rm=T)
sd(Wong$viq, na.rm=T)

#range
range(Wong$viq, na.rm=T)

#describe() from the psych package
#item name ,item number, nvalid, mean, sd, 
#median, mad (median absolute deviation from the median), min, max, skew, kurtosis, se
describe(Wong$age)

#describeBy() from the psych package
#A simple way of generating summary statistics by grouping variable
describeBy(Wong$age, Wong$sex)

#inferential statistics
#one-sample t test
t.test(Wong$age, mu=30)

#two sample t-test
#t.test( object1, object1)
t.test(Wong$age~Wong$sex)

#paired samples t-test
#t.test(object1, object1, paired=TRUE)

#correlations
#use cor.test
cor.test(iris$Petal.Length, iris$Petal.Width)

#general linear model (i.e., with a normally-distributed dependent variable)
#dependent variables are predicted by a tilde “~” 
#the formula to regress “y” on “x” is y ~ x
result <- lm(viq~duration, data=Wong)
summary(result)

result <- lm(viq~duration*days*sex, data=Wong)
summary(result)

result <- lm(viq~duration*days + sex, data=Wong)
summary(result)

#ANOVA is simply a different way of evaluating explained variance in linear modelling
#you must always wrap the anova() function around a lm() function

anova(lm(mpg ~ am*gear, data=mtcars))

#HOWEVER, R uses type II sums of squares by default
#Anova from the car package can give you “Type III Sums of Squares” 
#this matters when you have more than one predictor (i.e. )
#this will match what you get from SPSS or SAS

result <- lm(mpg ~ am*gear, data=mtcars)
Anova(result, type=3)

#R comes with a default pairwise t-test (pairwise.t.test())
#multcomp offers more posthoc options than base R
result <- lm(Petal.Length ~ Species, data=iris)
postHocs<-glht(result, linfct = mcp(Species = "Tukey"))
summary(postHocs)
confint(postHocs)

#logistic regression
#must use the glm() function rather than lm()
summary(glm(Wong$sex ~ Wong$piq*Wong$viq, family=binomial))

#scales and reliability - Cronbach's Alpha from the psych package
newiris <- iris[c(1:4)]
rowMeans(newiris, na.rm=TRUE)
alpha(newiris)
