%%              Training Set of Images for data.mat format

function [trainingSet, testSet] = dataSetPoseIllum(totalClasses, trainFacesIdx, testFaceIdx, face)

for iter = 1 : totalClasses
    for num = trainFacesIdx(1) : trainFacesIdx(end)
        trainingSet(:, num, iter) = face(:, num, iter);
    end
end

for iter = 1 : totalClasses
    for num = testFaceIdx(1) : testFaceIdx(end)
        testSet(:, num, iter) = face(:, num, iter);
    end
end

end
