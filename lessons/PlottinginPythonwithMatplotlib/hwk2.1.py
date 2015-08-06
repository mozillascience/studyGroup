#Load in necessary packages
from scipy.stats import norm

from pylab import hist

#construct normal distribution
a=norm.rvs(size=1000000,loc=-2, scale=1.5)
h=hist(a,bins=100,normed=True)

#construct uniform distribution
from scipy.stats import uniform
b=uniform.rvs(size=1000000,loc=-1,scale=2)
i=hist(b,bins=100,normed=True)

#Calculate x=a*b and then plot histogram.  Save figure
x=a*b

#Plotting and saving
h=hist(x,bins=100,normed=True)
#This generates a new window to place figures
plt.figure(0)

savefig('hist1.pdf')

#I eye balled the plots and they are centred at zero.