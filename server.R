
# Server logic for Shiny web application

library(shiny)

df = read.csv("EAEF01.csv", sep=";", dec=",")
model = lm(EARNINGS ~ S + EDUCPROF + EXP, df)

shinyServer(function(input, output) {
  
  # x = data.frame(S=input$S, EXP=input$EXP)
  output$EARNINGS = renderText({paste("$", round(predict.lm(model, data.frame(S=input$S, EDUCPROF=as.numeric(input$EDUCPROF), EXP=input$EXP)),2))})
  
  output$interval = renderText({paste(
                                      round(max(0,predict.lm(model, data.frame(S=input$S, EDUCPROF=as.numeric(input$EDUCPROF), EXP=input$EXP), interval="prediction", level=0.8)[2]),2),
                                      "<= Wage <=",
                                      round(predict.lm(model, data.frame(S=input$S, EDUCPROF=as.numeric(input$EDUCPROF), EXP=input$EXP), interval="prediction", level=0.8)[3],2)
                                      )
    
    })
  
})
