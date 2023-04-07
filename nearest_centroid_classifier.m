function[guesses]=nearest_centroid_classifier(TestVectors, TrainVectors, trainAns)
    % Calculate Mean vectors
    MeanVectors = zeros(256, 10);
    figure('Name', 'Nearest Centroid Classifier Mean Vectors');
    for i = 1:10
        MeanVectors(:,i) = mean(TrainVectors(:,trainAns == (i - 1)), 2);
        subplot(2,5, i);
        ima(reshape(MeanVectors(:, i), [16, 16]));
    end

    guesses = zeros(size(TestVectors, 2), 1);
    for i = 1:size(TestVectors, 2)     
        guesses(i) = find_nearest(TestVectors(:,i), MeanVectors);
    end
end

function[Guess]=find_nearest(TestVector, MeanVectors)
    % Calculate difference between the train vectors and the test vector
    Difference = MeanVectors - TestVector;
    
    % Calculate the dot product of every column in the matrix (c1 ⋅ c1)
    Norm = vecnorm(Difference); 
    
    Guess = find(Norm==min(Norm)) - 1;
end