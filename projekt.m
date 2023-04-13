%% Setup

load("uspsDigits.mat")

% Reshape the training data into a 256 by 7921 matrix 
% where every column represents a number
TrainVectors = reshape(trainDigits, [256, 7291]);

% Reshape the test data into a 256 by 2007 matrix 
% where every column represents a number
TestVectors = reshape(testDigits, [256, 2007]);

%% k-Nearest Neighbour

itterations = 10;
nn_guesses = zeros(size(TestVectors, 2), itterations);

for i = 1:itterations
    nn_guesses(:, i) = k_nearest_neighbour(TestVectors, TrainVectors, trainAns, i);
end

%% Centroid

[ncc_guesses, mean_vectors] = nearest_centroid_classifier(TestVectors, TrainVectors, trainAns);

%% Bar plot k-NN

nn_labels = strings(itterations, 1);
nn_rates = zeros(itterations, 1);

for i = 1:itterations
    nn_labels(i) = [num2str(i),'NN'];
    nn_guesses_i = nn_guesses(:, i);

    nn_incorrect = nn_guesses_i~=testAns;
    nn_rates(i) = sum(nn_incorrect(:)) / size(testAns, 1);
end

nn_best = find(nn_rates==min(nn_rates));
nn_best_guesses = nn_guesses(:, nn_best);

figure('Name', 'Error Rate for K Nearest Neighbour');
bar(reordercats(categorical(nn_labels), nn_labels), nn_rates * 100);
ytickformat('percentage');

%% Bar plot 4NN vs NCC

nn_rate = zeros(10, 1);
ncc_rate = zeros(10, 1);

for i = 0:9
    testAns_i = find(testAns==i);
    
    nn_incorrect = nn_best_guesses(testAns_i)~=i;
    ncc_incorrect = ncc_guesses(testAns_i)~=i;

    nn_rate(i + 1) = sum(nn_incorrect(:)) / size(testAns_i, 1);
    ncc_rate(i + 1) = sum(ncc_incorrect(:)) / size(testAns_i, 1);

end
   
figure('Name', 'Error Rate Nearest Neighbour and Nearest Centroid Classifier');
bar(0:9, [nn_rate * 100, ncc_rate * 100]);
ytickformat('percentage');
legend('4-NN', 'NCC');

%% Time

time = timeit(@() k_nearest_neighbour(TestVectors, TrainVectors, trainAns, 1));
disp(['1NN Time: ', num2str(time)]);

time = timeit(@() k_nearest_neighbour(TestVectors, TrainVectors, trainAns, nn_best));
disp([num2str(nn_best), 'NN Time: ', num2str(time)]);

time = timeit(@() nearest_centroid_classifier(TestVectors, TrainVectors, trainAns));
disp(['NCC Time: ', num2str(time)]);

%% Examples

nn_wrong = find(nn_guesses(:,nn_best)~=testAns);
nn_wrong_threes = find(testAns(nn_wrong)==3);

nn_correct = find(nn_guesses(:,nn_best)==testAns);
nn_correct_threes = find(testAns(nn_correct)==3);

ncc_wrong = find(ncc_guesses~=testAns);
ncc_wrong_threes = find(testAns(ncc_wrong)==3);

ncc_correct = find(ncc_guesses==testAns);
ncc_correct_threes = find(testAns(ncc_correct)==3);

figure('Name', 'nn wrong');
sgtitle('Nearest Neighbour', 'FontSize', 20);
for i = 1:4
    subplot(2,2,i);
    ima(testDigits(:, :, nn_wrong(nn_wrong_threes(i))));
end

figure('Name', 'nn correct');
sgtitle('Nearest Neighbour', 'FontSize', 20);
for i = 1:4
    subplot(2,2,i);
    ima(testDigits(:, :, nn_correct(nn_correct_threes(i))));
end

figure('Name', 'ncc wrong');
sgtitle('Nearest Centroid Classifier', 'FontSize', 20);
for i = 1:4
    subplot(2,2,i);
    ima(testDigits(:, :, ncc_wrong(ncc_wrong_threes(i))));
end

figure('Name', 'ncc correct');
sgtitle('Nearest Centroid Classifier', 'FontSize', 20);
for i = 1:4
    subplot(2,2,i);
    ima(testDigits(:, :, ncc_correct(ncc_correct_threes(i))));
end

figure('Name', 'Nearest Centroid Classifier Mean Vectors');
for i = 1:10
    subplot(2,5, i);
    ima(reshape(mean_vectors(:, i), [16, 16]));
end