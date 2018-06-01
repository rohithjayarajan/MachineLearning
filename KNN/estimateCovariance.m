%%                       Feature Variance MLE

function sigm = estimateCovariance(totalClasses, trainingSet, mu)

for iter = 1 : totalClasses
    a = 0;
    for samples = 1 : size(trainingSet,2)
        a = a + (trainingSet(:, samples, iter) - mu(:, iter))*...
                (trainingSet(:, samples, iter) - mu(:, iter))';
        sigm(:, :, iter) = a./size(trainingSet,2) + eye(size(a));
    end
end

end