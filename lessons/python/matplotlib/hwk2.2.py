#import necessary modules for poly1d and arange from numpy
from numpy import poly1d,arange
import matplotlib.pyplot as plt

#Generate an empty array for storing the roots
roots=[]

#Nested loops iterates through all the range of s and zeta passing the values
#to the poly1d and solving the roots.  The roots are then stored in the roots array
for s in arange(0.0,0.65,0.01):
    for z in arange(0.0,0.62,0.01):
        
        p=poly1d([1,0,z-2,z,0],variable='s')
        roots.append(p.r)
 
#Generate empty array for storing non zero values of the roots   
nonzeros=[]
#This loop extracts out the non zero values of the roots and appends it to a new array
for i in range(len(roots)-1):
    nonzeros.append(roots[i][0:3])

#Plot zeros
plt.plot(nonzeros)

#save figure

plt.savefig("roots.pdf")
