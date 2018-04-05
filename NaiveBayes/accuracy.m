function testAccuracy = accuracy(prediction, testLabels)

truePositive = 0;
for iter = 1 : size(testLabels, 2)
    if prediction(iter) == testLabels(iter)
        truePositive = truePositive + 1;
    end
end

testAccuracy = (truePositive/size(testLabels, 2))*100;

end