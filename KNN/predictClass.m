function predictedClass = predictClass(EucDist, k)

EucDist = sortrows(EucDist);
kPredictions = EucDist(1 : k, 2);
if mode(kPredictions) == 0
    predictedClass = EucDist(1, :);
else
    predictedClass = mode(kPredictions);

end