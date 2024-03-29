%KNN.m
%
%Predicts the class to which an image belongs using the Machine Learning
%technique of K-Nearest Neighbors.
%
%Dataset used is data.mat, pose.mat or illumination.mat
%

clear all;
clc;

debug = 0;  %0/1: turn off/on prediction display for each test data, for each hypothesis

%%               User input to choose dataset to be loaded

userChoice = chooseDataset();

%%              Extract information and Train-Test data from dataset

[totalClasses, trainingSetN, testSet] = KNNextractDatasetStats(userChoice);
trainingSet1 = trainingSetN;
testSet1 = testSet;

%%            PCA

prompt = {'Press 1 for PCA; 2 for LDA; 0 for none'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'0'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
reduction = str2double(answer);

if reduction ==1
    prompt = {'Select Number of Reduced Dimensions required'};
    dlg_title = 'Input';
    num_lines = 1;
    defaultans = {'199'};
    answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
    k = str2double(answer);
    
    [trainingSetN, testSet] = PCA(trainingSet1, testSet1, k);

%%            LDA (or MDA as there are more than 2 classes)

elseif reduction == 2
    prompt = {'Select Number of Reduced Dimensions required'};
    dlg_title = 'Input';
    num_lines = 1;
    defaultans = {'199'};
    answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
    k = str2double(answer);
    
    [trainingSetN, testSet] = LDA(trainingSet1, testSet1, totalClasses, k);
    
end

%% Data Wrangling
idX = 0;
for iter1 = 1 : totalClasses
    for iter2 = 1 : size(trainingSetN, 2)
        idX = idX + 1;
        trainingSet(:, idX) = [trainingSetN(:, iter2, iter1); iter1];
    end
end
        

%% Select value of K

prompt = {'Enter Value of K'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'1'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
K = str2double(answer);

%%                             Predictions using KNN

predictedClass = KNNprediction(testSet, trainingSet, K);

%%                                  Accuracy
%Calculate the accuracy of Prediction on test data

testAccuracy = accuracy(predictedClass, testSet(end, :));
fprintf("Accuracy of classification using KNN: %d %% \n", testAccuracy);