load("uspsDigits.mat")

% Reshape the training data into a 256 by 7921 matrix 
% where every column represents a number
TrainVectors = reshape(trainDigits, [256, 7291]);

% Reshape the test data into a 256 by 2007 matrix 
% where every column represents a number
TestVectors = reshape(testDigits, [256, 2007]);

% Nearest Neighbour

itterations = 10;
nn_guesses = nearest_neighbour(TestVectors, TrainVectors, trainAns, itterations);

nn_rates = zeros(itterations, 1);
nn_labels = strings(itterations, 1);
for i = 1:itterations 
    nn_rates(i) = sum(nn_guesses(:,i)~=testAns) / size(TestVectors, 2);
    nn_labels(i) = [num2str(i),'NN'];
end
 
nn_best = find(nn_rates==min(nn_rates));

% Centroid

ncc_guesses = nearest_centroid_classifier(TestVectors, TrainVectors, trainAns);
ncc_rates = sum(ncc_guesses~=testAns) / size(TestVectors, 2);

ncc_labels = {'NN', 'NCC'};

% Bar plot

figure('Name', 'Error rates');

subplot(2,1,1);
bar(reordercats(categorical(nn_labels), nn_labels), nn_rates * 100);
title('Error Rate for K Nearest Neighbour');

subplot(2,1,2);
bar(reordercats(categorical(ncc_labels), ncc_labels), [nn_rates(nn_best) * 100, ncc_rates * 100]);
title('Error Rate Nearest Neighbour and Nearest Centroid Classifier');

% Examples

nn_wrong = find(nn_guesses(:,nn_best)~=testAns);
nn_wrong_threes = find(testAns(nn_wrong)==3);

nn_correct = find(nn_guesses(:,nn_best)==testAns);
nn_correct_threes = find(testAns(nn_correct)==3);

ncc_wrong = find(ncc_guesses~=testAns);
ncc_wrong_threes = find(testAns(ncc_wrong)==3);

ncc_correct = find(ncc_guesses==testAns);
ncc_correct_threes = find(testAns(ncc_correct)==3);

figure('Name', 'nn wrong');
for i = 1:4
    subplot(2,2,i);
    ima(testDigits(:, :, nn_wrong(nn_wrong_threes(i))));
end

figure('Name', 'nn correct');
for i = 1:4
    subplot(2,2,i);
    ima(testDigits(:, :, nn_correct(nn_correct_threes(i))));
end

figure('Name', 'ncc wrong');
for i = 1:4
    subplot(2,2,i);
    ima(testDigits(:, :, ncc_wrong(ncc_wrong_threes(i))));
end

figure('Name', 'ncc correct');
for i = 1:4
    subplot(2,2,i);
    ima(testDigits(:, :, ncc_correct(ncc_correct_threes(i))));
end