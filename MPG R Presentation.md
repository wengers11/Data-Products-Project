MPG Prediction Presentation
========================================================
author: Wesley E.
date: 2/16/2016


Purpose of MPG Prediction App
========================================================

 Allows users to input the weight of their car and find out a miles per gallon estimate for
 their car.They can also filter on transmission type and number of cylinders so only similar
 cars are used for comparison calculation. 
 Uses the mtcars dataset with 32 cars for Motor Trend magazine 1972 from R.


Predictions
========================================================
  1. Predictions are based on the mtcars dataset
  2. Linear Model is built from similar cars as defined by user
  3. MPG prediction is done to the nearest whole number
  4. Example for predicting car with 3000 lbs MPG is below:
  

```r
  data(mtcars)
  wt<-3
  fit<-lm(mpg~wt, data=mtcars)
  round(predict(fit,newdata=wt),0)
```

```
 1 
21 
```

Inputs
======
  1. The User Inputs the Weight of the Car they want to predict MPG for
  2. The User Inputs the restrictions on the data set to ensure similar cars are used.
  
      a. Weight Range of similar Cars
      
      b. Number of Cylinders of similar Cars
      
      c. Whether the car is automatic or manual

Scatter Plot and Table
=======

1. The Scatter Plot Displays the data points that have not been filtered out
2. Scatter Plot colors correspond to the number of cylinders of the cars
3. The Table shows the exact data points that are still being included


