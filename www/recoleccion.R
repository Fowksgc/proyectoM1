recoleccion<-{
  fluidPage(
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
      
      # Sidebar panel for inputs ----
      sidebarPanel(
        
        # Input: Select a file ----
        fileInput("file1", "Choose CSV File",
                  multiple = FALSE,
                  accept = c("text/csv",
                             "text/comma-separated-values,text/plain",
                             ".csv")),
        
        # Horizontal line ----
        tags$hr(),
        
        # Input: Checkbox if file has header ----
        checkboxInput("header", "Header", TRUE)
    
      ),
      
      # Main panel for displaying outputs ----
      mainPanel(
        
        # Output: Data file ----
        tableOutput("contents")
        
      )
      
    )
  )
}
