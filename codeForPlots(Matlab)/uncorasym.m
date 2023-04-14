SigPow = 1:0.2:4;
SigPow = SigPow(1:end-1); %dropping the last sample
SigmaVal = 10.^(-1*SigPow);
SigmaVal = SigmaVal*10^3; %to get in millivolts
% SigmaVal = logspace(-1, 2, 15);

x2 = [SigmaVal, fliplr(SigmaVal)];%can be reused for all other plotting!

%reading the symmetric circuit data
for i = 1:5
    symmetricData(:,:, i) = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\testData\uncorRev\Sym\"+string(i-1)+".csv");
end

averageSymmetricData = mean(symmetricData, 3);
stdSymmetricData = std(symmetricData, [], 3);


curve1 = (averageSymmetricData + stdSymmetricData);
curve2 = (averageSymmetricData - stdSymmetricData);

inBetweenSymmetricData = [curve1.', fliplr(curve2.')];
hold on;
fill(x2, inBetweenSymmetricData, 'b','LineStyle','none', FaceAlpha = 0.2);
hold on;
plot(SigmaVal, averageSymmetricData, 'b--*', 'LineWidth', 1);


%reading the asymmetrical test data
for i = 1:5
    asymmetricData(:,:, i) = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\testData\uncorRev\Asym\"+string(i-1)+".csv");
end

averageAsymmetricData = mean(asymmetricData, 3);
stdAsymmetricData = std(asymmetricData, [], 3);


curve1 = (averageAsymmetricData + stdAsymmetricData);
curve2 = (averageAsymmetricData - stdAsymmetricData);

inBetweenAsymmetricData = [curve1.', fliplr(curve2.')];
hold on;
fill(x2, inBetweenAsymmetricData, 'm','LineStyle','none', FaceAlpha = 0.2);
hold on;
plot(SigmaVal, averageAsymmetricData, 'm--o', 'LineWidth', 1);