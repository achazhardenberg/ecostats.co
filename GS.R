#How does climate change affect plants?
#Roberta Esposto
#28-01-2015


#Introduction:  Over the past decades the climate change has become a topic of great attention. The evaluation of the effects of global change on ecosystems and, more generally, the spatial developement, has become an essential element of knowledge in the menagement and sustainable use of natural resources. The gradual increase in the average temperature of the planet determines not negligible impacts also on forest ecosystems, whose distribution is closely related to climatic conditions.In this project I will analyze climate changes from 2005 to 2007 especially considering the begginning(BGS), the ending(EGS) and the length(GSL) of growing season at different altitudes in Aosta Valley.

#Methods:  DATA.  The data were taken from a lesson in "Plant ecology" of Professor Siniscalco. The data are divided into five columns: location(ID), location's elevation, start of the growing season(BGS), the end of the growing season(EGS) and duration of the growing season(GSL).
#STATISTICAL METHODS.  I used a lot of scatter graphs to compare the variables. I also used simple linear regression with the function"lm" to analyze the relationship between all my variables.All analyses were conducted in the statistical environment R version 3.0.2. (R Core Team 2014).

#Results:
#I analyzed the data from 2005 to 2007 of growth of vegetation at different elevations.
#1)First of all I create a subset with beginning of growing season,ending of growing season and growing season length in Etroubles. The Fig.1 represents the beginning of growing season from 2005 to 2007. There is an advance of about seven days in 2007.

gs.dat<-read.csv2("gs1.csv")
gsetroubles.dat<-subset(gs.dat,ELEVATION=="1330")#I create a subset with BGS, EGS, GSL at 1330 meters elevation, in Etroubles
with(gsetroubles.dat,plot(BGS~YEAR,ylab="BGS(DOY)",main="Fig.1"))
#2)I analyzed BGS in Etroubles and in the fig.2 we can see a normal distribution:

boxplot(gsetroubles.dat$BGS,col="pink",ylab="BGS(DOY)",main="max and min BGS in Etroubles")#to see the maximun and the minimum of BGS,and the mean between them(108)
#3)I create a subset with data of 2005 and I analyzed the differences between the beginning of growing season at different elevation. There is a delay of about 30 days between high and low elevation:
gs2005.dat<-subset(gs.dat,YEAR=="2005")#I crate a subset with data of 2005
boxplot(gs2005.dat$BGS,col="red",ylab="BGS(DOY)",main="BGS in 2005 at different elevation")

#4)Now I compare the growing season length in 2005-2007.The length of the growing season has become more long considerably from 2005 to 2007, in particular at high elevation:

par(mfrow=c(1,3))#to realize more graphics
#Now compare the GSL in 2005-2007
boxplot(gs2005.dat$GSL,col="light blue",ylab="growing season length",main="GSL in 2005")
gs2006.dat<-subset(gs.dat,YEAR=="2006")
boxplot(gs2006.dat$GSL,col="blue",ylab=" growing season length",main="GSL in 2006")
gs2007.dat<-subset(gs.dat,YEAR=="2007")
boxplot(gs2007.dat$GSL,col="purple",ylab="growing season length",main="GSL in 2007")

#5)I compare the growing season length at elevation of 1330m and 2080m.At 2080 meters of elevation the length of the growing season increases of 14 days(fig.3 e 4).

#comparing the GSL to elevation 1330 meters and 2080 meters
par(mfrow=c(1,2))
with(gsetroubles.dat,plot(GSL~YEAR,main="(Fig.3) 1330m"))
gstorgnon.dat<-subset(gs.dat,ELEVATION=="2080")
with(gstorgnon.dat,plot(GSL~YEAR,main="(Fig.4) 2080m"))

#6)I put in relation the beginning of growing season and the ending of growing season with the elevation.As can be seen from Figures 5 and 6 the beginning and the ending of the growing season are closely related to the elevation.

#I put in relation BGS and EGS with elevation
with(gs.dat,plot(BGS~ELEVATION,main="Fig.5"))
elevation.lm<-lm(BGS~ELEVATION,data=gs.dat)
abline(elevation.lm)
with(gs.dat,plot(EGS~ELEVATION,main="Fig.6"))
elevation2.lm<-lm(EGS~ELEVATION,data=gs.dat)
abline(elevation2.lm)
summary(elevation.lm)
#To better understand we create more plot for the residuals:
par(mfrow=c(1,1))
plot(elevation.lm)
summary(elevation2.lm)
plot(elevation2.lm)

#7)I put the growing season length with the elevation.

#I put in relation GSL with elevation
with(gs.dat,plot(GSL~ELEVATION,main="Fig.7"))
elevation3.lm<-lm(GSL~ELEVATION,data=gs.dat)
abline(elevation3.lm)
summary(elevation3.lm)
plot(elevation3.lm)
#Discussion: From the analysis performed it can be said that there is a strong correlation between the growing season and elevation. The BGS occurs with about 30 days of delay between the low and the high elevation, contrary to the EGS that arrives first at high elevation.The length of the growing season will be reduced by about 50 days at high altitude. All this can be related to a difference in temperature at different elevations. In fact, where the temperature is highest we have a premature yellowing of leaves, and a shorter length of the growing season.Comparing the GSL 2005 to 2007 it is clear that it has become longer, especially at high elevation. This is due to the considerable rise in temperature in 2007.High winter temperatures resulted in a considerable anticipation of BGS dates, more than 2 weeks.Furthermore BGS and EGS are closely related to the elevation, more high is the elevation and more the plants are affected by temperature because of the higher temperature range.
#All the details of the residues are in the word file.