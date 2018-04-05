function testAccuracy = accuracy(prediction, totalClasses)

truePositive = 0;
for iter = 1 : totalClasses
    if prediction(iter) == iter
        truePositive = truePositive + 1;
    end
end

testAccuracy = (truePositive/totalClasses)*100;

end