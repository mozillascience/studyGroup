# -*- coding: utf-8 -*-
from numpy import float32
from numpy import linspace
from numpy import polyfit
from numpy import polyval
import matplotlib.pyplot as plt

#Read in data from csv
f=open('data.csv','r')
line=f.readlines()

#Empty array for data
FN=[]
EFN=[]
#This loop goes through every line, strips new line character and then splits the data on ,.  It will then save data into the arrays
for l in line:
    a=l.strip()
    x,y=a.split(",")
    FN.append(float32(x))
    EFN.append(float32(y))
f.close()

#Generate linear space but this was not used as of yet  
z=linspace(-1,4)

#Create grid and plot data
fig = plt.figure(figsize = (4,4), dpi = 600)
a = fig.add_subplot(1,1,1)

plt.plot(FN,EFN,'ks',markersize=3)

#Created a fitted line for the data
fit=polyfit(FN,EFN,1)
plt.plot(z,polyval(fit,z),label=fit,color='k')

#Reset font size
for t in a.yaxis.get_major_ticks():
    t.label.set_fontsize(6)
for t in a.xaxis.get_major_ticks():
    t.label.set_fontsize(6)

#Set the subplot sizing
fig.subplots_adjust(top=0.95, right =0.89, left=0.13,bottom=0.25)
#Set limits and labels
plt.xlim(-0.2,3.5)
plt.ylim(0,0.8)
plt.ylabel(r'Extrafloral Nectar (mg of sugar per extrafloral nectary)',fontsize=6,verticalalignment='center')
plt.xlabel(r'Floral Nectar (mg of sugar per flower)',fontsize=6,horizontalalignment='center')

#Save as pdf
fig.savefig('EFNvFN.pdf',dpi=600)

plt.show()

"""In ecology, animals and plants interact with one another in an ecosystem.  
There are several types of interactions that may occur such as predation, 
parasitisim and mutualism. Mutualism is where the animals and plants both give 
one another a survival benefit.  So if a trait is not useful why invest energy 
into producing it?
 
Different interactions have generally been studied individually even though
they occur in a community. This plot shows the relationship between EFN and FN 
production in T. ulmifolia. There is a positive correlation, which suggests that 
plants that produce more of one also produce more of the other
This is probably because of overall plant vigour. This was an initial figure
for a later experiment showing interactions."""
