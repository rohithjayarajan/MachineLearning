function [totalClasses, trainingSet, testSet] = extractDatasetStats(userChoice)

%%
if userChoice == 1
    
    load data.mat face         %load the dataset 'faces' to your workspace
    totalClasses = 200;     %represents the faces of 200 different people we have to correctly classify
    
    %%                          Train-Test Split
    %Split the data into a train-test ratio of 2:1

    trainFaceIdx = [ 1:3:600; 3:3:600 ]';
    testFaceIdx = [ 2:3:600 ]';
    
    %%                          Processed Data Sets
    %Process the images into training and test data for easier manipulation
    
    [trainingSet, testSet] = dataSetFace(totalClasses, trainFaceIdx, testFaceIdx, face);
    
end

%%
if userChoice == 2
    
    load pose.mat pose          %load the dataset 'poses' to your workspace
    totalClasses = 68;     %represents the faces of 68 different people we have to correctly classify
    
    for subject = 1 : totalClasses
        for iter = 1 : size(pose, 3)
            face(:, iter, subject) = reshape(pose(:,:,iter, subject), [], 1);
        end
    end
    %%                          Train-Test Split
    %Split the data into a train-test ratio of 2:1
    
    prompt = {'Choose train-test split (0%-100%)'};
    dlg_title = 'Input';
    num_lines = 1;
    defaultans = {'70'};
    answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
    split = str2double(answer)/100;
    
    testEnd = ceil(split*size(face, 2));
    trainFaceIdx = [ 1 : testEnd ]';
    testFaceIdx = [ testEnd + 1 : 13 ]';
    
    %%                          Processed Data Sets
    %Process the images into training and test data for easier manipulation
    
    [trainingSet, testSet] = dataSetPoseIllum(totalClasses, trainFaceIdx, testFaceIdx, face);
    
end

%%
if userChoice == 3
    
    load illumination.mat illum  %load the dataset 'illumination' to your workspace
    totalClasses = 68;     %represents the faces of 68 different people we have to correctly classify
    face = illum;
    %%                          Train-Test Split
    %Split the data into a train-test ratio of 2:1
    
    prompt = {'Choose train-test split (0%-100%)'};
    dlg_title = 'Input';
    num_lines = 1;
    defaultans = {'70'};
    answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
    split = str2double(answer)/100;
    
    testEnd = ceil(split*size(face, 2));
    trainFaceIdx = [ 1 : testEnd ]';
    testFaceIdx = [ testEnd + 1 : 21 ]';
    
    %%                          Processed Data Sets
    %Process the images into training and test data for easier manipulation
    
    [trainingSet, testSet] = dataSetPoseIllum(totalClasses, trainFaceIdx, testFaceIdx, face);
end

end