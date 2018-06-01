%%            PCA

function [trainingSet, testSet] = PCA(trainingSet, testSet, k)

[l1, b1, w1] = size(trainingSet);
trainingSet = reshape(trainingSet, [l1, b1 * w1]);

sigmPCA = cov(trainingSet');

[U, ~, ~] = svd(sigmPCA);
Ureduced = U(:, 1:k);
trainingSet = Ureduced' * trainingSet;
testSet1 = Ureduced' * testSet(1:end-1, :);
testSet1(k+1, :) = testSet(end, :);
testSet = testSet1;

trainingSet = reshape(trainingSet, [k, b1, w1]);
end