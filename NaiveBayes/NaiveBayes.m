%NaiveBayes.m
%
%Predicts the class to which an image belongs using the Machine Learning
%technique of Naive-Bayes. A gaussian distribution is modeled
%using the training data and a hypothesis is used to evaluate classes
%of unknown images.
%
%Dataset used is data.mat, pose.mat or illumination.mat
%
%Dimensionality reduction techniques available- PCA/LDA
%
%Both Hypothesis-I and Hypothesis-II give the same evaluation as both stem
%from the same expression, i.e. the Multivaraite Gaussian Distribution

clear all;
clc;

debug = 0;  %0/1: turn off/on prediction display for each test data, for each hypothesis

%%               User input to choose dataset to be loaded

userChoice = chooseDataset();

%%           Extract information and Train-Test data from dataset

[totalClasses, trainingSet, testSet] = extractDatasetStats(userChoice);
trainingSet1 = trainingSet;
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
    
    [trainingSet, testSet] = PCA(trainingSet1, testSet1, k);
%%              LDA

elseif reduction == 2
    prompt = {'Select Number of Reduced Dimensions required'};
    dlg_title = 'Input';
    num_lines = 1;
    defaultans = {'199'};
    answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
    k = str2double(answer);
    
    [trainingSet, testSet] = LDA(trainingSet1, testSet1, totalClasses, k);
    
end
%%                         Feature Mean MLE

%Estimate the Mean for the Multivariate Gaussian Distribution using
%Maximum Likelihood Estimation

mu = estimateMean(totalClasses, trainingSet);

%%                       Feature Variance MLE
%Estimate the Covariance for the Multivariate Gaussian Distribution using
%Maximum Likelihood Estimation

sigm = estimateCovariance(totalClasses, trainingSet, mu);

%% Compute det|Covariance| and inv(Covariance)

[detSigma, invSigma] = computeDetnInv(sigm, totalClasses);


%%                  Hypothesis-I - Discriminant Function
%Predict the class of an unknown image data using the discriminant function

prediction1 = hypothesis1(totalClasses, testSet, mu, detSigma, invSigma, debug);

%%                        Accuracy - Hypothesis-I
%Calculate the accuracy of Hypothesis-I on test data 

testAccuracy1 = accuracy(prediction1, testSet(end, :));
fprintf("Accuracy of classification using Hypothesis-I: %d %%\n", testAccuracy1);

%%              Hypothesis-II - Probability Distribution Function
%Predict the class of an unknown image data using the probability
%distribution function

% prediction2 = hypothesis2(totalClasses, testSet, mu, detSigma, invSigma, debug);

%%                         Accuracy - Hypothesis-II
%Calculate the accuracy of Hypothesis-II on test data

%     testAccuracy2 = accuracy(prediction2, testSet(end, :));
%     fprintf("Accuracy of classification using Hypothesis-II: %d %%\n", testAccuracy2);