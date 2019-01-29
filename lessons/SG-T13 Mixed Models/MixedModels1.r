setwd("C:/Users/nhy577/Documents/_toma/TEACHING/MozillaStudyGroupAberdeen_2019")

library(lattice)
library(nlme)

# load the rats data
rats<- read.delim("rats.txt")
# treat rat ID as factor
rats$ID2<- factor(rats$ratID, labels= "ID_")
# slight variation (redundant)
rats$ID<- factor(rats$ratID)

plot(rats$weight~rats$day, col= 1:7, pch= 1:5) # particularly ugly

# panel plot by rat using lattice, to show individual trajectories
pdf("RATS_trajectories_IDpanel.pdf", 12, 7)
xyplot(weight~day|ID2, data= rats, type= "b")
dev.off()
# individual trajectories in separate panels
pdf("RATS_trajectories.pdf", 6, 5)
xyplot(weight~day, groups= ID2, data= rats, type= "b")
dev.off()

model1<- lm(weight ~ day, data= rats)
summary(model1)

pdf("RATS_model1_diagnostics.pdf", 6, 5)
par(mfrow= c(2, 2), mar= c(5.1, 4.1, 1.3, 1.1))
plot(model1)
dev.off()

# predict average rat size for each day from 5 to 40 days
model1.pred<- predict(model1, newdata= list(day= 5:40), se= T)

# plot fitted values (predicted mean growth for all rats)
pdf("RATS_weight~day_by_ratID.pdf", 5, 5)
xyplot(weight~day, groups= ID, data= rats, cex= 1.3, panel= function(...){
	panel.xyplot(...)
	panel.xyplot(5:40, model1.pred$fit + 1.96*model1.pred$se.fit, lwd= 3, lty= 2, type= "l", col= 1)
	panel.xyplot(5:40, model1.pred$fit - 1.96*model1.pred$se.fit, lwd= 3, lty= 2, type= "l", col= 1)
	panel.xyplot(5:40, model1.pred$fit, lwd= 3, lty= 1, type= "l", col= 1)
	})
dev.off()

# extract residuals
rats$resid1<- residuals(model1)
# sort rats by mean of residuals
sortedID<- names(sort(tapply(rats$resid1, rats$ID, mean)))
# boxplot of residuals by individual, sorted by increasing mean
pdf("RATS_resid1~ratID.pdf", 10, 6)
par(mfrow= c(1, 1), mar= c(5.1, 5.1, 1.3, 1.1))
plot(rats$resid1~factor(rats$ratID, levels= sortedID), xlab= "rat ID", ylab= "residuals(model1)", cex.lab= 1.8, cex.axis= 0.8, border= 1, lwd= 1.6, lty= 1)
abline(h= 0, lty= 2, lwd= 1.4)
dev.off()


pdf("RATS_weight~day_by_ratID_grid_SimpleRegression.pdf", 12, 5.5)
xyplot(weight~day|ID2, groups= ratID2, data= rats, cex= 1, layout= c(10, 3),
	panel= function(...){
		panel.xyplot(...)
		panel.abline(lm(rats$weight~rats$day), lwd= 2)
	})
dev.off()


############### fixed ratID effect ###############
# rats$ID<- factor(rats$ratID)
model2<- lm(weight ~ day + ID, data= rats)
summary(model2)

anova(model1)
anova(model2)

pdf("RATS_model2_diagnostics.pdf", 6, 5)
par(mfrow= c(2, 2), mar= c(5.1, 4.1, 1.3, 1.1))
plot(model2)
dev.off()

rats$resid2<- residuals(model2)
sortedID<- names(sort(tapply(rats$resid2, rats$ratID, mean)))

pdf("RATS_resid2~ratID.pdf", 10, 6)
par(mfrow= c(1, 1), mar= c(5.1, 5.1, 1.3, 1.1))
plot(rats$resid2~factor(rats$ratID, levels= sortedID), xlab= "ratID", ylab= "residuals(model2)", cex.lab= 1.8, cex.axis= 0.8, border= 1, lwd= 1.6, lty= 1)
abline(h= 0, lty= 2, lwd= 1.4)
dev.off()

