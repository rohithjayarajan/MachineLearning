%%              Training Set of Images for data.mat format

function [trainingSet, testSet] = dataSetPoseIllum(totalClasses, trainFaceIdx, testFaceIdx, face)

temp = 0;
for iter = 1 : totalClasses
    for num = trainFaceIdx(1) : trainFaceIdx(end)
        temp = temp + 1;
        trainingSet(:, temp) = [face(:, num, iter); iter];
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
