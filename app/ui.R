ui <- fluidPage(
  
  # Application title
  titlePanel("Mission Log"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Choose CSV File",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      # plotlyOutput("plot")
      mainPanel(
        tableOutput("contents"),
        plotly::plotlyOutput("ric")
      )
      
    )
  )
)