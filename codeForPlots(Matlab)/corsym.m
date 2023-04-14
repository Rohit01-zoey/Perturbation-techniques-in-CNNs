corPercent = [0.1, 1, 2, 10, 50];

x2 = [corPercent, fliplr(corPercent)];%can be reused for all other plotting!

%reading the symmetric circuit data
for i = 1:5
    corsymmetricData(:,:, i) = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\testData\corRev\Sym\"+string(i-1)+".csv");
end

averageSymmetricData = mean(corsymmetricData, 3);
stdSymmetricData = std(corsymmetricData, [], 3);


curve1 = (averageSymmetricData + stdSymmetricData);
curve2 = (averageSymmetricData - stdSymmetricData);

inBetweenSymmetricData = [curve1.', fliplr(curve2.')];
hold on;
fill(x2, inBetweenSymmetricData, 'b','LineStyle','none', FaceAlpha = 0.2);
hold on;
plot(corPercent, averageSymmetricData, 'b-', 'LineWidth', 1);


%reading the asymmetrical test data
for i = 1:5
    corasymmetricData(:,:, i) = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\testData\corRev\Asym\"+string(i-1)+".csv");
end

averageAsymmetricData = mean(corasymmetricData, 3);
stdAsymmetricData = std(corasymmetricData, [], 3);


curve1 = (averageAsymmetricData + stdAsymmetricData);
curve2 = (averageAsymmetricData - stdAsymmetricData);

inBetweenAsymmetricData = [curve1.', fliplr(curve2.')];
hold on;
fill(x2, inBetweenAsymmetricData, 'm','LineStyle','none', FaceAlpha = 0.2);
hold on;
plot(corPercent, averageAsymmetricData, 'm--o', 'LineWidth', 1);