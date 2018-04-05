%%                         Feature Mean MLE

function mu = estimateMean(totalClasses, imageClass)

for iter = 1 : totalClasses
    mu(:, iter) = imageClass(:, 1, iter) + imageClass(:, 2, iter);
    mu(:, iter) = mu(:, iter)./2;
end

end