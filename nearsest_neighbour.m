TestNumber = testDigits(:,:,9);

TrainVectors = reshape(trainDigits, [256, 7291]);
TestVector = reshape(TestNumber, [256, 1]);

% Calculate difference between the train images and the test images

Difference = zeros(256, 7291);

for i = 1:7291
    Difference(:,i) = TrainVectors(:,i) - TestVector;
end

% Calculate the Normal of every column in the matrix
Norm = vecnorm(Difference); 

% Get the index of the smallest value in the list of normals
Index = find(Norm==min(Norm)); 

ima(TestNumber);
disp(trainAns(Index));