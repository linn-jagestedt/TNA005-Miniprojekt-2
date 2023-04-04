function[Guess]=nearest_neighbour(TestVector, TrainVectors, TrainAns, k)

% Calculate difference between the train vectors and the test vector
Difference = TrainVectors - TestVector;

% Calculate the dot product of every column in the matrix (c1 ⋅ c1)
Norm = vecnorm(Difference); 

% Get the index of the smallest k values in the list of dot products
% and find their asociated values in the answer sheet
NearestIndices = find(ismember(Norm, mink(Norm, k)), k);
NearestValues = TrainAns(NearestIndices);

% Check if there is a single most common digit.
% If not, take the nearest neighbour.
Frequency = accumarray(NearestValues+1,1);
NumberOfModes = sum(Frequency(:) == max(Frequency));

if (NumberOfModes == 1)
    Guess = find(Frequency==max(Frequency)) - 1;
else
    Guess = NearestValues(1);
end