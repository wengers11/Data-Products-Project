library(shiny)
##Allows users to input the weight of their car and find out a miles per gallon estimate for
## their car.They can also filter on transmission type and number of cylinders so only similar
## cars are used for comparison calculation. 
## Uses the mtcars dataset with 32 cars for Moter Trend magazine 1972 from R.

shinyUI(pageWithSidebar(
  headerPanel("MT Cars Scatterplot and Regression Prediction"),
  sidebarPanel(
    sliderInput('newcar','Weight Value for New Car Prediction (1000 lbs)',value=min(mtcars$wt),min=min(mtcars$wt), max=max(mtcars$wt), step=.01),
    numericInput('wtmin','Car Min Weight', value=min(mtcars$wt),min=min(mtcars$wt), max=max(mtcars$wt), step=.01),
    numericInput('wtmax','Car Max Weight', value=max(mtcars$wt),min=min(mtcars$wt), max=max(mtcars$wt), step=.01),
    checkboxGroupInput('am','Transmission: Automatic(0) Or Manual(1)',sort(unique(mtcars$am)),selected=unique(mtcars$am)),
    checkboxGroupInput('cyl','Number of Cylinders to Include',sort(unique(mtcars$cyl)),selected = unique(mtcars$cyl))
  ),
  
  mainPanel(
    h4('Allows users to input the weight of their car and find out a miles per gallon estimate for
 their car.They can also filter on transmission type and number of cylinders so only similar
 cars are used for comparison calculation. 
 Uses the mtcars dataset with 32 cars for Moter Trend magazine 1972 from R.

'),
    h4('Weight Value to Predict (1000 lbs)'),
    verbatimTextOutput('newcar'),
    h4('Estimated MPG is:'),
    verbatimTextOutput('mypredict'),
    h3(textOutput('Caption')),
    plotOutput('scatter'),
    h4('Tables'),
    tableOutput('cartable')
  )
  
  
  
  
)
  )