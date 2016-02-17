library(shiny)
library(UsingR)
library(ggplot2)
library(dplyr)
data("mtcars")
mtcars$cyl<-as.factor(mtcars$cyl)
mtcars$am<-as.factor(mtcars$am)

shinyServer(
  function(input,output){
    output$Caption<-renderText("Scatter Plot of Weight vs MPG")
    output$newcar<-renderPrint({input$newcar})
    output$cartable<-renderTable({mtcars%>%filter(wt>=input$wtmin,wt<=input$wtmax,
                                        cyl==input$cyl[1]|cyl==input$cyl[2]|cyl==input$cyl[3],
                                        am==input$am[1]|am==input$am[2])})
    
    mycars<-reactive({mtcars%>%filter(wt>=input$wtmin,wt<=input$wtmax,
                            cyl==input$cyl[1]|cyl==input$cyl[2]|cyl==input$cyl[3],
                            am==input$am[1]|am==input$am[2])})
    carplot<-reactive({
      localdata<-mycars()
      ggplot(data=localdata, aes(wt,mpg))+geom_point(aes(color=cyl),size=5)+geom_smooth(method="lm")+
      labs(x="Weight (1000 lbs)")+labs(y="mpg")+
      coord_cartesian()
    })
    carpredict<-reactive({
      localdata<-mycars()
      fit<-lm(mpg~wt,data=localdata)
      ans<-as.numeric(coef(fit)[1])+as.numeric(coef(fit)[2])*as.numeric(input$newcar)
    })
    output$mypredict<-renderPrint({round(carpredict())})
    output$scatter<-renderPlot({carplot()})
    
  }
)