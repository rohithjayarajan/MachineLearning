%%              Training Set of Images for data.mat format

function [trainingSet, testSet] = dataSetFace(totalClasses, trainFacesIdx, testFaceIdx, face)

for iter = 1 : totalClasses
    for num = 1 : size(trainFacesIdx, 2)
        temp(:, :, iter, num) = face(:, :, trainFacesIdx(iter, num));
        trainImage(:, num) = reshape(temp(:, :, iter, num), [], 1);
    end
    trainingSet(:, :, iter) = [ trainImage(:, 1) trainImage(:, 2) ];
end

for iter = 1 : totalClasses
        temp(:, :, iter) = face(:, :, testFaceIdx(iter));
        testSet(:, iter) = [reshape(temp(:, :, iter), [], 1); iter];
end

end