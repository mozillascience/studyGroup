
# Aberdeen Study Group: Linear modelling ----------------------------------
# Author: Deon Roos
# Date: 2018 - 10 - 24
# Purpose: Running through the workflow of a LM for new students

################################################################################################################################################    
# Start by loading the iris data ------------------------------------------
# The iris dataset is an example dataset used for teaching and is part of base R
# There are various issues with the dataset that we will see shortly, but we'll assume it's ok for our purposes

data(iris)  # Will appear as a "<promise>" in RStudio's environment - not a problem

# Loading packages --------------------------------------------------------
  # We'll use ggplot for doing the plots in this run through. Install, then load it up.

  # This installs it onto your PC
    install.packages("ggplot2")

  # This loads it into R. Note that R will unload all packages when you close it. You only need to install once, but will always need to reload a package.
    library(ggplot2)            # For creating plots

  # Also install jtools. We will use this later on, but the package is for creating figures based on LM.
  # Think of it as the lazy way of plotting model outputs.
    install.packages("jtools")
    library(jtools)             # For plotting model outputs
    
  # Always write down a comment next to where you load a package to remind yourself 6 months later why you needed *that* package
    
################################################################################################################################################    
# STEP 0: THE MOST IMPORTANT PART! ----------------------------------------
# Let's create a research question.

# Question (I'm not a plant person...):
# Does the species specific surface area of the petal predict the species specific length of the sepal?

# From this we know:
    # Sepal.Length is our response variable
    # We think Species influences the response variable (we could predict which species will have the longest petals)
    # We think Petal.Area also influences Sepal.Length (prediction: longer sepal length = longer petal length)
        # We also know that we need to create this new explanatory variable.
    # We think that Petal.Area varies with Species (and vice-versa), and this interaction also influences Sepal.Length

################################################################################################################################################    
# STEP 1: CHECK YOUR DATA ---------------------------------------------
  # Make sure the data is what you think it is
    # E.g. Is R reading iris$Species as a factor? If not this will cause headaches later on. Check now!

    str(iris)
        # 'data.frame':	150 obs. of  5 variables:                                                 # R knows that iris is a data.frame with 150 obs with 5 variables
        # $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...                            # R reads Sepal.Length as a number. Great, it should be a number.
        # $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...                          # Same here etc
        # $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
        # $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
        # $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...    # R knows that the species is a grouping (based on it being a "string") so is read as a factor
    
  # There are other options for checking your data, try the following:
    head(iris)
    summary(iris)
    
# Step 1.1: Create our new explanatory variable ---------------------------
  # We'll assume that we can simply do length * width to get the area of a petal
  # This is obviously not correct as it assumes a petal is a rectangle, but we'll just go with it.
    
    # Create our new vector and fill it with NA, which will be replaced with actual values
    # Redundant here, as we could simply calculate it in the same line of code, but it's a good habit to get into.
    
    iris$Petal.Area <- NA   # New vector filled with NA
    iris$Petal.Area <- iris$Petal.Length * iris$Petal.Width

    # Check to see it if worked correctly
    summary(iris$Petal.Area)

    # Min.    1st Qu. Median  Mean    3rd Qu. Max. 
    # 0.110   0.420   5.615   5.794   9.690   15.870 

