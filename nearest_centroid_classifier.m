function[errorrate]=nearest_centroid_classifier(TestVectors, testAns, TrainVectors, trainAns)

    % Calculate Mean vectors
    MeanVectors = zeros(256, 10);
    for i = 1:10
        MeanVectors(:,i) = mean(TrainVectors(:,trainAns == (i - 1)), 2);
    end

    errors = 0;

    for i = 1:size(TestVectors, 2)     
        if (testAns(i) ~= find_nearest(TestVectors(:,i), MeanVectors))
            errors = errors + 1;
        end
    end

    errorrate = errors / size(TestVectors,2);
end

function[Guess]=find_nearest(TestVector, MeanVectors)
    % Calculate difference between the train vectors and the test vector
    Difference = MeanVectors - TestVector;
    
    % Calculate the dot product of every column in the matrix (c1 ⋅ c1)
    Norm = vecnorm(Difference); 
    
    Guess = find(Norm==min(Norm)) - 1;
end