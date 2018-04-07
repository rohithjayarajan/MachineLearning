%KNN.m
%
%Predicts the class to which an image belongs using the Machine Learning
%technique of K-Nearest Neighbors.
%
%Dataset used is data.mat, pose.mat or illumination.mat
%

clear all;
clc;

debug = 1;  %0/1: turn off/on prediction display for each test data, for each hypothesis

%%               User input to choose dataset to be loaded

userChoice = chooseDataset();

%%              Extract information and Train-Test data from dataset

[totalClasses, trainingSet, testSet] = extractDatasetStats(userChoice);

%% Select value of K

prompt = {'Enter Value of K'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'1'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
k = str2double(answer);

%%                             Predictions using KNN

predictedClass = KNNprediction(testSet, trainingSet, k);

%%                                  Accuracy
%Calculate the accuracy of Prediction on test data

testAccuracy = accuracy(predictedClass, testSet(end, :));
fprintf("Accuracy of classification using KNN: %d \n", testAccuracy);