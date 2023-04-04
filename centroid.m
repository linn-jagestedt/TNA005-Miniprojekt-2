function[Guess]=centroid(TestVector, MeanVectors)

% Calculate difference between the train vectors and the test vector
Difference = MeanVectors - TestVector;

% Calculate the dot product of every column in the matrix (c1 ⋅ c1)
Norm = vecnorm(Difference); 

Guess = find(Norm==min(Norm)) - 1;