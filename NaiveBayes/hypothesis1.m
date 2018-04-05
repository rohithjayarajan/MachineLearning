%%                  Hypothesis-I - Discriminant Function

function prediction = hypothesis1(testFaceIdx, totalClasses, testImage, mu, sigm, debug)

for testImageNum = 1 : size(testFaceIdx,1)
    for iter = 1 : totalClasses
        hypothesis(:, iter) = [ (-1/2) * (testImage(:, testImageNum) - mu(:, iter))'*...
                                    pinv(sigm(:, :, iter))*...
                                    (testImage(:, testImageNum) - mu(:, iter))...
                                    - (1/2) * log( det((sigm(:, :, iter))))...
                                    iter];
    end
    
    decision = sortrows(hypothesis', 'descend');
    prediction(testImageNum) = decision(1,2);
%     fprintf("Class is %d", prediction1);
    if debug == 1
        formatSpec = 'Predicted class label of %d as %d \n';
        fprintf(formatSpec,testImageNum, prediction(testImageNum));
    end
end

end