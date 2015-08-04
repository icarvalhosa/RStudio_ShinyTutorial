# server.R

library(quantmod)
source("helpers.R")

shinyServer(function(input, output) {
  
  dataInput <- reactive({
    getSymbols(input$symb, src = "yahoo", 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
  data <- reactive ({ 
    if (input$adjust) adjust(dataInput())
    else dataInput()
  })

  output$plot <- renderPlot({
    
    chartSeries(data(), theme = chartTheme("white"), 
      type = "line", log.scale = input$log, TA = NULL)
  })
  
})