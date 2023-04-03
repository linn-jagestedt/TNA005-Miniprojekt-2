function[Guess]=nearest_neighbour(TestNumber, TrainDigits, TrainAns, k)

% Reshape the training data into a 256 by 7921 matrix 
% where every column represents a number
TrainVectors = reshape(TrainDigits, [256, 7291]);

% Reshape the test number into a vector in R256
TestVector = reshape(TestNumber, [256, 1]);

% Calculate difference between the train vectors and the test vector
Difference = zeros(256, 7291);

for i = 1:7291
    Difference(:,i) = TrainVectors(:,i) - TestVector;
end

% Calculate the dot product of every column in the matrix (c1 ⋅ c1)
Norm = vecnorm(Difference); 

% Get the index of the smallest k values in the list of dot products
% and find their asociated values in the answer sheet
NearestIndices = find(ismember(Norm, mink(Norm, k)), k);
NearestValues = TrainAns(NearestIndices);

% Get the most occuring number from the list of values
Guess = mode(NearestValues);