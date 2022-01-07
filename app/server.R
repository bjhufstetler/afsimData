server <- function(input, output, session) {
  
  # output$plot <- renderPlotly({
  #   p <- ggplot(dt1.HF, aes(x = tm, y = HF, colour = team)) +
  #     geom_point(aes(frame = sn, ids = tm), size = 5)
  #   p <- ggplotly(p)
  #   animation_opts(p, frame = 1000, transition = 500, easing = "linear",
  #                  redraw = TRUE, mode = "immediate")
  # })
  
  # output$contents <- renderTable({
  #   # input$file1 will be NULL initially. After the user selects
  #   # and uploads a file, it will be a data frame with 'name',
  #   # 'size', 'type', and 'datapath' columns. The 'datapath'
  #   # column will contain the local filenames where the data can
  #   # be found.
  #   inFile <- input$file1
  #   
  #   if (is.null(inFile))
  #     return(NULL)
  #   
  #   read.csv(inFile$datapath, header = input$header)
  # })
  
}
