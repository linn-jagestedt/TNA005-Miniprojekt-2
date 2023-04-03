TestData = testDigits(:,:,9);

TrainData = reshape(trainDigits, [256, 7291]);
TestVector = reshape(TestData, [256, 1]);

ima(TestData);

Difference = TrainData;

for i = 1:7291
    Difference(:,i) = Difference(:,i) - TestVector;
end

Norm = vecnorm(Difference);

Min = min(Norm);

Index = find(Norm==Min);

disp(Index)

disp(trainAns(Index));