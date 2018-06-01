%%              Training Set of Images for data.mat format

function [trainingSet, testSet] = KNNdataSetPoseIllum(totalClasses, trainFaceIdx, testFaceIdx, face)

for iter = 1 : totalClasses
    for num = trainFaceIdx(1) : trainFaceIdx(end)
        trainingSet(:, num, iter) = face(:, num, iter);
    end
end

temp = 0;
for iter = 1 : totalClasses
    for num = testFaceIdx(1) : testFaceIdx(end)
        temp = temp + 1;
        testSet(:, temp) = [face(:, num, iter); iter];
    end
end

end
