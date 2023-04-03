TestNumber = testDigits(:,:,9);

TrainData = reshape(trainDigits, [256, 7291]);
TestVector = reshape(TestNumber, [256, 1]);

Difference = TrainData;

for i = 1:7291
    Difference(:,i) = Difference(:,i) - TestVector;
end

Norm = vecnorm(Difference);
Min = min(Norm);
Index = find(Norm==Min);

ima(TestNumber);

disp(trainAns(Index));