# plot model predictions for all days from 5 to 40 days old
pdf("RATS_weight~day_by_ratID_model2.pdf", 5, 5)
xyplot(weight~day, groups= ID, data= rats, cex= 1.3, panel= function(x,y,groups,subscripts){
	panel.xyplot(x,y, cex= 2)
	for(k in unique(rats$ID)){
		panel.xyplot(5:40, predict(model2, newdata= data.frame(day= 5:40, ID= k)), col= grey(0.7), type= "l")
    }
})
dev.off()


########## distribution of intercepts for individual rats: plot the histogram
# extract model coefficients
model2.coef<- model2
model2.coef # same coefficients as given by summary(model2)
model2.coef[1] # intercept for individual 1
model2.coef[2] # slope for all individuals
model2.coef[3:31] # difference in intercepts between individuals 2 to 30 and individual 1
model2.coef[1] + model2.coef[3:31] # intercepts for individuals 2 to 30
All.inter.M2<- c(model2.coef[1], model2.coef[1] + model2.coef[3:31]) # intercepts for all individuals

# a quicker way to get this is to re-fit the model without a general intercept
model2.coef.alt<- coef(lm(weight ~ day + ID - 1, data= rats))
model2.coef.alt
All.inter.M2<- model2.coef.alt[-1] # remove the slope

# histogram of intercepts for all individuals
pdf("RATS_model2_coefs_histogram.pdf", 5, 5)
hist(All.inter.M2, nclass= 20, xlab= "individual intercept estimate", main= "model2")
dev.off()

###################### Analysis with Mixed Effects models ######################
###################### (also called random effects models) ######################

############### model with random ratID intercept ###############
model3<- lme(weight ~ day, random= ~1|ID, data= rats)
summary(model3)
anova(model2)
anova(model3)

# conventional plots similar to plot.lm
pdf("RATS_model3_diagnostics.pdf", 6, 5)
par(mfrow= c(2, 2), mar= c(5.1, 4.1, 1.3, 1.1))
plot(residuals(model3)~fitted(model3)); abline(h= 0, lty= 2)
qqnorm(residuals(model3)); qqline(residuals(model3))
hist(residuals(model3))
dev.off()

# Also need to check the assumption of normality of the random intercepts
pdf("RATS_model3_normality_of_random_effects.pdf", 5, 4)
par(mfrow= c(1, 1), mar= c(5.1, 5.1, 1.3, 1.1))
model3.ranef<- ranef(model3)
qqnorm(unlist(model3.ranef))
qqline(unlist(model3.ranef), col= "red")
dev.off()

# boxplot of residuals by individual
rats$resid3<- residuals(model3, level= 1)
sortedID<- names(tapply(rats$resid3, rats$ratID, mean))
pdf("RATS_resid3~ratID.pdf", 10, 6)
par(mfrow= c(1, 1), mar= c(5.1, 5.1, 1.3, 1.1))
plot(rats$resid3~factor(rats$ratID, levels= sortedID), xlab= "ratID", ylab= "residuals(model3, level= 1)", cex.lab= 1.8, cex.axis= 0.8, border= 1, lwd= 1.6, lty= 1)
abline(h= 0, lty= 2, lwd= 1.4)
dev.off()

### plot predictions of models at population and individual levels
# a trick to get standard errors on predicted values (predict.lme doesn't give this)
library(mgcv)
model3.pred<- predict(gamm(weight ~ day, random= list(ID= ~1), data= rats)$gam, newdata= data.frame(day= 5:40, ID= "1"), se= T)

