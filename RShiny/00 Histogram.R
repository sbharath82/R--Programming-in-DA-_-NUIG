library(ggplot2)
ui <- fluidPage(
  titlePanel("Hello Shiny!"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    # Sidebar panel for inputs ----
    sidebarPanel(


      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)

    ),
    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Histogram ----
      plotOutput(outputId = "distPlot"),
      plotOutput(outputId = "f_lm"),
      plotOutput(outputId = "text_o")

    )
  )
)

server <- function(input, output) {

  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram
  # is wrapped in a call to renderPlot to indicate
  # that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({

    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting"+
         ylab = "eruptions"

    plotOutput()

  })


  output$f_lm <- renderPlot({
    ggplot(faithful,aes(x=eruptions,y=waiting))+geom_point()+geom_smooth()

  })



  output$text_o <- renderPlot({
  faithful[0:10]
  })

}

shinyApp(ui = ui, server = server)


