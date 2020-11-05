library(shiny)
library(plotly)
library(dplyr)
library(tidyverse)

ui <- fluidPage(
  titlePanel("Travel numbers of air passengers from 2008-2019"),
  
  
  column(5, h4("Select the year to see the number of travellers in the selected year"),
  selectInput("numpassenger", "Year", c(2008:2019))),
  
  mainPanel(
    plotOutput("number")
  )
)

Air<-read.csv("air_passengers_dataset.csv")
x<-c(1,2,3,4,5,6,7,8,9,10,11,12)


server <- function(input, output,session){
  
  
  output$number<-renderPlot({
    z<-(as.integer(input$num_passenger)-2007)*12-11
    y<-(as.integer(input$num_passenger)-2007)*12
    
    plot(x,Air[z:y,1],type="l",main=paste("Number of Travellers in",input$numpassenger, sep=" "), 
         xlab = "Month Number", ylab="Number of Passenger(in thousands)")
    
    axis(side=1,1:12,cex.axis=1)
  })  
  
}

shinyApp(ui = ui, server = server)