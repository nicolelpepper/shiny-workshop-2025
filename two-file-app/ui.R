
# ---- Define user interface ---------------------------------------------------
ui <- navbarPage(
  
  title = "Long Term Ecological Research (LTER) Animal Data Explorer",
  
  # (Page 1) intro tabPanel ----------------------------------------------------
  tabPanel(title = "About this App",
           
           "background info will go here"
           
  ), # END (Page 1) intro tabPanel
  
  # (Page 2) data viz tabPanel -------------------------------------------------
  tabPanel(title = "Explore the Data",
           
           # tabsetPanel to contain tabs for data viz ----
           tabsetPanel(
             
             # ---- Trout viz --------------------------------------------------
             # trout tabPanel = 
             tabPanel(title = "Trout",
                      
                      # trout sidebar layout
                      sidebarLayout(
                        
                        # trout sidebarPanel ----
                        sidebarPanel(
                          
                          # add 'channel_type' dropdown picker widget for trout
                          pickerInput(
                            inputId = "channel_type_input",
                            label = "Select channel type(s):",
                            choices = unique(clean_trout$channel_type),
                            selected = c("rapid"),
                            multiple = TRUE,
                            options = pickerOptions(actionsBox = TRUE)), # END picking input
                          
                          # section checkboxGroupButtons
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select sampling section(s):",
                                               choices = c("Clear cut" = "clear cut forest",
                                                           "Old growth" = "old growth forest"),
                                               selected = c("clear cut forest"),
                                               justified = TRUE,
                                               checkIcon = list(
                                                 yes = icon("check", lib = "font-awesome"),
                                                 no = icon("xmark", lib = "font-awesome"))) # END section checkboxGroupButtons
                          
                        ), # END trout sidebar panel
                        
                        # trout mainPanel ----
                        mainPanel(
                          
                          # Trout scatterplot output
                          plotOutput(outputId = "trout_scatterplot_output")
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebar layout
                      
             ), # END trout tabPanel
             
             # ---- Penguins viz -----------------------------------------------
             # penguins tabPanel
             tabPanel(title = "Penguins",
                      
                      # penguins sidebar layout
                      sidebarLayout(
                        
                        # penguins sidebarPanel ----
                        sidebarPanel(
                          
                          # add 'island' dropdown picker widget for penguins
                          pickerInput(
                            inputId = "island_input",
                            label = "Select island(s):",
                            choices = unique(penguins$island),
                            selected = c("Dream"),
                            multiple = TRUE,
                            options = pickerOptions(actionsBox = TRUE)), # END picking input
                          
                          # add slider for number of histogram bins
                          sliderInput(
                            inputId = "bins_input",
                            label = "Select number of histogram bins:",
                            min = 10, max = 50, value = 25) # END slider input
                          
                        ), # END penguins sidebar panel
                        
                        # penguins mainPanel ----
                        mainPanel(
                          
                          # Penguin histogram output
                          plotOutput(outputId = "flipper_length_histogram_output")
                        ) # END penguins mainPanel
                        
                      ) # END penguins sidebar layout
             ) # End penguins tabPanel
             
           ) # END tabsetPanel to contain dv
           
  ) # END (Page 2) data viz tabPanel
  
  
) # END ui
