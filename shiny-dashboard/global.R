
# ---- Load libraries ----
library(shiny)
library(shinydashboard)
library(shinycssloaders)
library(tidyverse)
library(leaflet)
library(markdown)
library(fresh)


# ---- Read in data ----
lake_data <- read_csv("processed-data/lake_data_processed.csv")

