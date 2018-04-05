%%                         Feature Mean MLE

function mu = estimateMean(totalClasses, trainingSet)

for iter = 1 : totalClasses
    mu(:, iter) = sum(trainingSet(:, :, iter),2);
    mu(:, iter) = mu(:, iter)./size(trainingSet,2);
end

end