pdf("RATS_weight~day_by_ratID_model3.pdf", 5, 5)
xyplot(weight~day, groups= ID, data= rats, cex= 1.3, panel= function(x,y,groups,subscripts){
	panel.xyplot(x,y, col= 1, cex= 2)
	for(k in unique(rats$ID)){
		panel.xyplot(5:40, predict(model3, newdata= data.frame(day= 5:40, ID= k), level= 1), col= grey(0.7), type= "l")}
	panel.xyplot(5:40, model3.pred$fit, lwd= 3, lty= 1, type= "l", col= 1)
	panel.xyplot(5:40, model3.pred$fit + 1.96*model3.pred$se.fit, lwd= 3, lty= 2, type= "l", col= 1)
	panel.xyplot(5:40, model3.pred$fit - 1.96*model3.pred$se.fit, lwd= 3, lty= 2, type= "l", col= 1)
	})
dev.off()


# illustrating level-1 and level-0 residuals
pdf("RATS_resid3~ratID~level.pdf", 10, 10)
par(mfrow= c(2, 1), mar= c(4.3, 5.1, 0.2, 1.1))
plot(residuals(model3, level= 1)~rats$ID, xlab= "", ylab= "residuals(model3, level= 1)", cex.lab= 1.8, cex.axis= 0.8, border= 1, lwd= 1.6, lty= 1)
abline(h= 0, lty= 2, lwd= 1.4)
plot(residuals(model3, level= 0)~rats$ID, xlab= "ratID", ylab= "residuals(model3, level= 0)", cex.lab= 1.8, cex.axis= 0.8, border= 1, lwd= 1.6, lty= 1)
abline(h= 0, lty= 2, lwd= 1.4)
dev.off()


#### model selection
model0.ML<- lme(weight ~ 1, random= ~1|ID, data= rats, method= "ML")
model3.ML<- update(model3, method= "ML")
anova(model3.ML, model0.ML)

model1.REML<- gls(weight ~ day, data= rats, method= "REML")
anova(model1.REML, model3)


### repeating model 3 after centering the 'day' variable

# centering the day variable around its mean (mean is 22)
rats$day.ct<- rats$day - mean(rats$day) # mean of day.ct is now 0

rats<- groupedData(weight~day.ct|ID, data= rats)
model3ct<- lme(weight ~ day.ct, random= ~1|ID, data= rats)
summary(model3ct)
plot(rats)
plot(augPred(model3ct))


model3ct.ranef<- ranef(model3ct)
qqnorm(unlist(model3ct.ranef))
qqline(unlist(model3ct.ranef), col= "red")


intervals(model3ct)


##################### what if both the slope and the intercept vary among individuals?
############### fixed day*ratID effect ###############
rats$day.ct<- rats$day - mean(rats$day) # mean is 22
model3<- lm(weight ~ day.ct * ID - 1, data= rats)
anova(model2)
anova(model3)

pdf("RATS_model3_diagnostics.pdf", 6, 5)
par(mfrow= c(2, 2), mar= c(5.1, 4.1, 1.3, 1.1))
plot(model3)
dev.off()

plot(rats$day.ct, rats$weight, col= trecols30[rats$ratID])
for(i in unique(rats$ID)){
	lines(5:40-22, predict(model3, newdata= data.frame(day.ct= 5:40-22, ID= i)), col= trecols30[as.numeric(i)])
}

pdf("RATS_weight~day_by_ratID_model3.pdf", 5, 5)
xyplot(weight~day.ct, groups= ID, data= rats, cex= 1.3, panel= function(x,y,groups,subscripts){
	panel.xyplot(x,y, col= trecols30[groups[subscripts]], cex= 2)
	for(i in unique(rats$ID)){
		panel.xyplot(5:40-22, predict(model3, newdata= data.frame(day.ct= 5:40-22, ID= i)), col= trecols30[as.numeric(i)], type= "l")}
	})
dev.off()

rats$resid3<- residuals(model3)
sortedID<- names(sort(tapply(rats$resid3, rats$ratID, mean)))

