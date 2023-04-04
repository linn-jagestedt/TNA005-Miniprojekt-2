function[Guess]=nearest_neighbour(TestVector, TrainVectors, TrainAns, k)

% Calculate difference between the train vectors and the test vector
Difference = TrainVectors - TestVector;

% Calculate the dot product of every column in the matrix (c1 ⋅ c1)
Norm = vecnorm(Difference); 

% Get the index of the smallest k values in the list of dot products
% and find their asociated values in the answer sheet
NearestIndices = find(ismember(Norm, mink(Norm, k)), k);
NearestValues = TrainAns(NearestIndices);

% Get the most occuring number from the list of values
Guess = mode(NearestValues);