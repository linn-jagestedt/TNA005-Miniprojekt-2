% Reshape the training data into a 256 by 7921 matrix 
% where every column represents a number
TrainVectors = reshape(trainDigits, [256, 7291]);

centr = 1; 
nearest = zeros(1,1);

for i = 1:size(testDigits,3)
    % Reshape the test number into a vector in R256
    TestVector = reshape(testDigits(:,:,i), [256, 1]);

    for k = 1:size(nearest)
        if (testAns(i) == nearest_neighbour(TestVector, TrainVectors, trainAns, k))
            nearest(k) = nearest(k) + 1;
        end
    end

    if (testAns(i) == centroid(TestVector, TrainVectors, trainAns))
        centr = centr + 1;
    end
end

result = nearest;
result(size(result) + 1) = centr;

bar(result);