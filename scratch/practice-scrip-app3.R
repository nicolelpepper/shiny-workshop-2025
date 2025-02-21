# Load libraries
library(tidyverse)
library(leaflet)


# Read in data ----
lake_data <- read_csv(here::here("shiny-dashboard/processed-data/lake_data_processed.csv"))


filtered_lakes <- lake_data |> 
  filter(Elevation >= 8 & Elevation <= 20) |> 
  filter(AvgDepth >= 2 & AvgDepth <= 3) |> 
  filter(AvgTemp >= 4 & AvgTemp <= 6)

# leaflet map ----


leaflet() |>
  # add provider tiles - basemap
  addProviderTiles(providers$Esri.WorldImagery) |>
  
  # set default view
  setView(lng = -152.048442, 
          lat = 70.249234,
          zoom = 6) |>
  
  # inset map
  addMiniMap(toggleDisplay = TRUE,
             minimized = FALSE) |>
  # add markers
  addMarkers(data = filtered_lakes,
             lng = filtered_lakes$Longitude,
             lat = filtered_lakes$Latitude,
             # Stich together character and object elements, does not add spaces
             popup = paste0("Site Name: ", filtered_lakes$Site,"<br>",
                            "Elevation: ",filtered_lakes$Elevation, " meters above SL", "<br>",
                            "Avg Depth: ", filtered_lakes$AvgDepth, " meters", "<br>",
                            "Avg Lake Bed Temperature ", filtered_lakes$AvgTemp, "C°"))