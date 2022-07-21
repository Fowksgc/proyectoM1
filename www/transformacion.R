transformacion<-{
  navlistPanel(
    tabPanel("Consultas en dplyr",
             h4("DPLYR"),selectInput("transDplyr","Consultas exploratorias",choices = c("Consulta 1"='1',"Consulta 2"='2',"Consulta 3"='3')),
             dataTableOutput("resDplyr")
             ),
    tabPanel("Consultas en sqldf",
             h4("SQLDF"),selectInput("transSQLDF","Consultas exploratorias",choices = c("Consulta 1"='1',"Consulta 2"='2',"Consulta 3"='3')),
             dataTableOutput("resSQLDF")
             )
    
  )
  
  
}
