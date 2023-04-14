%uncorrelated case
wOGUnCor = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\uncorRevWeights\10mV\ogW.csv");
wAsymUnCor = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\uncorRevWeights\10mV\Wvar.csv");
wAsymRevUnCor = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\uncorRevWeights\10mV\Wasym.csv");
figure()
plot(wAsymUnCor, wAsymRevUnCor, 'r.')
hold on;
plot(-3:0.01:3, -3:0.01:3, 'b-')
title("W_B(yaxis) vs W_F(xaxis) uncorrelated (\sigma_B = 10mV)")


%correlated case 
wOGCor = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\corRevWeights\10\ogW.csv");
wAsymCor = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\corRevWeights\10\Wvar.csv");
wAsymRevCor = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\corRevWeights\10\Wasym.csv");
figure()
plot(wAsymCor, wAsymRevCor, 'r.')
hold on;
plot(-6:0.01:6, -6:0.01:6, 'b-')
title("W_B(yaxis) vs W_F(xaxis) correlated (\sigma_B by \mu = 10%)")
