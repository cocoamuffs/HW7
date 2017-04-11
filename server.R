# server.R
library(maps)
library(mapproj)
source("helpers.R")

counties <- readRDS("data/counties.rds")

shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      var1 <- switch(input$var, 
                     "Percent White" = counties$white,
                     "Percent Black" = counties$black,
                     "Percent Hispanic" = counties$hispanic,
                     "Percent Asian" = counties$asian)
      
      color <- "darkorange"
      
      plotLeg <- switch(input$var, 
                       "Percent White" = "Percent White",
                       "Percent Black" = "Percent Black",
                       "Percent Hispanic" = "Percent Hispanic",
                       "Percent Asian" = "Percent Asian")
      
      percent_map(var1, 
                  color, 
                  plotLeg, 
                  max = input$range[2], 
                  min = input$range[1])
    })
  }
)
    