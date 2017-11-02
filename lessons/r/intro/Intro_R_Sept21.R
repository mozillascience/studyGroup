
### DATA LOADING ###

# Set the file location (working directory).  This is where R will look for files and where R will put any files that it writes. 
setwd()

# Taking existing file (that was built into R) called "swiss" and writing it as a file that now exists on your computer, in your working directory
write.csv(swiss, file="SwissData.csv")

# Reading/uploading a file from your computer and putting it into R.  We are assigning it a name, df1
df1 <- read.csv("SwissData.csv")

# Hey look, we can see our datafile in RStudio! 
View(df1)

# Here are four other different ways of seeing your data
summary(df1)
dim(df1)
head(df1)
names(df1)

# This is one way that we can select and refer to a single column
df1$Fertility

### DATA CLEANING ###

# How to reassign a value (sort of like "find and replace" for a single column).  We are replacing every "Fertility" value that is under 65 with a NA. 
df1$Fertility[df1$Fertility<=65] <- NA


# Here, we are creating a new data file (df2) that only includes the rows that had full and complete data. It's excluding rows that had a NA value anywhere in it. Now any county (row) with any missing value is absent.  
df2 <- na.omit(df1) 

dim(df1)
dim(df2)


# Here we are creating a new variable, based on a condition.  "BinaryEd" is now a new variable, unconnected to anything else, floating in space
BinaryEd <- ifelse(df2$Education < 8, 'Low', 'High')

# Here we are a creating a new variable (column) that is in the dataset.  We have changed the df2 object.  
df2$BinaryEd <- ifelse(df2$Education < 8, 'Low', 'High')



# Here, we've create a new variable separately (floating in space), but then attach it to a dataframe using column bind/cbind.
# You might use cbind (or rbind, to bind rows) to paste together datasets or something. 
AgRain <- df2$Agriculture / 30
df3 < - cbind(AgRain, df2)



### STATISTICS USING A DATASET ###

# Here is the t-test function, comparing infant mortality for the low and high education counties.  
t.test(df2$Infant.Mortality[df2$BinaryEd == 'Low'], df2$Infant.Mortality[df2$BinaryEd == 'High']))

# If we don't want to repeat df2$  all of the time, since it can be repetitive, we can specify our dataset by doing our t-test within a "with" statement. 
with(df2, t.test(Infant.Mortality[BinaryEd == 'Low'], Infant.Mortality[BinaryEd == 'High']))

# Correlation with three different syntaxes
with(df2, cor.test(Infant.Mortality, Catholic))

cor.test(df2$Infant.Mortality, df2$Catholic)

attach(df2)  
cor.test(Infant.Mortality, Catholic)
detach(df2)
## USE WITH CAUTION:  Attaching and Detaching are not smart functions, and can result in over-writing, not remembering what data-set you are using, and general disaster.  Basically, whenever you "attach", "detach" right away.  Or use other better options.  


# Some functions are smart enough to know that you'll want to indicate a dataset.  Here we run a linear regression, and specify data = df2
summary(lm(Infant.Mortality ~ Catholic, data = df2))


### INTRO TO PLOTS ###

plot(df2$Infant.Mortality, df2$Catholic)  # initially ugly
plot(df2$Education, df2$Catholic, xlab="Education (%)", ylab = "% Catholic", pch= 20, cex = 1.2)  
abline( lm( df2$Catholic ~ df2$Education))  # add a line based on the coefficients from a linear regression
# There are infinite specifications that you can change on your plots.  To have a prettier starting plot, learn/use ggplot2 (requires ggplot2 library)




## MORE COOL STUFF THAT REQUIRED THE UNAVAILABLE PACKAGES ## 

# Check out the youtube video from last year:  https://www.youtube.com/watch?v=pbG_3ZuNyx8
# And the code-along information:  https://github.com/UofTCoders/studyGroup/blob/gh-pages/lessons/r/intro/lesson.md
# No really, watch the video, it will explain what the heck this following code does and how it's doing it and how you can do it. 

install.packages("dplyr") 
library(dplyr)


df2 %>% 
    gather(ColumnName, Value, -X, -BinaryEd) %>% 
    group_by(ColumnName)  %>% 
    summarize(MeanSD = paste0(round(mean(Value),2), 
                              " (", 
                              round(sd(Value), 2), 
                              ")"
                              ))
                              
                            
 
 # If you install the package knitr ....
 install.packages("knitr")
 library(knitr)
 
 
 ##Then try this!!
 df2 %>% 
    gather(ColumnName, Value, -X, -BinaryEd, - Education) %>% 
    group_by(ColumnName, BinaryEd)  %>% 
    summarize(MeanSD = paste0(round(mean(Value),2), 
                              " (", 
                              round(sd(Value), 2), 
                              ")"
                              ))  %>% 
    spread(ColumnName, MeanSD)  %>% 
    kable()                                                    
