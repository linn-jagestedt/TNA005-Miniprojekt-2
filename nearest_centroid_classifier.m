function[guesses, mean_vectors]=nearest_centroid_classifier(TestVectors, TrainVectors, trainAns)
    
    mean_vectors = zeros(256, 10);
    for i = 1:10
        mean_vectors(:,i) = mean(TrainVectors(:,trainAns == (i - 1)), 2);
    end

    guesses = zeros(size(TestVectors, 2), 1);
    for i = 1:size(TestVectors, 2)     
        Norm = vecnorm(mean_vectors - TestVectors(:,i)); 
        guesses(i) = find_nearest(Norm);
    end
end

function[Guess]=find_nearest(Norm)
    Guess = find(Norm==min(Norm)) - 1;
end