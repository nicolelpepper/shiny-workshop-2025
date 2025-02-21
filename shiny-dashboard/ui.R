# dashboard header ----
header <- dashboardHeader(
  
  # title ----
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400
  
)

# dashboard sidebar ----
sidebar <- dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

# dashboard body ----
body <- dashboardBody(
  
  # apply custom theme
  use_theme("dashboard-fresh-theme.css"),
  
  # tabItems ----
  tabItems(
    
    # welcome tabItem ----
    tabItem(tabName = "welcome",
            
            # left-hand column ----
            column(width = 6,
                   
                   # background info box ----
                   box(width = NULL,
                       
                       title = tagList(icon("water"),
                                       strong("Background")),
                       includeMarkdown("text/intro.md"),
                      # it knows that its in the www folder
                       tags$img(src = "FishCreekWatershedSiteMap_2020.jpg",
                                # add alt text
                                alt = "A map of Northern Alaska, showing Fish Creek Watershed located within the National Petroleum Reseve.", 
                                
                                # set max width, dont forget collon
                                style = "max-width: 100%;" 
                                ),
                      # add hyperlink using a()
                      tags$h6("Map Source:", tags$a(href = "http://www.fishcreekwatershed.org/images/FishCreekWatershedSiteMap_2020.jpg", 
                                                    "FCW0"), # the text that will be hyperlinked
                              style = "text-align: center;")# align text to center dont forget the ;
                       
                   ) # END backgroudn info box 
                   
            ), # END left-hand column
            
            # right-hand column ----
            column(width = 6,
                   
                   # first fluidRow ----
                   fluidRow(
                     
                     # citation box ----
                     box(width = NULL,
                         
                         title = tagList(icon("table"),
                         strong("Citation")),
                         
                         includeMarkdown("text/citation.md")
                        
                         
                     ) # END citation box
                     
                   ), # END first fluidRow 
                   
                   # second fluidRow ----
                   fluidRow(
                     
                     # disclaimer box ----
                     box(width = NULL,
                         title = tagList(icon("warning"),
                                         strong("Disclaimer")),
                         
                         includeMarkdown("text/disclaimer.md")
                         
                     ) # END disclaimer box 
                     
                   ) # END second fluidRow
                   
            ) # END right-hand column
            
    ), # END welcome tabItem
    
    # dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 4,
                  
                  title = tags$strong("Adjust lake parameter ranges:"),
                  
                  # sliderInputs ----
                  sliderInput(inputId = "elevation_slider_input",
                              label = "Elevation (meters above SL)",
                              min = min(lake_data$Elevation),
                              max = max(lake_data$Elevation),
                              value = c(min(lake_data$Elevation),
                                        max(lake_data$Elevation))),
                  
                  sliderInput(inputId = "depth_slider_input",
                              label = "Average depth (meters):",
                              min = min(lake_data$AvgDepth),
                              max = max(lake_data$AvgDepth),
                              value = c(min(lake_data$AvgDepth),
                                        max(lake_data$AvgDepth))),
                  
                  sliderInput(inputId = "temp_slider_input",
                              label = "Average lake bed temperature (°C):",
                              min = min(lake_data$AvgTemp),
                              max = max(lake_data$AvgTemp),
                              value = c(min(lake_data$AvgTemp),
                                        max(lake_data$AvgTemp)))
                  
                  
                  
              ), # END input box
              
              # leaflet box ----
              box(width = 8,
                  
                  title = tags$strong("Monitored lakes within Fish Creek Watershed"),
                  
                  # leaflet output ----
                  leafletOutput(outputId = "lake_map_output") |> 
                    withSpinner(type = 1, color = "blue")
                  
              ) # END leaflet box
              
            ) # END fluidRow
            
    ) # END dashboard tabItem
    
  ) # END tabItems 
  
) # END dashboardBody

# combine all into dashboardPage ----
dashboardPage(header, sidebar, body)