################################################################################################################################################    
# Step 2: Creating plots of the raw data -----------------------------------
  # Create scatterplots to see what kind of trends there are in the data. Is it worthwhile going ahead with analysis?
    # Make sure that you know what's going on with your data before you do analysis!!
      # What trends do you expect before doing any analysis (can help to spot "broken" models)
    # You can often spot any really stupid mistakes at this point. E.g. did you measure Petal.Length in m and not cm?
    
    # Sepal length against petal length
    ggplot(aes(x = Petal.Area, y = Sepal.Length), data = iris) + # Specify what I want in the graph using aes(), and what the dataset is
      geom_point() +                                             # Say what type of plot I want it to make (e.g. a scatterplot is geom_point)
      theme_bw()                                                 # Say which off-the-shelf theme I would like to use

    # Sepal length against species    
    ggplot(aes(x = Species, y = Sepal.Length), data = iris) + 
      geom_boxplot() +
      theme_bw()
    
    # Doing all three together
    ggplot(aes(x = Petal.Area, y = Sepal.Length, colour = Species, shape = Species), data = iris) + 
      geom_point() +
      theme_bw() + 
      geom_smooth(method = "lm")

          # Do you think there is a relationship worth exploring further with analysis?
          # Is the scatterplot (geom_point), using species, informative? Could we use an alternative instead?
    

    # Use histograms to check the spread of your data
    # Histogram of response
    ggplot() +
      geom_histogram(aes(Sepal.Length), fill = "lightgrey", colour = "black", bins = 40, data = iris) +
      theme_bw()
  
    # Does this histogram look ok?
    
    # Histogram of sepal length
    ggplot() +
      geom_histogram(aes(Petal.Area), fill = "lightgrey", colour = "black", bins = 40, data = iris) +
      theme_bw()
    
    # Does the distribution of Petal.Area look alright? Might it be worth transforming? 
    # Let's check to see if we can explain the weird distribution
    ggplot() +
      geom_histogram(aes(Petal.Area, fill = Species), data = iris) +
      theme_bw()
    
    # It looks like the different species are causing the weird distribution

    # Let's try transforming Petal.Area
    # As a rough rule of thumb there are 4 commonly used transformations:
      # Squared: x^2
      # Square root: sqrt(x)
      # Natural log: log(x)
      # Log of base 10: log10(x)
    
    iris$Petal.Area.Squared <- NA
    iris$Petal.Area.Squared <- (iris$Petal.Area)^2
    
    # Check histogram to see how it looks now:
    ggplot() +
      geom_histogram(aes(Petal.Area.Squared, fill = Species), data = iris) +
      theme_bw()
    
    # Looks better. We can try using the different versions of petal area later and see if it makes a difference.
    
    # To see a normal distribution, and how it can vary, try altering the rnorm(n = 150, mean = 10, sd = 3) in the following code or just run it multiple times with different seeds.
    # Note: if you wanted the random numbers to be consistent (despite being random) use set.seed() and add a number in the brackets.
    set.seed(4638564)
    
    normal.dist <- rnorm(n = 150, mean = 10, sd = 3)
    ggplot() +
      geom_histogram(aes(normal.dist), fill = "lightgrey", colour = "black", bins = 40) +
      theme_bw()
    
  # Can you make a histogram of species? Why not?
    
  # Note that the use of transformations has some controversy around them.
  # Some, like Zuur, argue against the use of them, as it can "hide" subtle variation in variables.
    # E.g. Squaring petal area has removed lots of variation in setosa (see plots below).
    # Use transformations when you feel it is appropriate. Persinally, I try not to as a general rule.
    # Transformations can lead to a perfectly fine model, but when backtransformed, is silly
    
################################################################################################################################################    
# STEP 3: CHECK FOR OUTLIERS ----------------------------------------------
    
# Outliers can have a disprportionate effect on the model. It's best to try and catch them early rather than later, though there are ways of detecting them downstream.
  # We can use boxplots to check for this
    
    # Petal length against species (note that we are using a boxplot now because we are using factors)
    ggplot(aes(x = Species, y = Sepal.Length), data = iris) + 
      geom_boxplot() +
      theme_bw()
    
    # Before running the following code, do you think it will be helpful?
    ggplot(aes(x = Petal.Area.Squared, y = Sepal.Length), data = iris) + 
      geom_boxplot() +
      theme_bw()
    
    # This may be more a more informative version of the above plot.
    ggplot(aes(x = Petal.Area.Squared, y = Sepal.Length, group = Species), data = iris) + 
      geom_boxplot() +
      theme_bw()
    
    # Let's try with the unsqaured petal area:
    ggplot(aes(x = Petal.Area, y = Sepal.Length, group = Species), data = iris) + 
      geom_boxplot() +
      theme_bw()
    
    # Are there any outliers?
      # Outliers can be data entry mistakes - in which case remove and state very clearly that you removed it because you think it was an entry mistake
      # Or they can just be bioligcally extreme values (though still biologically resonable)
        # E.g. someone who is 2.2 m tall could present as an outlier, but is obviously still biologically reasonable (they exist after all...)
      # Whatever you do with outliers is fine so long as you can justify it, just be completely transparent.
    
    # Why are outliers a problem?
    # https://observablehq.com/@tmcw/bring-your-own-doodles-linear-regression
    # We will check this later on after running a model
    
################################################################################################################################################    
# STEP 4: Check for collinearity in your data -----------------------------
# Collineairty, or correlation, in explanatory variables is dangerous when it comes to modelling
  
  # Let's assume species and Petal.Width are correlated with each other. If we include both in a model, and they both have an effect,
  # how will we know if it isn't actually just petal width that has an affect and species just happens to be correlated?
  # How would we know which one is actually having the influence?
  
    # Below is a prewritten function code that calculates correlation scores for all combinations of your variables and allows this to be included in a pairs plot
    # Once this is run it will create a function called "panel.corr", which R can use like any other function
    
    # Just run this next bit of code:
    panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
    {
      usr <- par("usr"); on.exit(par(usr))
      par(usr = c(0, 1, 0, 1))
      r <- abs(cor(x, y))
      txt <- format(c(r, 0.123456789), digits = digits)[1]
      txt <- paste0(prefix, txt)
      if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
      text(0.5, 0.5, txt, cex = cex.cor * r)
    }
    
    # Now check for collienarity using the pairs() function
    pairs(iris, lower.panel = panel.smooth, upper.panel = panel.cor) # Creates a correlation plot

    # For a slightly fancier version of the same plot you can run the code below (though they show the same thing)
    # install.packages("GGally")
    library(GGally)
    ggpairs(iris)
    # An alternative
    ggcorr(iris, method = c("everything", "pearson"))
    
    
  # The iris dataset has lots of collinearity. For the purposes of this Study Group Session, let's just ignore that they are correlated.  
  # In practice, you would normally exclude one of the variables (usually the least interesting one) and keep one in the model. 
    
