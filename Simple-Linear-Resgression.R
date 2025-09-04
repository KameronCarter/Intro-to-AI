#Author: Kameron Carter Date: 8/28/25 Purpose: Test simple linear regression

#Get some dummy dataset
cars <- mtcars

head(cars)
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

#Scatter plot on training data
scatter.smooth(x=cars$mpg, y=cars$disp, main="SpeedVsDistance")

#Calculate correation value between mpg and disp
cor(cars$mpg, cars$disp)
[1] -0.8475514

#Split training and testing data for regression
training_data <- cars[1:16,]
test_data <- cars[17:32,]

#Build a regression model
regression_result <- lm(mpg ~ disp, data=training_data)

Call:
lm(formula = mpg ~ disp, data = training_data)

Coefficients:
(Intercept)         disp  
   26.28141     -0.03222  

#Predict regression function on trst_data
prediction_result <- predict(regression_result, test_data)

#REseluts of predictions
actal_prediction <- data.frame(cbind(actual=training_data$mpg,predicteds=prediction_result))
