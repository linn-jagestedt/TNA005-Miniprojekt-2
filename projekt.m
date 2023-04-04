% Reshape the training data into a 256 by 7921 matrix 
% where every column represents a number
TrainVectors = reshape(trainDigits, [256, 7291]);

% Calculate Mean vectors
MeanVectors = zeros(256, 10);
for i = 1:10
    MeanVectors(:,i) = mean(TrainVectors(:,trainAns == (i - 1)), 2);
end

centr = 1; 
nearest = zeros(4,1);

% Test all numbers in test data
for i = 10:size(testDigits,3)

    % Reshape the test number into a vector in R256
    TestVector = reshape(testDigits(:,:,i), [256, 1]);

    % Nearest Neighbour
    for k = 1:4
        if (testAns(i) == nearest_neighbour(TestVector, TrainVectors, trainAns, k))
            nearest(k) = nearest(k) + 1;
        end
    end

    % Centroid
    if (testAns(i) == centroid(TestVector, MeanVectors))
        centr = centr + 1;
    end
end

result = nearest;
result(4) = centr;

bar((result / size(testDigits,3)) * 100);