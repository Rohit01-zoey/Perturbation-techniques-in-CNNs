correlationVal = [-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1];
x2 = [correlationVal, fliplr(correlationVal)];%can be reused for all other plotting!

corsymmetricData = [66.34285714285714, 79.64285714285714, 77.52857142857142]; %hardcoded from python asymmetryNew.ipynb
averageSymmetricData = mean(corsymmetricData);
stdSymmetricData = std(corsymmetricData);

curve1 = (averageSymmetricData + stdSymmetricData).*ones(11,1);
curve2 = (averageSymmetricData - stdSymmetricData).*ones(11,1);

inBetweenSymmetricData = [curve1.', fliplr(curve2.')];
hold on;
fill(x2, inBetweenSymmetricData, 'b','LineStyle','none', FaceAlpha = 0.2);
hold on;
plot(correlationVal, averageSymmetricData.*ones(11,1), 'b-', 'LineWidth', 1);

%reading the asymmetrical test data
for i = 1:3
    corasymmetricData(:,:, i) = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\testData\finCorAsym\Asym\"+string(i-1)+".csv");
end

averageAsymmetricData = mean(corasymmetricData, 3);
stdAsymmetricData = std(corasymmetricData, [], 3);


curve1 = (averageAsymmetricData + stdAsymmetricData);
curve2 = (averageAsymmetricData - stdAsymmetricData);

inBetweenAsymmetricData = [curve1.', fliplr(curve2.')];
hold on;
fill(x2, inBetweenAsymmetricData, 'm','LineStyle','none', FaceAlpha = 0.2);
hold on;
plot(correlationVal, averageAsymmetricData, 'm--o', 'LineWidth', 1);