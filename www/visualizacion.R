visualizacion<-{
  
  navlistPanel(
    tabPanel("Graficos con ggplot2",
             h4("GGplot"),selectInput("expGgplot","Consultas exploratorias",choices = c("Consulta 1"='1',"Consulta 2"='2',"Consulta 3"='3')),
             plotOutput("resGgplot2")
    ),
    tabPanel("Graficos con Plotly",
             h4("Plotly"),selectInput("expPlotly","Consultas exploratorias",choices = c("Consulta 1"='1',"Consulta 2"='2',"Consulta 3"='3')),
             plotOutput("resPlotly")
    )
    
  )
  
  
}