pdf("RATS_resid3~ratID.pdf", 10, 6)
par(mfrow= c(1, 1), mar= c(5.1, 5.1, 1.3, 1.1))
plot(rats$resid3~factor(rats$ratID, levels= sortedID), xlab= "ratID", ylab= "residuals(model3)", cex.lab= 1.8, cex.axis= 0.8, border= rep(trellis.par.get()$superpose.symbol$col, l= 30)[as.numeric(sortedID)], lwd= 1.6, lty= 1)
abline(h= 0, lty= 2, lwd= 1.4)
dev.off()




################################# shrinkage effect ####################################
################# RATS data ###################
rats<- groupedData(weight~day.ct|ID, data= rats)
summary(lmList(rats))
rats.RI.fix<- coef(lm(weight~day.ct+ID-1, data= rats))[-1]
rats.RI.rnd<- unlist(ranef(lme(weight~day.ct, random= ~1|ID, data= rats))+fixef(lme(weight~day.ct, random= ~1|ID, data= rats))[1])
pdf("RATS_RI_shrinkage.pdf", 4, 4.5)
plot(rats.RI.fix, rats.RI.rnd, asp= 1, xlab= "RATS fixed intercept", ylab= "RATS random intercept", main= "RATS data")
abline(0,1)
abline(v= mean(rats.RI.fix), h= mean(rats.RI.rnd), lty= 2)
dev.off()

### random intercept AND slope
rats.RIS<- lme(weight~day.ct, random= ~day.ct|ID, data= rats)
rats.RIS.fix<- coef(lmList(rats))
rats.RIS.rnd<- t(t(ranef(rats.RIS))+fixef(rats.RIS))
VarCorr(rats.RIS)
# ID = pdLogChol(day.ct) 
#             Variance    StdDev     Corr  
# (Intercept) 203.1651463 14.2536012 (Intr)
# day.ct        0.2606718  0.5105603 0.668 
# Residual     36.1754121  6.0145999


pdf("RATS_RIS_shrinkage.pdf", 4, 4.5)
plot(rats.RIS.fix[, 1], rats.RIS.fix[, 2], col= grey(0.7), main= "RATS data", xlab= "(Intercept)", ylab= "day.ct coefficient")
abline(h= fixef(rats.RIS)[2], v= fixef(rats.RIS)[1], lty= 2)
segments(x0= rats.RIS.fix[, 1], y0= rats.RIS.fix[, 2], x1= rats.RIS.rnd[, 1], y1= rats.RIS.rnd[, 2])
points(rats.RIS.fix, pch= 16, cex= 1.2, col= 2)
points(rats.RIS.rnd, pch= 16, cex= 1.2, col= 3)
points(rats.RIS.fix, pch= 1, cex= 1.2, col= 1)
points(rats.RIS.rnd, pch= 1, cex= 1.2, col= 1)
legend(0.2, 0.4, c("fixed effect", "random effect"), pch= 16, col= c(2, 3), bty= "n")
dev.off()


################# SHRINKAGE - RATS data - MISSING OBSERVATIONS ###################
# selectively remove some data from the rats data set
subs1<- rats$ID %in% c(2, 9, 3) & rats$day < 16
subs2<- rats$ID %in% c(24, 15) & rats$day > 25
rats2<- rats[!(subs1 | subs2), ]
rats2<- groupedData(weight~day.ct|ID, data= rats2, order.group= F)
plot(rats2)

rats.RIS.2<- lme(weight~day.ct, random= ~day.ct|ID, data= rats2)
rats.RIS.2.fix<- coef(lmList(rats2))
rats.RIS.2.rnd<- t(t(ranef(rats.RIS.2))+fixef(rats.RIS.2))


