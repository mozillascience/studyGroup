# Intro to maps
Juliano Palacios Abrantes  
14/3/2017  




# Create map from scratch

## Base MAP


```r
# World map ####
path.ne.coast <- ("Data/ne_10m_coastline")
fnam.ne.coast <- "ne_10m_coastline.shp"
dat.coast <- readOGR(dsn = path.ne.coast, 
                     layer = file_path_sans_ext(fnam.ne.coast))
```

```
## OGR data source with driver: ESRI Shapefile 
## Source: "Data/ne_10m_coastline", layer: "ne_10m_coastline"
## with 4132 features
## It has 2 fields
```

```r
# A Large SpatialLinesDataFrame object with 4132 features and 2 fields (12.8 Mb)

# Provide the function quick.subset() from Simon Goring's page:
# https://downwithtime.wordpress.com/tag/maps/
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
# domain should be a vector of four values: c(xmin, xmax, ymin, ymax)

# Specify the desired domain (the West Coast of USA, Canada and Alaska):
P_Lat_N <-73 #Pacific_Latitude_North
P_Lat_S <- 30 #Pacific_Latitude_South
P_Long_W <- -179.5 #Pacific_Longitude_West
P_Long_E <- -120.5 #Pacific_Longitude_East
domain <- c(P_Long_W, P_Long_E, P_Lat_S, P_Lat_N)

# Extract the coastline data for the desired domain using quick.subset():
dat.coast.wc <- quick.subset(dat.coast, domain) # 4871x8

# Set Limits of the plot
xlims <- c(-185, -116)
ylims <- c(32, 73)

# Generate a base map with the coastline:
Map_Base <- ggplot() + 
  geom_path(data = dat.coast.wc, aes(x = long, y = lat, group = group), 
            color = "black",
            size = 0.25) + 
  coord_map(projection = "mercator") + 
  scale_x_continuous(limits = xlims,
                     expand = c(0, 0)) + 
  scale_y_continuous(limits = ylims,
                     expand = c(0, 0)) + 
  labs(list(title = "", 
            x = "Longitude",
            y = "Latitude")) +
  theme_classic()
Map_Base
```

<img src="Map_Session_files/figure-html/The Base map-1.png" style="display: block; margin: auto;" />

# ADDING SOME EEZ'S


```r
#### World map of EEZ ####
path_eez_world <- ("Data/World_EEZ_v8_2014")
fnam_eez_world <- "World_EEZ_v8_2014_HR.shp"

eez_world <- readOGR(dsn = path_eez_world,layer =file_path_sans_ext(fnam_eez_world))
```

```
## OGR data source with driver: ESRI Shapefile 
## Source: "Data/World_EEZ_v8_2014", layer: "World_EEZ_v8_2014_HR"
## with 249 features
## It has 14 fields
```

```r
fortify.shape <- function(x){
  x@data$id <- rownames(x@data)
  x.f = fortify(x, region = "id")
  x.join <- inner_join(x.f, x@data, by = "id")
}

#### USA EEZ ####
# Extract the EEZ for the USA:
eez_usa <- eez_world[eez_world@data$Country == "United States", ]

# Fortify the shapefile data:
eez_usa <- fortify(eez_usa)
```

```
## Regions defined for each Polygons
```

```r
# # Extract the USA EEZ polygon to save
USA_EEZ <- droplevels(filter(eez_usa, piece == 2))

Map_eez_US <- 
  Map_Base + 
  geom_path(data = filter(eez_usa, piece == 2), 
            aes(x = long, y = lat, group = group), 
            colour = "blue", size = 0.75) 

#### Canada EEZ ####
# Extract the EEZ for the USA:
eez_Can <- eez_world[eez_world@data$Country == "Canada", ]

# Fortify the shapefile data:
eez_Can <- fortify(eez_Can)
```

```
## Regions defined for each Polygons
```

```r
# # Extract the USA EEZ polygon to save
Can_EEZ <- droplevels(filter(eez_Can, piece == 4))

Map_eez_Can <- Map_eez_US+ geom_path(data = filter(eez_Can, piece == 4), #Turns out that piece 4 is British Columbia, who knew!? 
            aes(x = long, y = lat, group = group), 
            colour = "red", size = 0.75)
  
#### Alaska EEZ ####

# Extract the EEZ for Alaska:
eez_Alaska <- eez_world[eez_world@data$Country == "Alaska", ]

# Fortify the shapefile data:
eez_Alaska <- fortify(eez_Alaska)
```

```
## Regions defined for each Polygons
```

```r
# Extract the USA EEZ polygon to save
Alaska_EEZ <- droplevels(filter(eez_Alaska, piece == 1))


Map_EEZ <- Map_eez_Can + geom_path(data = filter(eez_Alaska, piece == 1), 
            aes(x = long, y = lat, group = group), 
            colour = "purple", size = 0.75) 
  
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

<img src="Map_Session_files/figure-html/EZZ-1.png" style="display: block; margin: auto;" />

# Points inside EEZ




# Leaflet for R

https://rstudio.github.io/leaflet/
[GitHub](https://github.com/rstudio/leaflet)


## Leaflet example


