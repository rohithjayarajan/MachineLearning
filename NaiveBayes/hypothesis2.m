%%              Hypothesis-II - Probability Distribution Function

function prediction = hypothesis2(testFaceIdx, totalClasses, testImage, mu, sigm, debug)

for testImageNum = 1 : size(testFaceIdx,1)
    for iter = 1 : totalClasses
        hypothesis(:, iter) = [ 1/(sqrt(det((sigm(:, :, iter)))))*...
                                    exp((-1/2)*...
                                    (testImage(:, testImageNum) - mu(:, iter))'*...
                                    pinv(sigm(:, :, iter))*...
                                    (testImage(:, testImageNum) - mu(:, iter)))...
                                     iter];
    end
    
    decision = sortrows(hypothesis', 'descend');
    prediction(testImageNum) = decision(1,2);
%     fprintf("Class is %d", prediction2);
    if debug == 1
        formatSpec = 'Predicted class label of %d as %d \n';
        fprintf(formatSpec,testImageNum, prediction(testImageNum));
    end
end

end