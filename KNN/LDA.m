%%            LDA (or MDA as there are more than 2 classes)

function [trainingSet, testSet] = LDA(trainingSet, testSet, totalClasses, k)

%User input for choosing data set
% prompt = {'Select number of reduced dimensions - K (Classes in Dataset-1->200, Dataset-2->68, Dataset-3->68)'};
% dlg_title = 'Input';
% num_lines = 1;
% defaultans = {'199'};
% answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
% k = str2double(answer);

mu = estimateMean(totalClasses, trainingSet);

totalMean = 0;
for iter1 = 1 : size(trainingSet, 3)
    for iter2 = 1 : size(trainingSet, 2)
        totalMean = totalMean + trainingSet(:, iter2, iter1);
    end
end
totalMean = totalMean./(size(trainingSet, 3) * size(trainingSet, 2));

Sw = zeros(size(trainingSet, 1), size(trainingSet, 1));

for iter1 = 1 : size(trainingSet, 3)
    for iter2 = 1 : size(trainingSet, 2)
        Sw = Sw + (trainingSet(:, iter2, iter1) - mu(:, iter1)) * (trainingSet(:, iter2, iter1) - mu(:, iter1))';
    end
end
Sw = Sw + eye(size(Sw));

Sb = zeros(size(trainingSet, 1), size(trainingSet, 1));
for iter = 1 : size(mu, 2)
    Sb = Sb + size(trainingSet, 2)*(mu(:, iter) - totalMean) * (mu(:, iter) - totalMean)';
end

[U, ~, ~] = svd(inv(Sw) * Sb);

Ureduced = U(:, 1:k);
unrolledTrainingSet = reshape(trainingSet, size(trainingSet,1), size(trainingSet,2)*size(trainingSet,3));
Z = Ureduced' * unrolledTrainingSet;
Z = reshape(Z, k, size(trainingSet,2), size(trainingSet,3));
Zt = Ureduced' * testSet(1:end-1, :);
Zt(k+1, :) = testSet(end, :);
trainingSet = Z;
testSet = Zt;

fprintf('**********MDA Activated! Brace Yourselves!!!********** \n');

end