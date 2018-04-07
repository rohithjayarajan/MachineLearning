%%              Training Set of Images for data.mat format

function [trainingSet, testSet] = dataSetFace(totalClasses, trainFacesIdx, testFaceIdx, face)

id = 0;
for iter = 1 : totalClasses
    for num = 1 : size(trainFacesIdx, 2)
        id = id + 1;
        temp(:, :, iter, num) = face(:, :, trainFacesIdx(iter, num));
        trainingSet(:, id) = [reshape(temp(:, :, iter, num), [], 1); iter];
    end
end

for iter = 1 : totalClasses
        temp(:, :, iter) = face(:, :, testFaceIdx(iter));
        testSet(:, iter) = [reshape(temp(:, :, iter), [], 1); iter];
end

end