function[Guess]=centroid(TestVector, TrainVectors, TrainAns)

Mean = zeros(256, 10);

for i = 1:10
    Total = TrainVectors(:,TrainAns == (i - 1));    
    Mean(:,i) = mean(Total, 2);
end

% Calculate difference between the train vectors and the test vector
Difference = Mean - TestVector;

for i = 1:10
    ima(reshape(Mean(:,i), 16,16))
end 

for i = 1:10
    ima(reshape(Difference(:,i), 16,16))
end 

% Calculate the dot product of every column in the matrix (c1 ⋅ c1)
Norm = vecnorm(Difference); 

Guess = find(min(Norm));