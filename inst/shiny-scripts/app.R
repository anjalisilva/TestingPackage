library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num",
    label = "Choose a number",
    value = 25, min = 1, max = 100),
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
}

shinyApp(ui = ui, server = server)
# This example is adapted from Learn Shiny - Video 
# tutorials by Garrett Grolemund, 2015.
# URL: https://shiny.rstudio.com/tutorial/.
