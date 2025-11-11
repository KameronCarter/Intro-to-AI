#Author: Kameron Carter Date:11/6/25 Purpose:Implement Neural Network

#Load library Caret
library(caret)

#Load sample dataset
dataset <- iris

#80% split from training data and 20% split for validation data
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)
validation <- dataset[-validation_index,]
dataset <- dataset[validation_index,]

control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

#Train the model using LDA/Linear Determinant Analysis
set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl= control)

set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl= control)


#Summarize the accuracy of LDA models
results <- resamples(list(lda=fit.lda, rf=fit.rf))
summary(results)

#Based upon the accuracy values we choose lda model to do our predictions on the validation dataset
predictions <- predict(fit.lda, validation)
confusionMatrix(predictions, validation$Species)

Confusion Matrix and Statistics

            Reference
Prediction   setosa versicolor virginica
  setosa         10          0         0
  versicolor      0          8         1
  virginica       0          2         9

Overall Statistics
                                          
               Accuracy : 0.9             
                 95% CI : (0.7347, 0.9789)
    No Information Rate : 0.3333          
    P-Value [Acc > NIR] : 1.665e-10       
                                          
                  Kappa : 0.85            
                                          
 Mcnemar's Test P-Value : NA              

Statistics by Class:

                     Class: setosa Class: versicolor Class: virginica
Sensitivity                 1.0000            0.8000           0.9000
Specificity                 1.0000            0.9500           0.9000
Pos Pred Value              1.0000            0.8889           0.8182
Neg Pred Value              1.0000            0.9048           0.9474
Prevalence                  0.3333            0.3333           0.3333
Detection Rate              0.3333            0.2667           0.3000
Detection Prevalence        0.3333            0.3000           0.3667
Balanced Accuracy           1.0000            0.8750           0.9000