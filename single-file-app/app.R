# Load packages ----
library(shiny)
library(tidyverse)
library(palmerpenguins)


# ---------------------------------------------------------------------------------------------------
# ---- User interface (UI) ----

ui <- fluidPage(
  
  # app title ----
  # tags is a list ($) that contains a bunch of functions that match html text (i.e. header, hyperlink, etc)
  tags$h1("My App Title"),
  
  # app subtitle ----
  # you can nest tags, order of nesting doesn't matter 
  #tags$h4(tags$strong("Exploring Antarctic Pengion Data"))
  
  # common tags like headings and bolding don't need to be called with 'tags$'
  h4(strong("Exploring Antarctic Pengion Data")),
  
  # body mass slider input ----
  sliderInput(inputId = "body_mass_input", label = "Select a range of body masses (g)",
              min = 2700, max = 6300, value = c(3000, 4000)),
  
  # body mass plot output ----
  plotOutput(outputId = "body_mass_scatterplot_output"),
  
  # year input ----
  checkboxGroupInput(inputId = "year_input", label = "Select year(s):",
                     choices = unique(penguins$year), # or `unique(penguins$year)` | NOTE: update checkbox display name by using "New name" = "observation name" (e.g "The year 2007" = 2007)
                     selected = c(2007, 2008)),
  
  # output: year dt ----
  DT::dataTableOutput(outputId = "penguin_DT_output")
  
)


# ---------------------------------------------------------------------------------------------------
# ---- Server ----

server <- function(input, output){
  
  # filter body masses ----
  body_mass_df <- reactive({
    
    penguins |>
      filter(body_mass_g %in% c(input$body_mass_input[1]:input$body_mass_input[2]))
    
  })
  
  # render penguin body mass scatter plot ----
  output$body_mass_scatterplot_output <- renderPlot({
    
    # code to generate our plot
    ggplot(na.omit(body_mass_df()), 
           aes(x = flipper_length_mm, y = bill_length_mm, 
               color = species, shape = species)) +
      geom_point() +
      scale_color_manual(values = c("Adelie" = "darkorange", "Chinstrap" = "purple", "Gentoo" = "cyan4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
      labs(x = "Flipper length (mm)", y = "Bill length (mm)", 
           color = "Penguin species", shape = "Penguin species") +
      guides(color = guide_legend(position = "inside"),
             size = guide_legend(position = "inside")) +
      theme_minimal() +
      theme(legend.position.inside = c(0.85, 0.2), 
            legend.background = element_rect(color = "white"))
    
    
    
    # code to render filtered plot
    
    
  })
  
  # input: filter for year ----
  year_filter <- reactive({
    
    penguins |> 
      filter(year %in% c(input$year_input))
  })
    
  
  # render: for the DT::datatable ----
  output$penguin_DT_output <- DT::renderDataTable({
    DT::datatable(year_filter())

  })
  
}

# Combine our UI and server into an app ----
shinyApp(ui = ui, server = server)


