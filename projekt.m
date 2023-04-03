disp("Nearest Neighbour");

for k = 1:10
    success = 0;
    for i = 1:size(testDigits,3)
        Guess = nearest_neighbour(testDigits(:,:,i), trainDigits, trainAns, k);
        Answer = testAns(i);

        if (Answer == Guess)
            success = success + 1;
        end
    end

    disp(['k=', num2str(k), ': ', num2str(success),'/', num2str(size(testDigits,3)) ,' successes'])
end