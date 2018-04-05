%NaiveBayes_main.m
%
%Predicts the class to which an image belongs using the Machine Learning
%technique of Bayesian Classifiers. A gaussian distribution is modeled
%using the training data and a hypothesis is used to evaluate classes
%of unknown images.
%
%Dataset used is in data.mat 
%
%Both Hypothesis-I and Hypothesis-II give the same evaluation as both stem
%from the same expression, i.e. the Multivaraite Gaussian Distribution

clear all;
clc;

load data.mat   %load the dataset to your workspace

totalClasses = 200;     %represents the faces of 200 different people we have to correctly classify
debug = 1;  %0/1: turn off/on prediction display for each test data, for each hypothesis

%%                          Train-Test Split
%Split the data into a train-test ratio of 2:1

testFaceIdx = [ 2:3:600 ]';
trainFacesIdx = [ 1:3:600; 3:3:600 ]';

%%                          Class Images

%Pre-process the images in training data for easier manipulation
imageClass = trainingData(totalClasses, trainFacesIdx, face);

%%                         Feature Mean MLE

%Estimate the Mean for the Multivariate Gaussian Distribution using
%Maximum Likelihood Estimation
mu = estimateMean(totalClasses, imageClass);

%%                       Feature Variance MLE

%Estimate the Covariance for the Multivariate Gaussian Distribution using
%Maximum Likelihood Estimation
sigm = estimateCovariance(totalClasses, imageClass, mu);

%%                              Test Data

%Pre-process the images in test data for easier manipulation
testImage = testData(totalClasses, face, testFaceIdx);

%%                  Hypothesis-I - Discriminant Function

%Predict the class of an unknown image data using the discriminant function
prediction1 = hypothesis1(testFaceIdx, totalClasses, testImage, mu, sigm, debug);

%%                              Accuracy - Hypothesis-I

%Calculate the accuracy of Hypothesis-I on test data 
testAccuracy1 = accuracy(prediction1, totalClasses);
fprintf("Accuracy of classification using Hypothesis-I: %d \n", testAccuracy1);

%%              Hypothesis-II - Probability Distribution Function

%Predict the class of an unknown image data using the probability
%distribution function
prediction2 = hypothesis2(testFaceIdx, totalClasses, testImage, mu, sigm, debug);

%%                              Accuracy - Hypothesis-II

%Calculate the accuracy of Hypothesis-II on test data
testAccuracy2 = accuracy(prediction2, totalClasses);
fprintf("Accuracy of classification using Hypothesis-II: %d \n", testAccuracy2);