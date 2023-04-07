function[guesses]=nearest_neighbour(TestVectors, TrainVectors, trainAns, itterations)
    guesses = zeros(size(TestVectors, 2), itterations);

    for i = 1:size(TestVectors, 2) 
        % Calculate difference between the train vectors and the test vector
        Difference = TrainVectors - TestVectors(:,i);
        
        % Calculate the dot product of every column in the matrix (c1 ⋅ c1)
        Norm = vecnorm(Difference); 
    
        for k = 1:itterations
            guesses(i, k) = find_nearest(Norm, trainAns, k);
        end
    end
end

function[Guess]=find_nearest(Norm, trainAns, k)
    % Get the index of the smallest k values in the list of dot products
    % and find their asociated values in the answer sheet
    Min = mink(Norm, k);
    Nearest = zeros(k,1);
    for i = 1:k
        Nearest(i) = trainAns(Norm==Min(i));
    end
    
    % Check if there is a single most common digit.
    % If not, take the nearest neighbour.
    Frequency = accumarray(Nearest+1,1);
    MostFrequent = find(Frequency==max(Frequency)) - 1;
    
    for i = 1:k
        if ismember(Nearest(i), MostFrequent)
            Guess = Nearest(i);
            return;
        end
    end
end