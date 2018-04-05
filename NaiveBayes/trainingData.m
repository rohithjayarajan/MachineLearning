%%                          Class Images
function imageClass = trainingData(totalClasses, trainFacesIdx, face)

for iter = 1 : totalClasses
    for num = 1 : size(trainFacesIdx, 2)
        temp(:, :, iter, num) = face(:, :, trainFacesIdx(iter, num));
        trainImage(:, num) = reshape(temp(:, :, iter, num), [], 1);
    end
    imageClass(:, :, iter) = [ trainImage(:, 1) trainImage(:, 2) ];
end