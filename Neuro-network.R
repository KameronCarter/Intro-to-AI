#Author: Kameron Carter Date:11/6/25 Purpose:Implement Neural Network

#Load library Caret
library(caret)

#Load sample dataset
dataset <- iris

#80% split from training data and 20% split for validation data
validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)

validation <- dataset[-validation_index,]
dataset <- dataset[validation_index,]