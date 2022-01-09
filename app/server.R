server <- function(input, output, session) {
  
  # output$plot <- renderPlotly({
  #   p <- ggplot(dt1.HF, aes(x = tm, y = HF, colour = team)) +
  #     geom_point(aes(frame = sn, ids = tm), size = 5)
  #   p <- ggplotly(p)
  #   animation_opts(p, frame = 1000, transition = 500, easing = "linear",
  #                  redraw = TRUE, mode = "immediate")
  # })
  
  observeEvent(input$file1, {
    inFile <<- input$file1
    afsimData <<- read.csv(inFile$datapath, header = TRUE)
  })
  
  output$contents <- renderTable({
    dat <- input$file1
    if (is.null(dat)) return(NULL)
    afsimData
  })
  
  output$ric <- plotly::renderPlotly({
    dat <- input$file1
    if(is.null(dat)) return(NULL)
    p <- afsimData %>%
      ggplot2::ggplot() +
      ggplot2::xlim(-100, 100) +
      ggplot2::ylim(-100, 100) +
      #ggplot2::theme_void() +
      ggplot2::theme(legend.position = "none") +
      ggplot2::aes(x = I,
                   y = R) +
      ggplot2::geom_point(ggplot2::aes(frame = time, ids = time)) +
      ggplot2::geom_line()
    
    plotly::animation_opts(p, frame = 1000, transition = 5, easing = "linear", redraw = F, mode = "immediate")
    p <- plotly::ggplotly(p)
    
  })
  
  output$dist <- renderPlot({
    
    
  })
  
}
