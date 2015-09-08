#Import necessary modules for movie animation
from scipy.io.netcdf import *
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as an


#Open NETCF file and read in data as file f
f=netcdf_file('trajectory.nc','r')
position=f.variables['position'][:]
time=f.variables['timepoints'][:]



#Create an FFMPEG writer
ffwriter=an.writers['ffmpeg']

#Creating Metadata
metadata=dict(title='Trajectory Animation',artist='Ricardo Harripaul')

#Specify the writer paramters

writer=ffwriter(fps=15, metadata=metadata)

fig=plt.figure()

#Open an empty plot to start plotting

l,=plt.plot([],[],'ko')

plt.xlim(-20,20); plt.ylim(-20,20)

x0=np.zeros(0)
y0=np.zeros(0)

with writer.saving(fig,'trajectory.mp4', 200):
    for i in range(202):
        x0=time[i]
        y0=position[i]
    
    #Specify new x and y data for position and velocity
        l.set_data(x0,y0)
        writer.grab_frame()   
f.close()
