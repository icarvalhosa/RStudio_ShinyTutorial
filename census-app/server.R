library(maps)
library(mapproj)
source("helpers.R")
counties <- readRDS("data/counties.rds")

shinyServer(function(input, output) {
  
  output$map <- renderPlot({
    data <- switch(input$var, 
                   "Percent White" = counties$white,
                   "Percent Black" = counties$black,
                   "Percent Hispanic" = counties$hispanic,
                   "Percent Asian" = counties$asian)
    
    color <- switch(input$var, 
                  "Percent White" = "darkgreen",
                  "Percent Black" = "black",
                  "Percent Hispanic" = "darkorange",
                  "Percent Asian" = "darkviolet")
    ltitle <- switch(input$var, 
                    "Percent White" = "Percent White",
                    "Percent Black" = "Percent Black",
                    "Percent Hispanic" = "Percent Hispanic",
                    "Percent Asian" = "Percent Asian")
    
    percent_map(var = data, color = color, legend.title = ltitle, 
                max = input$range[2], min = input$range[1])
    
#     # More concise version
#     args <- switch(input$var,
#                    "Percent White" = list(counties$white, "darkgreen", "% White"),
#                    "Percent Black" = list(counties$black, "black", "% Black"),
#                    "Percent Hispanic" = list(counties$hispanic, "darkorange", "% Hispanic"),
#                    "Percent Asian" = list(counties$asian, "darkviolet", "% Asian"))
#     
#     args$min <- input$range[1]
#     args$max <- input$range[2]
#     
#     do.call(percent_map, args)
  })
 
})