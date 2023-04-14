SigPow = 1:0.2:4;
SigPow = SigPow(1:end-1); %dropping the last sample
SigmaVal = 10.^(-1*SigPow);
SigmaVal = SigmaVal*10^3; %to get in millivolts
% SigmaVal = logspace(-1, 2, 15);


x2 = [SigmaVal, fliplr(SigmaVal)];%can be reused for all other plotting!


%reading the software baseline data
softwareData = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\testData\software\software.csv");
averageSoftwareData = mean(softwareData);
stdSoftwareData = std(softwareData);


curve1 = (averageSoftwareData + stdSoftwareData).*ones(1,length(SigmaVal));
curve2 = (averageSoftwareData - stdSoftwareData).*ones(1,length(SigmaVal));

inBetweenSoftwareData = [curve1, fliplr(curve2)];
fill(x2, inBetweenSoftwareData, 'g','LineStyle','none', FaceAlpha = 0.2);
hold on;
plot(SigmaVal, averageSoftwareData.*ones(1,length(SigmaVal)), 'g--^', 'LineWidth', 1);

%reading the quantization baseline

quantizeData = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\testData\quant\quantized.csv");
averageQuantizeData = mean(quantizeData);
stdQuantizeData = std(quantizeData);


curve1 = (averageQuantizeData + stdSoftwareData).*ones(1,length(SigmaVal));
curve2 = (averageQuantizeData - stdSoftwareData).*ones(1,length(SigmaVal));

inBetweenQuantizeData = [curve1, fliplr(curve2)];
fill(x2, inBetweenQuantizeData, 'k','LineStyle','none', FaceAlpha = 0.2);
hold on;
plot(SigmaVal, averageQuantizeData.*ones(1,length(SigmaVal)), 'k--x', 'LineWidth', 1);

%reading the on-chip inference data
for i = 1:5
    inferenceOnChipData(:,:, i) = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\testData\inferenceOnChip\"+string(i-1)+".csv");
end

averageInferenceOnChip = mean(inferenceOnChipData, 3);
stdInferenceOnChip = std(inferenceOnChipData, [], 3);


curve1 = (averageInferenceOnChip + stdInferenceOnChip);
curve2 = (averageInferenceOnChip - stdInferenceOnChip);

inBetweenInferenceOnChip = [curve1.', fliplr(curve2.')];
hold on;
fill(x2, inBetweenInferenceOnChip, 'b','LineStyle','none', FaceAlpha = 0.2);
hold on;
plot(SigmaVal, averageInferenceOnChip, 'b--*', 'LineWidth', 1);


%reading the on-chip training data
for i = 1:5
    trainingOnChipData(:,:, i) = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\testData\onChipTraining\"+string(i-1)+".csv");
end

averageTrainingOnChip = mean(trainingOnChipData, 3);
stdTrainingOnChip = std(trainingOnChipData, [], 3);


curve1 = (averageTrainingOnChip + stdTrainingOnChip);
curve2 = (averageTrainingOnChip - stdTrainingOnChip);

inBetweenTrainingOnChip = [curve1.', fliplr(curve2.')];
hold on;
fill(x2, inBetweenTrainingOnChip, 'm','LineStyle','none', FaceAlpha = 0.2);
hold on;
plot(SigmaVal, averageTrainingOnChip, 'm--o', 'LineWidth', 1);