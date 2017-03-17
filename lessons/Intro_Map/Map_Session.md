# Introduction to mapping in R: Making maps and fast visualization
Juliano Palacios Abrantes & Hassen Allegue  
14/3/2017  

# Instructions

1. **Session Matterials:** Get the workshop materials: Go to the repository and click on the "fork" button to create an independent copy within your own GitHub account. Alternately, click on the "clone or download" button. 
2. **Necessary Packages:** 



# Create map from scratch

## The Base Map

### Step 1. Gather Map Data

First step is to gather the data. As you might already know, maps come as shapefiles. This files oftenly comprehend a vast amount of data and a complex hierachical structure (use it and the erase it!). And they almost allways need some subsetting...

#### Download the Coastaline

There are many sources of data for the coastlines, including data sets built into R packages maps and mapdata. However, just because this is how I learned it we are using the [Natural Earth 10-m-resolution coastline shapefile](http://www.naturalearthdata.com/downloads/10m-physical-vectors/).

#### Download the EEZs
You want to access the [Marine Regions](http://www.marineregions.org/downloads.php) website and download the *"World EEZ v8 (2014-02-28, 65 MB)"* located under "Exclusive Economic Zones Boundaries (EEZ)". Check out how many cool maps/layers you can download here! 

*Note:* In coding "Order is progress", hence try your best (sometimes is really hard) to keep your s...tuff organized. I for instance, like to have a file in my project called *Data* where I store all the data I will use. 

#### If you forked and cloned from GitHub
Once you download the file save it on the *Data* file of this repository.

#### If you DID NOT forked and cloned from GitHub
Make sure the "path.ne.coast" on the next "chunk" takes you to where you stored the file

### Step 2. Load our first shape file into R


```r
# Coastal lines ####

#path.ne.coast: Specify the path for the data. If you forked form GitHub and followed the download rules you don't need to change the path or the file_name
path.ne.coast <- ("Data/ne_10m_coastline")
file_name <- "ne_10m_coastline.shp"

# Loading the shapefile:
data_coast <- readOGR(dsn = path.ne.coast, 
                     layer = file_path_sans_ext(file_name))
```

```
## OGR data source with driver: ESRI Shapefile 
## Source: "Data/ne_10m_coastline", layer: "ne_10m_coastline"
## with 4132 features
## It has 2 fields
```

```r
#You should get this Message:
#OGR data source with driver: ESRI Shapefile 
#Source: "Data/ne_10m_coastline", layer: "ne_10m_coastline"
#with 4132 features
#It has 2 fields
```

### Step 3. Subsetting
Because we're not working with the rold we need to extract the data we need. Subsetting can be one of the more annoying and time intensive parts of shapefiles. Mainly because of that complex structure I was talking about. Hence, we are borrowing Simon Goring's function "quick.subset". #SimonSays! (https://downwithtime.wordpress.com/tag/maps/)


```r
#Simons quick subset function ####
#x <- your original shapefile data
#domain <- A vector of four values that delimitates your area: c(xmin, xmax, ymin, ymax)
quick.subset <- function(x, domain){
  x@data$id <- rownames(x@data)
  x.f = fortify(x, region = "id")
  x.join <- inner_join(x.f, x@data, by = "id")
  x.subset <- subset(x.join, x.join$long > domain[1] & 
                       x.join$long < domain[2] & 
                       x.join$lat > domain[3] & 
                       x.join$lat < domain[4])
  x.subset
}

#### _______________ End of Function _____________________###

#### Subsetting our data ####

# Specify the desired domain (the West Coast of Alaska, Canada and US):
P_Lat_N <-73 #Pacific_Latitude_North
P_Lat_S <- 30 #Pacific_Latitude_South
P_Long_W <- -179.5 #Pacific_Longitude_West
P_Long_E <- -120.5 #Pacific_Longitude_East

domain <- c(P_Long_W, P_Long_E, P_Lat_S, P_Lat_N)

# Extract the coastline data for the desired domain using quick.subset():
data_coast.wc <- quick.subset(data_coast, #Orginal shapefile
                              domain #Limits
                              ) # 4132x8

kable(head(data_coast.wc,5)) #Kable is just a fancy way to show data frames ;)
```

              long        lat   order  piece   id   group    scalerank  featurecla 
------  ----------  ---------  ------  ------  ---  ------  ----------  -----------
37593    -179.4862   65.34972      18  1       38   38.1             0  Coastline  
37594    -179.4890   65.36577      19  1       38   38.1             0  Coastline  
37595    -179.4990   65.39571      20  1       38   38.1             0  Coastline  
37596    -179.4640   65.41699      21  1       38   38.1             0  Coastline  
37597    -179.4145   65.43871      22  1       38   38.1             0  Coastline  


### Step 4. Map, Map Map-ing!

The reason (one of many) that we love ggplot2 is that everything is the same. Hence, ploting maps is the same (almost!) than plotting a simple scatter plot. The more import difference is the function "coord_map(projection = )". There is a whole theory about [Map Projection](http://www.colorado.edu/geography/gcraft/notes/mapproj/mapproj_f.html) and options, for now you just have to believe that *"mercator"* is the best.


```r
# Set Limits of the plot
# Like any other plot that you make you want to set a decent X and y axis limits. The difference with maps is that you need to tell ggplot those limits
xlims <- c(-185, -116)
ylims <- c(32, 73)

# Generate a base map with the coastline:
ggplot() + 
  geom_path(data = data_coast.wc, 
            aes(x = long, y = lat, group = group), 
            color = "black",
            size = 0.25) + 
  coord_map(projection = "mercator") + #Try plotting the map without this! 
  scale_x_continuous(limits = xlims,
                     expand = c(0, 0)) + 
  scale_y_continuous(limits = ylims,
                     expand = c(0, 0)) + 
  labs(list(title = "Pacific North West Map", 
            x = "Longitude",
            y = "Latitude")) +
  theme_classic() #I'm OCD and don0t like lines and background on my plots
```

<img src="Map_Session_files/figure-html/First Map-1.png" style="display: block; margin: auto;" />

```r
#Try this other themes!:
# theme_bw()
# theme_dark()
# theme_gray()
```

So Now that we have or nice base map of the overall area of study we want to add the Exclusive Economic Zone of each country (The US will be deivided in 2; the mainland and Alaska).

## Adding the EEZ's

### Step 1. Loading the EEZ Data


```r
#We repeat the same steps than before...

#### Load World map of EEZ (takes waaaay more time) ####
path_eez_world <- ("Data/World_EEZ_v8_20140228")
fnam_eez_world <- "World_EEZ_v8_2014_HR.shp"

eez_world <- readOGR(dsn = path_eez_world,
                     layer =file_path_sans_ext(fnam_eez_world))
```

```
## OGR data source with driver: ESRI Shapefile 
## Source: "Data/World_EEZ_v8_20140228", layer: "World_EEZ_v8_2014_HR"
## with 249 features
## It has 14 fields
```

```r
# You should see the following message:
# OGR data source with driver: ESRI Shapefile 
# Source: "Data/World_EEZ_v8_20140228", layer: "World_EEZ_v8_2014_HR"
# with 249 features
# It has 14 fields

#fortify is a function of the ggplo2 package that turns a map (shpaefile) into a data frame than can more easily be plotted with ggplot2.

# For more info. check this out (https://github.com/tidyverse/ggplot2/wiki/plotting-polygon-shapefiles)

fortify.shape <- function(x){
  x@data$id <- rownames(x@data)
  x.f = fortify(x, region = "id")
  x.join <- inner_join(x.f, x@data, by = "id")
}
```

### Step 2. Map Each Country's EEZ

![It takes some time to plot](Images/yoda.jpg)



```r
#### Alaska EEZ ####

# Extract the EEZ for Alaska:
eez_Alaska <- eez_world[eez_world@data$Country == "Alaska", ]

# Fortify the shapefile data:
eez_Alaska <- fortify(eez_Alaska)

# Extract the USA EEZ polygon to save
Alaska_EEZ <- droplevels(filter(eez_Alaska, piece == 1))


Map_EEZ <- Map_eez_Can + geom_path(data = filter(eez_Alaska, piece == 1), 
            aes(x = long, y = lat, group = group), 
            colour = "purple", size = 0.75) 

#### Canada EEZ ####
# Extract the EEZ for the USA:
eez_Can <- eez_world[eez_world@data$Country == "Canada", ]

# Fortify the shapefile data:
eez_Can <- fortify(eez_Can)

# # Extract the USA EEZ polygon to save
Can_EEZ <- droplevels(filter(eez_Can, piece == 4))

Map_eez_Can <- Map_eez_US+ geom_path(data = filter(eez_Can, piece == 4), #Turns out that piece 4 is British Columbia, who knew!? 
            aes(x = long, y = lat, group = group), 
            colour = "red", size = 0.75)

#### USA EEZ ####
# Extract the EEZ for the USA:
eez_usa <- eez_world[eez_world@data$Country == "United States", ]

# Fortify the shapefile data:
eez_usa <- fortify(eez_usa)

# # Extract the USA EEZ polygon to save
USA_EEZ <- droplevels(filter(eez_usa, piece == 2))

Map_eez_US <- 
  Map_Base + 
  geom_path(data = filter(eez_usa, piece == 2), 
            aes(x = long, y = lat, group = group), 
            colour = "blue", size = 0.75) 


  

  
  #### EEZ Names ####
Map_EEZ_Names <- Map_EEZ +
    annotate("text",
             x=-150,
             y=65,
             colour="purple",
             label= "Alaska")+
    annotate("text",
             x=-150,
             y=48,
             colour = "red",
             label= "Canada EEZ -> ")+
    annotate("text",
             x=-145,
             y=41,
             colour = "blue",
             label= "USA EEZ ->")
  
Map_EEZ_Names
```

# Points inside EEZ




# Leaflet for R

https://rstudio.github.io/leaflet/
[GitHub](https://github.com/rstudio/leaflet)


## Leaflet example




#### Cool Maps sources
[Marine Regions](http://www.marineregions.org/downloads.php)
