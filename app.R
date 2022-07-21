library(shiny)
library(sqldf)
library(plotly)
library(dplyr)
library(ggplot2)

source("www/presentacion.R")
source("www/recoleccion.R")
source("www/transformacion.R")
source("www/modelo.R")
source("www/visualizacion.R")



ui <- fluidPage(
  ui<-navbarPage(title="Proyecto de Ciencia de Datos",
                 tabPanel("Presentación",presentacion),
                 tabPanel("Recoleccion",recoleccion),
                 tabPanel("Transformación",transformacion),
                 tabPanel("Modelo",modelo),
                 tabPanel("Visualizacion",visualizacion)
                 )
)


server <- function(input, output) {
  
  #####################RECOLECCION#####################

  
  #########################TRANSFORMACIÓN#########################
 
  
  ################################EXPLORACIÓN#####################
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
