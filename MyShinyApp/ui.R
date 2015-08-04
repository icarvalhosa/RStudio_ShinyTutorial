library(shiny)

shinyUI(fluidPage(
  
  # Title
  titlePanel("My Shiny App"),
  
  #sidebarLayout
  sidebarLayout(
    
    #sidebar on the left
    sidebarPanel(
      h2("Installation"),
      p("Shiny is available on CRAN, so you can install it in the usual way from your R console:"),
      code('install.packages("shiny")'),
      br(),
      br(),
      br(),
      p(img(src="bigorb.png", height = 72, width = 72), "shiny is a product of ", 
        span("RStudio", style = "color:blue"))
      ),
    
    #mainPanel
    mainPanel(
      h1("Introducing Shiny"),
      p("shiny is a new package from RStudio that makes it ", em("incredibly "),
        "easy to build interactive web application with R."),
      br(),
      p("For an introduction and live example, visit the", 
        a("Shiny homepage.", href = "http://www.rstudio.com/shiny")),
      br(),
      h2("Features"),
      p("* Build useful web applications with only a few lines of code - no JavaScript required."),
      p('* Shiny applications are automatically "live" in the same way that ', 
        strong("spreadsheets "), "are live. Outputs changes instantly as users modify
        inputs, without requiring a reload of the broswer.")  
      )
    )
  
))