################################################################################################################################################    
# STEP 5: Creating a linear model -----------------------------------------

Model.1 <- lm(Sepal.Length ~ Species * Petal.Area, data = iris)    
    
  # That's all the code needed to run a linear model. It's really not difficult to run a model. Hard part is all the work leading up to the and afterwards.    
    
################################################################################################################################################    
# STEP 6: Diagnostic check of the model -----------------------------------
    # We will dicuss this
    par(mfrow = c(2,2))
    plot(Model.1)
    par(mfrow = c(1,1))
    
################################################################################################################################################    
# STEP 7: Model selection -------------------------------------------------
 
    AIC(Model.1)                                # E.g. returns an AIC = 100
    
    Model.2 <- lm(Sepal.Length ~ Species + Petal.Area, data = iris)
    AIC(Model.2)                                # E.g. returns an AIC = 110
    par(mfrow = c(2,2))
    plot(Model.2)                               # This will plot the graphs discussed above
    
    Model.3 <- lm(Sepal.Length ~ Species, data = iris)
    AIC(Model.3)                                # E.g. returns an AIC = 110
    plot(Model.3)                               # This will plot the graphs discussed above
    
    Model.4 <- lm(Sepal.Length ~ Petal.Area, data = iris)
    AIC(Model.4)                                # E.g. returns an AIC = 90
    plot(Model.4)                               # This will plot the graphs discussed above
    par(mfrow = c(1,1))
    
    AIC(Model.1, Model.2, Model.3, Model.4)
    
    # In the example AICs, we would choose Model.2 because it has the lowest AIC
    # The next best AIC is +1.2219 (the rule is a difference in AIC of >2 allows us to discard a model)
    # What do we do here then?
        #         df      AIC
        # Model.1  7 168.9251  <- Equally good according to AIC
        # Model.2  5 167.7032  <- Best according to AIC
        # Model.3  4 231.4520
        # Model.4  3 174.8960
    
    # This means that the model with an interaction term and the model with only additive terms are equivalent
    # Choosing between the two models now becomes subjective:
      # We can choose the model with the lowest AIC regardless (e.g. Model 1), but say that we cannot distinguish between this and Model.2
      # Or we can choose the simpler of the 2 models (e.g. Model.2), but say that we cannot distinguish between this and Model.1
      # Or we can choose the model that best fits our research question (e.g. Model.1), but say that we cannot distinguish between this and Model.2
    
