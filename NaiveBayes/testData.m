%%                              Test Data

function testImage = testData(totalClasses, face, testFaceIdx)

for iter = 1 : totalClasses
        temp(:, :, iter) = face(:, :, testFaceIdx(iter));
        testImage(:, iter) = reshape(temp(:, :, iter), [], 1);
end

end