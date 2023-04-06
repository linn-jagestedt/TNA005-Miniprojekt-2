load("uspsDigits.mat")

% Reshape the training data into a 256 by 7921 matrix 
% where every column represents a number
TrainVectors = reshape(trainDigits, [256, 7291]);

% Reshape the test data into a 256 by 2007 matrix 
% where every column represents a number
TestVectors = reshape(testDigits, [256, 2007]);

% Nearest Neighbour

itterations = 10;
nearest = nearest_neighbour(TestVectors, testAns, TrainVectors, trainAns, itterations);

labels = strings(itterations, 1);
for i = 1:itterations 
    labels(i) = [num2str(i),'NN'];
end
 
subplot(2,1,1);
bar(reordercats(categorical(labels), labels), nearest * 100, '');
ylabel('Error-rate');

% Centroid

centroid = nearest_centroid_classifier(TestVectors, testAns, TrainVectors, trainAns);

labels = {'AVGNN', 'NCC'};

subplot(2,1,2);
bar(reordercats(categorical(labels), labels), [mean(nearest * 100), centroid * 100]);
ylabel('Error-rate');