#Load in necessary packages
from scipy.stats import norm

import matplotlib.pyplot as plt

#construct normal distribution
a=norm.rvs(size=1000000,loc=-2, scale=1.5)
h=plt.hist(a,bins=100,normed=True)

#construct uniform distribution
from scipy.stats import uniform
b=uniform.rvs(size=1000000,loc=-1,scale=2)
i=plt.hist(b,bins=100,normed=True)

#Calculate x=a*b and then plot histogram.  Save figure
x=a*b

#Plotting and saving
h=plt.hist(x,bins=100,normed=True)

plt.savefig('hist1.pdf')

#I eye balled the plots and they are centred at zero.
