function[guesses]=nearest_neighbour(TestVectors, TrainVectors, trainAns)
    guesses = zeros(size(TestVectors, 2), 1);

    for i = 1:size(TestVectors, 2) 
        Norm = vecnorm(TrainVectors - TestVectors(:,i)); 
        guesses(i) = find_nearest(Norm, trainAns);
    end
end

function[Guess]=find_nearest(Norm, trainAns)
    Guess = trainAns(Norm==min(Norm));
end