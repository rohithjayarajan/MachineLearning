function [totalClasses, trainingSet, testSet] = extractStateStats()

%%

load data.mat face         %load the dataset 'faces' to your workspace
totalClasses = 3;     %represents the faces of 200 different people we have to correctly classify

%%                          Train-Test Split
%Split the data into a train-test ratio of 2:1
neutralSet = face(:, :, 1:3:598);
happySet = face(:, :, 2:3:599);
illumSet = face(:, :, 3:3:600);
stateDataset = cat(3, neutralSet, happySet, illumSet);

numx = 1;
for subject = 1 : totalClasses
    for iter = 1 : 200
        stateFace(:, iter, subject) = reshape(stateDataset(:,:, numx), [], 1);
        numx = numx + 1;
    end
end
%%                          Processed Data Sets
%Process the images into training and test data for easier manipulation

%%                          Train-Test Split
%Split the data into a train-test ratio of 2:1

prompt = {'Choose train-test split (0%-100%)'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'66'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
split = str2double(answer)/100;

testEnd = ceil(split*size(stateFace, 2));
trainFaceIdx = [ 1 : testEnd ]';
testFaceIdx = [ testEnd + 1 : size(stateFace,2) ]';
    
for iter = 1 : totalClasses
    for num = trainFaceIdx(1) : trainFaceIdx(end)
        trainingSet(:, num, iter) = stateFace(:, num, iter);
    end
end

temp = 0;
for iter = 1 : totalClasses
    for num = testFaceIdx(1) : testFaceIdx(end)
        temp = temp + 1;
        testSet(:, temp) = [stateFace(:, num, iter); iter];
    end
end

end

% %%              Training Set of Images for data.mat format
% 
% function [trainingSet, testSet] = dataSetFace(totalClasses, trainFacesIdx, testFaceIdx, face)
% 
% for iter = 1 : totalClasses
%     for num = 1 : size(trainFacesIdx, 2)
%         temp(:, :, iter, num) = face(:, :, trainFacesIdx(iter, num));
%         trainImage(:, num) = reshape(temp(:, :, iter, num), [], 1);
%     end
%     trainingSet(:, :, iter) = [ trainImage(:, 1) trainImage(:, 2) ];
% end
% 
% for iter = 1 : totalClasses
%         temp(:, :, iter) = face(:, :, testFaceIdx(iter));
%         testSet(:, iter) = [reshape(temp(:, :, iter), [], 1); iter];
% end
% 
% end