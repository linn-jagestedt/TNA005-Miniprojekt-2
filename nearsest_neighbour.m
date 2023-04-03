% Get a random number from the test data
TestNumber = testDigits(:,:,floor(rand() * 2007));

% Load and reshape the training data into a 256 by 7921 matrix 
% where every column represents a number
TrainVectors = reshape(trainDigits, [256, 7291]);

% Reshape the test number into a vector in R256
TestVector = reshape(TestNumber, [256, 1]);

% Calculate difference between the train vectors and the test vector
Difference = zeros(256, 7291);

for i = 1:7291
    Difference(:,i) = TrainVectors(:,i) - TestVector;
end

% Calculate the dot product of every column in the matrix (c1 ⋅ c1)
Norm = vecnorm(Difference); 

% Get the index of the smallest value in the list of dot products
Index = find(Norm==min(Norm)); 

% Get the answer from the answer sheet
Answer = trainAns(Index);

% Display the image and answer from the algoritm
ima(TestNumber);
disp(Answer);