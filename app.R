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
  
  # ------------------ *** INICIO RECOLECCION  ***------------------
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, head of that data file by default,
  
    # when reading semicolon separated files,
    # having a comma separator causes `read.csv` to error
    tryCatch(
      {
        df <- read.csv("dataset/dataset1.csv" #si es que tiene cabecera
                       #el separador
        )   #si es que se necesita entrecomillado
        #todos estos valores vienen del input
      },
      error = function(e) {
        # return a safeError if a parsing error occurs
        stop(safeError(e))
      }
    )
    
    
  })
  
  # ------------------ *** FIN RECOLECCION        ***------------------

  
  #########################TRANSFORMACIÓN#########################
 
  
  ################################EXPLORACIÓN#####################
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