pdf("RATS_RIS_shrinkage_unbalanced.pdf", 8, 4.5)
par(mfrow= c(1, 2))
plot(rats.RIS.fix[, 1], rats.RIS.fix[, 2], col= grey(0.7), main= "RATS data", xlab= "(Intercept)", ylab= "day.ct", ylim= c(4.5, 7.5), xlim= c(210, 290))
abline(h= fixef(rats.RIS)[2], v= fixef(rats.RIS)[1], lty= 2)
segments(x0= rats.RIS.fix[, 1], y0= rats.RIS.fix[, 2], x1= rats.RIS.rnd[, 1], y1= rats.RIS.rnd[, 2])
points(rats.RIS.fix, pch= 16, cex= 1.2, col= 2)
points(rats.RIS.rnd, pch= 16, cex= 1.2, col= 3)
points(rats.RIS.fix, pch= 1, cex= 1.2, col= 1)
points(rats.RIS.rnd, pch= 1, cex= 1.2, col= 1)
points(rats.RIS.fix[c("2", "9", "3", "24", "15"), ], pch= 1, cex= 2.5, col= 1)
points(rats.RIS.rnd[c("2", "9", "3", "24", "15"), ], pch= 1, cex= 2.5, col= 1)
legend(0.2, 0.4, c("fixed effect", "random effect"), pch= 16, col= c(2, 3), bty= "n")
plot(rats.RIS.2.fix[, 1], rats.RIS.2.fix[, 2], col= grey(0.7), main= "RATS data\nwith missing observations", xlab= "(Intercept)", ylab= "day.ct", ylim= c(4.5, 7.5), xlim= c(210, 290))
abline(h= fixef(rats.RIS.2)[2], v= fixef(rats.RIS.2)[1], lty= 2)
segments(x0= rats.RIS.2.fix[, 1], y0= rats.RIS.2.fix[, 2], x1= rats.RIS.2.rnd[, 1], y1= rats.RIS.2.rnd[, 2])
points(rats.RIS.2.fix, pch= 16, cex= 1.2, col= 2)
points(rats.RIS.2.rnd, pch= 16, cex= 1.2, col= 3)
points(rats.RIS.2.fix, pch= 1, cex= 1.2, col= 1)
points(rats.RIS.2.rnd, pch= 1, cex= 1.2, col= 1)
points(rats.RIS.2.fix[c("2", "9", "3", "24", "15"), ], pch= 1, cex= 2.5, col= 1)
points(rats.RIS.2.rnd[c("2", "9", "3", "24", "15"), ], pch= 1, cex= 2.5, col= 1)
legend(0.2, 0.4, c("fixed effect", "random effect"), pch= 16, col= c(2, 3), bty= "n")
dev.off()


################# SHRINKAGE - RIKZ data ###################
###################### analysis of RIKZ data with random intercepts #######################
rikz<- read.delim("RIKZRichness.txt")
rikz$logR<- log(rikz$R+1)
rikz$Fbeach<- factor(rikz$Beach)
plot(logR ~ Fbeach, data= rikz)
rikz<- groupedData(logR~NAP|Fbeach, data= rikz)

summary(lmList(rikz))
rikz.RI.fix<- coef(lm(logR~NAP+Fbeach-1, data= rikz))[-1]
rikz.RI.fix.missingvals<- coef(lm(logR~NAP+Fbeach-1, data= rikz2))[-1]
rikz.RI.rnd<- unlist(ranef(lme(logR~NAP, random= ~1|Fbeach, data= rikz))+fixef(lme(logR~NAP, random= ~1|Fbeach, data= rikz))[1])
rikz.RI.rnd.missingvals<- unlist(ranef(lme(logR~NAP, random= ~1|Fbeach, data= rikz2))+fixef(lme(logR~NAP, random= ~1|Fbeach, data= rikz2))[1])
pdf("RIKZ_RI_shrinkage.pdf", 4, 4.5)
plot(rikz.RI.fix, rikz.RI.rnd, asp= 1, xlab= "RIKZ fixed intercept", ylab= "RIKZ random intercept", main= "RIKZ data")
abline(0,1)
abline(v= mean(rikz.RI.fix), h= mean(rikz.RI.rnd), lty= 2)
dev.off()

