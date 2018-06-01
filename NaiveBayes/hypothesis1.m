%%                  Hypothesis-I - Discriminant Function

function prediction = hypothesis1(totalClasses, testSet, mu, detSigma, invSigma, debug)

for testImageNum = 1 : size(testSet,2)
    for iter = 1 : totalClasses
        hypothesis(:, iter) = [ (-1/2) * (testSet(1 : end - 1, testImageNum) - mu(:, iter))'*...
                                    invSigma(:, :, iter)*...
                                    (testSet(1 : end - 1, testImageNum) - mu(:, iter))...
                                    - (1/2) * log(detSigma(iter))...
                                    iter];
    end
    
    decision = sortrows(hypothesis', 'descend');
    prediction(testImageNum) = decision(1,2);
    
    if debug == 1
        formatSpec = 'Predicted class label of %d as %d \n';
        fprintf(formatSpec, testSet(end, testImageNum), prediction(testImageNum));
    end
end

end