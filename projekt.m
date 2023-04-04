% Reshape the training data into a 256 by 7921 matrix 
% where every column represents a number
TrainVectors = reshape(trainDigits, [256, 7291]);

disp("Nearest Neighbour");

bound = 4;
success = zeros(bound,1);

for i = 1:size(testDigits,3)

    % Reshape the test number into a vector in R256
    TestVector = reshape(testDigits(:,:,i), [256, 1]);

    for k = 1:bound        
        if (testAns(i) == nearest_neighbour(TestVector, TrainVectors, trainAns, k))
            success(k) = success(k) + 1;
        end
    end
end

plot(success);