###################### analysis of RIKZ data with random intercepts and slopes #######################
rikz.RIS<- lme(logR~NAP, random= ~NAP|Fbeach, data= rikz)
rikz.RIS.fix<- coef(lmList(rikz))
rikz.RIS.rnd<- t(t(ranef(rikz.RIS))+fixef(rikz.RIS))
VarCorr(rikz.RIS)
# Fbeach = pdLogChol(NAP) 
#             Variance   StdDev    Corr  
# (Intercept) 0.18101478 0.4254583 (Intr)
# NAP         0.06461363 0.2541921 -0.066
# Residual    0.10945315 0.3308370

NAP.seq<- seq(-1.3, 2.3, l= 20)
model.rikz.RIS.pred<-predict(rikz.RIS, newdata= data.frame(NAP= NAP.seq, Fbeach= 1), level= 0)

cb.colors2<- c("#000000", "#009E73", "#e79f00", "#9ad0f3", "#0072B2", "#D55E00", 
    "#CC79A7", "#F0E442", "#555555")
pdf("RIKZrichness~NAP_by_Beach_rikzRIS.pdf", 5, 5)
xyplot(logR~NAP, groups= Fbeach, data= rikz, cex= 1.3, panel= function(x,y,groups,subscripts){
	panel.xyplot(x,y, col= cb.colors2[groups[subscripts]], cex= 2)
	for(k in unique(rikz$Fbeach)){
		panel.xyplot(NAP.seq, predict(rikz.RIS, newdata= data.frame(NAP= NAP.seq, Fbeach= k), level= 1), col= cb.colors2[as.numeric(k)], type= "l")}
	panel.xyplot(NAP.seq, model.rikz.RIS.pred, lwd= 3, lty= 1, type= "l", col= 1)
	})
dev.off()

par(mfrow= c(1, 2))
hist(ranef(rikz.RIS)$'(Intercept)', nclass= 20, main= "random intercept", xlab= "")
abline(v= 0, lwd= 3, col= 1, lty= 2)
hist(ranef(rikz.RIS)$NAP, nclass= 20, main= "random slope", xlab= "")
abline(v= 0, lwd= 3, col= 1, lty= 2)

plot(ranef(rikz.RIS)$'(Intercept)', ranef(rikz.RIS)$NAP)


pdf("RIKZ_RIS_shrinkage2.pdf", 4, 4.5)
plot(rikz.RIS.fix[, 1], rikz.RIS.fix[, 2], col= grey(0.7), main= "RIKZ data", xlab= "(Intercept)", ylab= "NAP coefficient")
abline(h= fixef(rikz.RIS)[2], v= fixef(rikz.RIS)[1], lty= 2)
segments(x0= rikz.RIS.fix[, 1], y0= rikz.RIS.fix[, 2], x1= rikz.RIS.rnd[, 1], y1= rikz.RIS.rnd[, 2])
points(rikz.RIS.fix, pch= 16, cex= 1.2, col= 2)
points(rikz.RIS.rnd, pch= 16, cex= 1.2, col= 3)
points(rikz.RIS.fix, pch= 1, cex= 1.2, col= 1)
points(rikz.RIS.rnd, pch= 1, cex= 1.2, col= 1)
legend(0.2, 0.4, c("fixed effect", "random effect"), pch= 16, col= c(2, 3), bty= "n")
dev.off()


#######################################################
################# random slopes models ################
#######################################################
rats<- groupedData(weight ~ day.ct|ID, data= rats)
model10.lm<- lmList(rats)
summary(model10.lm)
plot(model10.lm)

rats$day.ct2<- rats$day.ct^2



model10.lme<- lme(weight ~ day.ct, random= ~ day.ct|ID, data= rats)
summary(model10.lme)

plot(augPred(model10.lme), aspect="xy", grid=T)

model10.lme.pred<-predict(model10.lme, newdata= data.frame(day.ct= 5:40-22, ID= "1"), level= 0)

