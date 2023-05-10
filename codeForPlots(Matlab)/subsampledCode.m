SigmaVal = [5e-03, 10e-03, 30e-03, 50e-03, 100e-03].*1000;
epochs = 1:1:20; %generating the epochs

x2 = [epochs, fliplr(epochs)];%can be reused for all other plotting!

% for seedIndex = 1:5
%     software
% end

for sigIndex = 1:5
    for seedIndex = 1:5
        blindBP(:,:, seedIndex) = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\testData\inferenceOnChipSampled\BPBlind\"+string(seedIndex-1)+"\"+string(SigmaVal(sigIndex))+".0.csv");
        awareBP(:,:, seedIndex) = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\testData\inferenceOnChipSampled\BPAware\"+string(seedIndex-1)+"\"+string(SigmaVal(sigIndex))+".0.csv");
        blindWP(:,:, seedIndex) = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\testData\inferenceOnChipSampled\WPBlind\"+string(seedIndex-1)+"\"+string(SigmaVal(sigIndex))+".0.csv");
    end
    figure();
    title("Evolution of test accuracy for "+string(SigmaVal(sigIndex))+"mV of variability")
    averageblindBP = mean(blindBP, 3);
    stdblindBP = std(blindBP, [], 3);
    curve1 = (averageblindBP + stdblindBP);
    curve2 = (averageblindBP - stdblindBP);
    
    inBetweenblindBP = [curve1.', fliplr(curve2.')];
    hold on;
    fill(x2, inBetweenblindBP, 'r','LineStyle','none', FaceAlpha = 0.2);
    hold on;
    plot(epochs, averageblindBP, 'r*--', 'LineWidth', 1,'DisplayName','BP with Blind updates');


    averageblindWP = mean(blindWP, 3);
    stdblindWP = std(blindWP, [], 3);
    curve1 = (averageblindWP + stdblindWP);
    curve2 = (averageblindWP - stdblindWP);
    
    inBetweenblindWP = [curve1.', fliplr(curve2.')];
    hold on;
    fill(x2, inBetweenblindWP, 'g','LineStyle','none', FaceAlpha = 0.2);
    hold on;
    plot(epochs, averageblindWP, 'g^--', 'LineWidth', 1,'DisplayName','WP with Blind updates');

    averageawareBP = mean(awareBP, 3);
    stdbawareBP = std(awareBP, [], 3);
    curve1 = (averageawareBP + stdbawareBP);
    curve2 = (averageawareBP - stdbawareBP);
    
    inBetweenawareBP = [curve1.', fliplr(curve2.')];
    hold on;
    fill(x2, inBetweenawareBP, 'b','LineStyle','none', FaceAlpha = 0.2);
    hold on;
    plot(epochs, averageawareBP, 'bo--', 'LineWidth', 1,'DisplayName','BP with Aware updates');
    legend;
    savefig("C:\Users\HP\Downloads\plotsForPaper\matlab\SubSampled_Var_"+string(SigmaVal(sigIndex))+"mV.fig")
end