library(shiny)
library(sqldf)
library(plotly)
library(dplyr)
library(ggplot2)
#Fowks wele a obo
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
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, head of that data file by default,
    # or all rows if selected, will be shown.
    
    req(input$file1)
    
    # when reading semicolon separated files,
    # having a comma separator causes `read.csv` to error
    tryCatch(
      {
        df <- read.csv(input$file1$datapath,
                       header = input$header)
      },
      error = function(e) {
        # return a safeError if a parsing error occurs
        stop(safeError(e))
      }
    )
 
    
  })
  
  #########################TRANSFORMACIÓN#########################
  dt<-read.csv("dataset/dataset_visualizacion.csv")
  output$resDplyr<-renderDataTable({
    selector<-input$transDplyr
    if(is.null(selector)){
      return(NULL)
    }
    if(selector=="1"){
      return(dt)
    }
    if(selector=="2"){
      return(dt%>%filter(C4>15))
    }
    if(selector=="3"){
      return(dt%>%filter(grepl('Carla',Alumno)))
    }
    
  })
  
  output$resSQLDF<-renderDataTable({
    selector<-input$transSQLDF
    if(is.null(selector)){
      return(NULL)
    }
    if(selector=="1"){
      query1<-sqldf('Select ID,Alumno,C1 from dt;')
      return(query1)
    }
    if(selector=="2"){
      query2<-sqldf('Select ID,Alumno,C1 from dt where C1>17;')
      return(query2)
    }
    if(selector=="3"){
      query3<-sqldf('Select ID,Alumno,avg(C1) as promedio from dt group by C2 order by promedio ASC;')
      return(query3)
    }
    
  })
  
  ################################EXPLORACIÓN#####################
  output$resGgplot2<-renderPlot({
    selector<-input$expGgplot
    if(is.null(selector)){
      return(NULL)
    }
    if(selector=="1"){
      gr1<-ggplot(dt,aes(x=C1))+geom_bar()
      return(gr1)
    }
    if(selector=="2"){
     
    }
    if(selector=="3"){
    
    }
  })
  output$resPlotly<-renderPlotly({
    selector<-input$expPlotly
    if(is.null(selector)){
      return(NULL)
    }
    if(selector=="1"){
     fig<- plot_ly(data=dt,x=~C1, y=~C2)
      return(fig)
    }
    if(selector=="2"){
      
    }
    if(selector=="3"){
      
    }
  })
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
