### Read in the Data and Packages ####

data <- read.table(file = "http://personality-project.org/r/datasets/R.appendix4.data", header = TRUE)

# If you've never used these packages before, install them first (one time only)
install.packages("car") 
install.packages("lme4") 
install.packages("lmerTest") 

library(car)  # load the packages before using 
library(lme4)
library(lmerTest)

View(data)  # See what our data looks like in R Studio 


# Review: linear regression (y ~ x)
basicmodel <- lm(Recall ~ Valence, data= data)
basicmodel
summary(basicmodel)
Anova(basicmodel)

### Paired T-test ####

# Create a partial dataset with only the Positive and Negative valences (remove the Neutral)
partialdata <- subset(data, data$Valence != "Neu")

t.test(partialdata$Recall ~ partialdata$Valence, paired = TRUE) # paired t-test for repeated measures

with(partialdata, t.test(Recall ~ Valence, paired = TRUE))  # another way to write the exact same t-test

### Linear Mixed Model (Hierarchical/Multilevel Model) ####
rmmodel <- lmer(Recall ~ Valence + (1|Subject), data= data)  
# the (1|X) is how to indicate the "nesting" variable (e.g. person, school, field) that the data is repeated within

summary(rmmodel)
anova(rmmodel)

data$ValenceN <- relevel(data$Valence, ref = "Neu") # relevel the factor to see other contrasts 

rmmodel2 <- lmer(Recall ~ ValenceN + (1|Subject), 
                data= data)
summary(rmmodel2)

data$Imagine <- rep(c(1,2,3,4,5), 6) # create a fake continuous variable, for demonstration purposes 

rmmodel3 <- lmer(Recall ~ ValenceN*Imagine + (1|Subject), data= data)  
#this model is using "0 imagine" as its default, which doesn't exist (it's outside the range of "Imagine") and so doesn't make sense
Anova(rmmodel3)
summary(rmmodel3)

data$ImagineC <- data$Imagine - mean(data$Imagine, na.rm=T) 
# so, we center the Imagine variable, so now the model will 
#test the effect of Valence when "Imagine" is average 
#(still using "0 imagine" as its default, but now 0 represents the mean of 3)

rmmodel3 <- lmer(Recall ~ ValenceN * ImagineC + (1|Subject), 
                 data= data)
rmmodel3 <- lmer(Recall ~ ValenceN + ImagineC + (1|Subject),data= data) 
#if you aren't testing interaction terms, then centering your variables doesn't matter
Anova(rmmodel3) 
summary(rmmodel3)

### Some Messy data things ####
View(airquality)

cor(airquality$Ozone, airquality$Solar.R) # returns NA 
cor(airquality$Ozone, airquality$Solar.R, use = "pairwise.complete.obs") # look at help (?cor) to find the options
cor.test(airquality$Ozone, airquality$Solar.R)

mean(airquality$Ozone)  # returns NA
mean(airquality$Ozone, na.rm=T)  # returns the mean 

completeair <- na.omit(airquality) # remove all rows with ANY missing value

dim(airquality)
dim(completeair) # we can see it has fewer rows 

allozone <- airquality[!is.na(airquality$Ozone),]
dim(allozone)

# Dealing with a messy variable that might have letters/numbers that we want to remove: one example (use google!)
airquality$WindPostDec <- gsub(".*\\.", "", airquality$Wind)
airquality$WindPreDec <- as.numeric(gsub("\\..*", "", airquality$Wind))  

summary(airquality$WindPostDec) #since we didn't turn it back into numeric, this variable is still a string 
summary(airquality$WindPreDec) # since we turned this one back into numeric, we get the actual means/descriptives
