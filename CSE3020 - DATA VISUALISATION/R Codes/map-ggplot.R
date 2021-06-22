library(ggplot2)
library(dplyr)
require(maps)
require(viridis)
theme_set(
  theme_void()
)


#Create a simple map World map
world_map <- map_data("world")
world_map <- map_data("usa")
world_map <- map_data("nz")
world_map <- map_data("county")
world_map <- map_data("italy")
world_map <- map_data("state")
head(world_map)

ggplot(world_map, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill="lightgray", colour = "white")

#Map for specific regions Some EU Contries

some.eu.countries <- c(
  "Portugal", "Spain", "France", "Switzerland", "Germany",
  "Austria", "Belgium", "UK", "Netherlands",
  "Denmark", "Poland", "Italy", 
  "Croatia", "Slovenia", "Hungary", "Slovakia",
  "Czech republic"
)
# Retrieve the map data
some.eu.maps <- map_data("world", region = some.eu.countries)

# Compute the centroid as the mean longitude and lattitude
# Used as label coordinate for country's names
region.lab.data <- some.eu.maps %>%
  group_by(region) %>%
  summarise(long = mean(long), lat = mean(lat))

#map-plot

ggplot(some.eu.maps, aes(x = long, y = lat)) +
  geom_polygon(aes( group = group, fill = region))+
  geom_text(aes(label = region), data = region.lab.data,  size = 3, hjust = 0.5)+
  scale_fill_viridis_d()+
  theme_void()+
  theme(legend.position = "none")



# Example-2 Prepare the USArrests data
library(dplyr)
arrests <- USArrests
USArrests
arrests$region <- tolower(rownames(USArrests))
head(arrests)

# Retrieve the states map data and merge with crime data
states_map <- map_data("state")
arrests_map <- left_join(states_map, arrests, by = "region")

# Create the map
ggplot(arrests_map, aes(long, lat, group = group))+
  geom_polygon(aes(fill = Assault), color = "white")+
  scale_fill_viridis_c(option = "C")

# Create the map
choro <- merge(states_map, arrests_map, sort = FALSE, by = "region")
choro <- choro[order(choro$order), ]
ggplot(choro, aes(long, lat)) +
  geom_polygon(aes(group = group, fill = assault)) +
  coord_map("albers",  at0 = 45.5, lat1 = 29.5)




#Example-3 World map colored by life expectancy
library(ggplot2)
install.packages("WHO")
library("WHO")
library("dplyr")
life.exp <- get_data("WHOSIS_000001")             # Retrieve the data
life.exp <- life.exp %>%
  filter(year == 2015 & sex == "Both sexes") %>%  # Keep data for 2015 and for both sex
  select(country, value) %>%                      # Select the two columns of interest
  rename(region = country, lifeExp = value) %>%   # Rename columns
  # Replace "United States of America" by USA in the region column
  mutate(
    region = ifelse(region == "United States of America", "USA", region)
  ) 



#Merge map and life expectancy data:
world_map <- map_data("world")
life.exp.map <- left_join(life.exp, world_map, by = "region")

#geom_polygon
ggplot(life.exp.map, aes(long, lat, group = group))+
  geom_polygon(aes(fill = lifeExp ), color = "white")+
  scale_fill_viridis_c(option = "C")



#geom_map
ggplot(life.exp.map, aes(map_id = region, fill = lifeExp))+
  geom_map(map = life.exp.map,  color = "white")+
  expand_limits(x = life.exp.map$long, y = life.exp.map$lat)+
  scale_fill_viridis_c(option = "C")