
# User-interface definition of Shiny web application

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Income Predictor"),
  p("This application predicts a person's income based on three variables: years of education, whether the person holds a professional degree or not, and years of work experience."),
  p("It does this by means of a linear regression on the NLSY79 data set from the United States National Longitudinal Survey of Youth."),
  p("Upon entering the values for the predictive variables, the application predicts the hourly wage in 2002 US dollars."),
  br(),
  
  sidebarLayout(
    
    sidebarPanel(
      helpText("Enter the values in the input boxes or click on the toggle buttons. The application will display the predicted wage each time one of these values are changed."),
      numericInput("S", "Total years of education, including school and college:", value=12, min=0),
      checkboxInput("EDUCPROF", "Professional degree"),
      numericInput("EXP", "Total years of work experience:", value=0, min=0)
    ),

    mainPanel(
      p(strong("Predicted hourly wage in 2002 US$:")),
      strong(textOutput("EARNINGS")),
      br(),
      p("More precisely, there is a 80% probability that the hourly wage lies within the following interval:"),
      textOutput("interval")
    )
    
  )
  
))