pdf("RATS_weight~day_by_ratID_model10lme.pdf", 5, 5)
xyplot(weight~day, groups= ID, data= rats, cex= 1.3, panel= function(x,y,groups,subscripts){
	panel.xyplot(x,y, col= trecols30[groups[subscripts]], cex= 2)
	for(k in unique(rats$ID)){
		panel.xyplot(5:40, predict(model10.lme, newdata= data.frame(day.ct= 5:40-22, ID= k), level= 1), col= trecols30[as.numeric(k)], type= "l")}
	panel.xyplot(5:40, model10.lme.pred, lwd= 3, lty= 1, type= "l", col= 1)
	})
dev.off()

par(mfrow= c(1, 2))
hist(ranef(model10.lme)$'(Intercept)', nclass= 20, main= "random intercept", xlab= "")
abline(v= 0, lwd= 3, col= 1, lty= 2)
hist(ranef(model10.lme)$day.ct, nclass= 20, main= "random slope", xlab= "")
abline(v= 0, lwd= 3, col= 1, lty= 2)

plot(ranef(model10.lme)$'(Intercept)', ranef(model10.lme)$day.ct)



model11<- lme(weight ~ day.ct + day.ct2, random= ~ day.ct + day.ct2|ID, data= rats)
summary(model11)

plot(augPred(model11), aspect="xy", grid=T)
plot(model11)



################### Fixed slopes models - RIKZ and RATS ########################
pdf("RATS_RIKZ_FIS.pdf", 7, 4)
par(mfrow= c(1, 2))
model3<- lm(weight ~ day.ct * ID - 1, data= rats)
plot(rats$day.ct, rats$weight, col= trecols30[rats$ratID], xlab= "day.ct", ylab= "weight")
for(i in unique(rats$ID)){
	lines(5:40-22, predict(model3, newdata= data.frame(day.ct= 5:40-22, ID= i)), col= trecols30[as.numeric(i)])
}

modelrikz3<- lm(logR ~ NAP * Fbeach - 1, data= rikz)
plot(rikz$NAP, rikz$logR, col= cb.colors2[rats$ratID], xlab= "NAP", ylab= "logR")
for(i in unique(rikz$Fbeach)){
	lines(NAP.seq, predict(modelrikz3, newdata= data.frame(NAP= NAP.seq, Fbeach= i)), col= cb.colors2[as.numeric(i)])
}
dev.off()


################### Random slopes models - RIKZ and RATS ########################
pdf("RATS_RIKZ_RIS.pdf", 8, 4)
plot1<- xyplot(weight~day, groups= ID, data= rats, cex= 1, panel= function(x,y,groups,subscripts){
	panel.xyplot(x,y, col= trecols30[groups[subscripts]], cex= 1)
	for(k in unique(rats$ID)){
		panel.xyplot(5:40, predict(model10.lme, newdata= data.frame(day.ct= 5:40-22, ID= k), level= 1), col= trecols30[as.numeric(k)], type= "l")}
	panel.xyplot(5:40, model10.lme.pred, lwd= 3, lty= 1, type= "l", col= 1)
	})
plot2<- xyplot(logR~NAP, groups= Fbeach, data= rikz, cex= 1, panel= function(x,y,groups,subscripts){
	panel.xyplot(x,y, col= cb.colors2[groups[subscripts]], cex= 1)
	for(k in unique(rikz$Fbeach)){
		panel.xyplot(NAP.seq, predict(rikz.RIS, newdata= data.frame(NAP= NAP.seq, Fbeach= k), level= 1), col= cb.colors2[as.numeric(k)], type= "l")}
	panel.xyplot(NAP.seq, model.rikz.RIS.pred, lwd= 3, lty= 1, type= "l", col= 1)
	})
print(plot1, split = c(1, 1, 2, 1), more = TRUE)
print(plot2, split = c(2, 1, 2, 1), more = FALSE)
dev.off()




############### marginal model version with gls ###############
model4<- gls(weight ~ day, correlation= corCompSymm(form= ~1|ID), data= rats)
summary(model4)