################################################################################################################################################    
# STEP 8: Coefficient table and the important info ------------------------
    
  # Let's start by look at our best model (i.e. model 2)
    anova(Model.2)
    
    # Analysis of Variance Table
    # 
    # Response: Sepal.Length
    #             Df Sum Sq Mean Sq F value    Pr(>F)    
    # Species      2 63.212 31.6061 183.615 < 2.2e-16 ***
    # Petal.Area   1 13.825 13.8249  80.316 1.388e-15 ***
    # Residuals  146 25.131  0.1721                      
    # ---
    # Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    
    # Understanding the ANOVA results of a model --------------------------------------
    # Df = degrees of freedom
        # Think of this like a currency. The more samples, the more money. To do analysis costs money. The more "things" a bit of analysis has to calculate, the more expensive it is.
    # Sum Sq = Sums of squares
        # Variation explained by each variable and residuals (the numbers themselves mean nothing)
    # Mean Sq = Sum Sq / Df
        # Variation axplained divided by how "expensive" it was to calculate
    # F value = Mean Sq (of variable) / Mean Sq (of Residuals)
        # Ratio of explained variation divided by unexplained variation
    # P-value based on F value (large F value often = small p-value)
        # Depends on Df and an F distribution
    # Residuals = remaining variation
        # Unexplained variation
    
    # You can calculate the total variation in the dataset
        63.212 + 13.825 + 25.131
        # 102.168
    # Let's see what proportion of variance we are explaining:
        (63.212 + 13.825) / 102.168
        # 0.7540228 (we explain about 75% of the total variation with Species and Petal.Area)
        # 75% is the R-sq value! (See below in summary(Model.2))
    
    
    # We'll discuss this more in the workshop
    
  
  # Let's use Model.2 to start looking at the coefficient table
    summary(Model.2)
        # Call:
        #   lm(formula = Sepal.Length ~ Species + Petal.Area, data = iris)
        # 
        # Residuals:
        #      Min       1Q   Median       3Q      Max 
        # -1.05613 -0.28357  0.00553  0.24753  1.03014 
        # 
        # Coefficients:
        #                   Estimate Std. Error t value Pr(>|t|)    
        # (Intercept)        4.93018    0.05928  83.166  < 2e-16 ***
        # Speciesversicolor -0.18054    0.14913  -1.211   0.2280    
        # Speciesvirginica  -0.68490    0.26621  -2.573   0.0111 *  
        # Petal.Area         0.20739    0.02314   8.962 1.39e-15 ***
        #   ---
        # Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
        # 
        # Residual standard error: 0.4149 on 146 degrees of freedom
        # Multiple R-squared:  0.754,	Adjusted R-squared:  0.749   <- ***Here is the R-sq value we calculated above!***
        # F-statistic: 149.2 on 3 and 146 DF,  p-value: < 2.2e-16  <- ***And this is the anova table summarised into a single line***
    
    # Questions:
    # 1. What are residuals?
    # 2. Can you draw the results out by hand?
    # 3. What do the p-values mean?
    # 4. What do the R-sqaured values mean? What are the adjusted vrs multiple R-squared?
    # 5. What does the F-statistic p-value mean?
    
    # Answers:
    # 1. Residuals is all of the variation in the data that your model does not explain, 
      # any trend in these suggest that there are variables in your system that you are not taking into accounts.
      # Or that you may not have a linear relationship (or many other things)
    # 2. We'll do this on a board or in paint or something.
    # 3. The null hypothesis of these are that each are not different from 0 (both y-intercept and gradient),
      # but also if different levels of, e.g. a factor, are different from each other.
    # 4. Multiple r-squared is the correlation coefficient. 0 means no correlation between response and explanatories, 1 means perfect correlation.
      # Adjusted r-squared adjusts the r-squared based on the number of variables in the model.
    # 5. The F-statistic p-value tests the hypothesis that your modelled data is no different from a model with completely random data.
      # p < 0.05 means your model is significantly different from a model with random data.
    
  # And Model.1 which had our interaction
    summary(Model.1)
        # Call:
        #   lm(formula = Sepal.Length ~ Species * Petal.Length, data = iris)
        # 
        # Residuals:
        #   Min       1Q   Median       3Q      Max 
        # -0.73479 -0.22785 -0.03132  0.24375  0.93608 
        # 
        # Coefficients:
        #                                 Estimate  Std. Error  t value   Pr(>|t|)    
        # (Intercept)                      4.2132     0.4074    10.341    < 2e-16  ***
        # Speciesversicolor               -1.8056     0.5984    -3.017    0.00302  ** 
        # Speciesvirginica                -3.1535     0.6341    -4.973    1.85e-06 ***
        # Petal.Length                     0.5423     0.2768     1.959    0.05200  .  
        # Speciesversicolor:Petal.Length   0.2860     0.2951     0.969    0.33405    
        # Speciesvirginica:Petal.Length    0.4534     0.2901     1.563    0.12029    
        # ---
        #   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
        # 
        # Residual standard error: 0.3365 on 144 degrees of freedom
        # Multiple R-squared:  0.8405,	Adjusted R-squared:  0.8349 
        # F-statistic: 151.7 on 5 and 144 DF,  p-value: < 2.2e-16    

################################################################################################################################################    
# STEP 9: Plotting output of the model ------------------------------------
    # We'll use the package jtools here to make life easier on ourselves
    
    library(jtools)
    # https://cran.r-project.org/web/packages/jtools/vignettes/summ.html
    # See the above url for a fantastic vignette (guide) on how to use the package. 
    #   It has many, many uses!
    plot_summs(Model.1)
    
    # You can also do "plot_summs(Model.4, Model.1)" to see how your different model results compare.
    plot_summs(Model.1, Model.2)
    
    # If you want to get specific predictions from your model to see what is happening with each explanatory variable:
    effect_plot(Model.1, pred = Petal.Area, interval = TRUE) 
    effect_plot(Model.2, pred = Petal.Area, interval = TRUE) 

    # To plot the factor variables
    cat_plot(Model.1, pred = Species, interval = T)
    cat_plot(Model.2, pred = Species, interval = T)
    
    # To plot the interaction between both Specis and Petal.Length
    interact_plot(Model.1, pred = Petal.Area, modx = Species, interval = TRUE)
    
    # Why does the SE envelope get so big for setosa?
    interact_plot(Model.1, pred = Petal.Area, modx = Species, interval = TRUE, plot.points = T)
    
    # Plot for best model:
    interact_plot(Model.2, pred = Petal.Area, modx = Species, interval = TRUE, plot.points = T)
    
################################################################################################################################################    
# STEP 10: Publish and run away to Nepal ----------------------------------