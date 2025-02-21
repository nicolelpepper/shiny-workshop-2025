# ---- Create dashboard elements ----


# Dashboard header ----
header <- dashboardHeader(
  
  # Add header title
  title = "Fish Creek Watershed Lake Monitoring", # title text
  titleWidth = 400 # title width
)

# Dashboard sidebar ----
sidebar <- dashboardSidebar(
  
  # Add sidebar menu
  sidebarMenu(
    
    # Welcome menu option
    menuItem(text = "Welcome",
             tabName = "welcome", # ID used to place content in appropriate item)
             icon = icon("star")),
    
    # Dashboard menu option
    menuItem(text = "Dashboard",
             tabname = "dashboard", # Id
             icon = icon("gauge"))
    
  ) # End sidebar menu
  
) # add dashboard sidebar


# Dashboard body ----
body <- dashboardBody(
  
  # create tab items (content)
  tabItems(
    
    # Welcome tab item
    tabItem(tabName = "welcome", # match id above in menu option
            
            "background information here"
            
            ), # End welcome item
            
    
    # Dashboard tab item
    tabItem(tabName = "dashboard",
            
            # Fluid row
            fluidRow(
              
              # input box ----
              box(width = 4,
                  "sliderInputs here"
                  
                  
                  ), # end input box
              
              # leaflet box ----
              box(width = 8,
                  "leafletOutput here"
                  
                  ) # End leaflet box
              
              
            ) # End fluid row
            
            
            ) # End dashboard item
    
  ) # end tab items
  
)




# ---- Combine all into dashboard page ----
dashboardPage(header, sidebar, body)