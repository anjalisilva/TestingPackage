library(shiny)
# This example is adapted from
# Grolemund, G. (2015). Learn Shiny - Video Tutorials. URL:https://shiny.rstudio.com/tutorial/

# Define UI
ui <- fluidPage(

  # Change title
  titlePanel("Cluster Analysis of RNAseq Counts: Calculating Information Criteria"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      tags$p("This is a simple Shiny App that is part of the TestingPackage.
             Its purpose is to illustrate the functionality of a simple
             Shiny App."),

      # br() element to introduce extra vertical spacing ----
      br(),

      tags$b("Description: TestingPackage is an R package to demonstrate components
             of a simple R package. This Shiny App is part of the TestingPackage. It
             permits to calculate Bayesian information criterion (BIC), Integrated
             Complete Likelihood (ICL) criterion, and Akaike Information Criterion (AIC)
             values, given log-likelihood, number of clusters, dimension of dataset,
             number of observations, and the probability. Provided the original
             RNAseq dataset of counts, the dataset could be visualized. For more
             details, see ?InfCriteriaCalculation."),

      # br() element to introduce extra vertical spacing ----
      br(),
      br(),

      # input
      tags$p("Instructions: Below, enter or select values required to perform the analysis. Default
                        values are shown. Then press 'Run'. Navigate through
             the different tabs to the right to explore the results."),

      # br() element to introduce extra vertical spacing ----
      br(),

      textInput(inputId = "logL",
                label = "Enter loglikelihood value. This should be a negative numeric value:", "-5080"),
      textInput(inputId = "nClusters",
                label = "Enter the number of Clusters. This should be an integer. This number and length(probability) below should match:", "2"),
      textInput(inputId = "dimensionality",
                label = "Enter the dimensionality of RNAseq dataset. This should be an integer:", "6"),
      textInput(inputId = "observations",
                label = "Enter the number of observations in RNAseq dataset. This should be an integer:", "100"),
      textInput(inputId = "probability",
                label = "Enter probability of each Cluster. This should be a vector of numeric values. Note, the vector of values should sum to 1:", "0.5, 0.5"),


      # br() element to introduce extra vertical spacing ----
      br(),

      # actionButton
      actionButton(inputId = "button2",
                   label = "Run"),

    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Summary of Information Criteria Values",
                           h3("Instructions: Enter values and click 'Run' at the bottom left."),
                           h3("Summary of Information Criteria Values:"),
                           br(),
                           h4("Bayesian information criterion (BIC)"),
                           verbatimTextOutput("textOutBIC"),
                           h4("Integrated Complete Likelihood (ICL)"),
                           verbatimTextOutput("textOutICL"),
                           h4("Akaike Information Criterion (AIC)"),
                           verbatimTextOutput("textOutAIC")),
                  tabPanel("Plot of Information Criteria Values",
                           h3("Instructions: Enter values and click 'Run' at the bottom left."),
                           h3("Plot of Information Criteria Values:"),
                           br(),
                           br(),
                           plotOutput("OuputPlot"))
      )

    )
  )
)

# Define server logic for random distribution app ----
server <- function(input, output) {


  # Calculate information criteria value
  startcalculation <- eventReactive(eventExpr = input$button2, {

    TestingPackage::InfCriteriaCalculation(
      loglikelihood = as.numeric(input$logL),
      nClusters = as.numeric(input$nClusters),
      dimensionality = as.numeric(input$dimensionality),
      observations = as.numeric(input$observations),
      probability = as.numeric(unlist(strsplit(input$probability, ","))))

  })


  # Textoutput
  output$textOutBIC <- renderPrint({
    if (! is.null(startcalculation))
      startcalculation()$BICresults
  })

  output$textOutICL <- renderPrint({
    if (! is.null(startcalculation))
      startcalculation()$ICLresults
  })

  output$textOutAIC <- renderPrint({
    if (! is.null(startcalculation))
      startcalculation()$AICresults
  })


  # Plotting
  output$OuputPlot <- renderPlot({
    if (! is.null(startcalculation))
      TestingPackage::InfCriteriaPlot(infValues =  startcalculation())
  })


}

# Create Shiny app ----
shinyApp(ui, server)

# [END]
