%%                       Feature Variance MLE

function sigm = estimateCovariance(totalClasses, imageClass, mu)

for iter = 1 : totalClasses
    sigm(:, :, iter) = (imageClass(:, 1, iter) - mu(:, iter))*...
                       (imageClass(:, 1, iter) - mu(:, iter))' +...
                       (imageClass(:, 2, iter) - mu(:, iter))*...
                       (imageClass(:, 2, iter) - mu(:, iter))';
    sigm(:, :, iter) = sigm(:, :, iter)./2 + eye(size(sigm(:, :, iter)));
end

end