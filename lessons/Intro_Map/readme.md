# Introduction to Mapping in R: Building a Map from Scratch
Juliano Palacios Abrantes & Hassen Allegue  
16/3/2017  

# Objectives
This session will be focused on creating maps from scratch ideally to present study areas. We will also learn an easy, straightforward way for quick map and spatial data visualization.

For this session we will create a map of the Pacific North West (because we ALL love the PNW). We will use coastal data from Natural Earth (because that's how I learned) and from Marine Regions (Sooo many cool stuff!). We will then plot the coast from Alaska to California and add the [Economic Exclusive Zone](https://stats.oecd.org/glossary/detail.asp?ID=884) of each country.

# Instructions

1. **Session Matterials:** Get the workshop materials: Go to the repository and click on the "fork" button to create an independent copy within your own GitHub account. Alternately, click on the "clone or download" button. 

2. **Shapefiles:** In here you can download the [Natural Earth 10-m-resolution coastline shapefile](http://www.naturalearthdata.com/downloads/10m-physical-vectors/) and the [World EEZ v8 (2014-02-28, 65 MB))](http://www.marineregions.org/downloads.php) (download the low res file, it's faster to plot) located under "Exclusive Economic Zones Boundaries (EEZ)".

*Note*: if you followed step 1, save the shapefiles on the *Data* folder

3. **csv files:** All csv files are located in the *Data* folder (*harbour_seal_GPS.csv* and *Pink_Salmon_Occ.csv*)

4. **Necessary Packages:**


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

# ggmap()
#install.packages('ggmap')
library("ggmap")

# for leaflet() and colorFactor()
#install.packages('leaflet')
library("leaflet")

#for htmlEscape()
#install.packages('htmltools')
library("htmltools")

```
