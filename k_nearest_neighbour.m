function[guesses]=k_nearest_neighbour(TestVectors, TrainVectors, trainAns, k)

    guesses = zeros(size(TestVectors, 2), 1);
    for i = 1:size(TestVectors, 2) 
        Norm = vecnorm(TrainVectors - TestVectors(:,i)); 
        guesses(i) = find_nearest(Norm, trainAns, k);
    end
end

function[Guess]=find_nearest(Norm, trainAns, k)
    Min = mink(Norm, k);
    Nearest = zeros(k,1);
    for i = 1:k
        Nearest(i) = trainAns(Norm==Min(i));
    end
    
    Frequency = accumarray(Nearest+1,1);
    MostFrequent = find(Frequency==max(Frequency)) - 1;
    
    for i = 1:k
        if ismember(Nearest(i), MostFrequent)
            Guess = Nearest(i);
            return;
        end
    end
end