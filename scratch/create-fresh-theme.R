library(fresh)

create_theme(
  
  # update big color pieces of header
  adminlte_color(
    light_blue = "red"
  ),
  
  # dashboard body styling
  adminlte_global(
    content_bg = "green"
    
    
  ),
  
  # sidebar
  adminlte_sidebar(
    dark_bg = "yellow",
    dark_hover_bg = "orange",
    dark_color = "darkslateblue",
    width = "400px"
    
  ),
  
  # save to the shiny dashboard www folder
  output_file = "shiny-dashboard/www/dashboard-fresh-theme.css")
  

