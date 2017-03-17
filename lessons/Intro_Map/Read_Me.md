# Introduction to Mapping in R: Building a Map from Scratch
Juliano Palacios Abrantes  
16/3/2017  

# Objectives
This session will be focused on creating maps from scratch ideally to present study areas. We will also learn an easy, straightforqward way for quick map and spatial data visualization.

# Instructions

1. **Session Matterials:** Get the workshop materials: Go to the repository and click on the "fork" button to create an independent copy within your own GitHub account. Alternately, click on the "clone or download" button. 
2. **Necessary Packages:** 


```r
# for ogrInfo() and readOGR()
#install.packages('rgdal')
library("rgdal") 

# for file_path_sans_ext()
#install.packages('tools')
library("tools") 

# for inner_join(), summarise() and the pipe operator (%>%)
#install.packages('dplyr')
library("dplyr") 

# for fortify() and plotting
#install.packages('ggplot2')
library("ggplot2") 

# for point.in.polygon() and spDists()
#install.packages('sp')
library("sp") 
```
