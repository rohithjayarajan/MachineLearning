function prediction = KNNprediction(testSet, trainingSet, k)

for iterTest = 1 : size(testSet, 2)
    EucDist = zeros(400,2);
    for iterTrain = 1 : size(trainingSet, 2)
%         MinkPower = size(trainingSet, 2) - 1;
%         MinkDiff = sum((testSet(1 : end-1, iterTest) - trainingSet(1 : end-1, iterTrain)).^MinkPower);
        SSD = sum((testSet(1 : end-1, iterTest) - trainingSet(1 : end-1, iterTrain)).^2);
        EucDist(iterTrain, :) = [sqrt(SSD), trainingSet(end, iterTrain)];
    end
    prediction(iterTest) = predictClass(EucDist, k);
end

end