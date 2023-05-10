%uncorrelated case
wOGUnCor = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\uncorRevWeights\30mV\ogW.csv");
wAsymUnCor = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\uncorRevWeights\30mV\Wvar.csv");
wAsymRevUnCor = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\uncorRevWeights\30mV\Wasym.csv");
figure()
plot(wAsymUnCor, wAsymRevUnCor, 'r.')
hold on;
plot(-3:0.01:3, -3:0.01:3, 'b-')
title("W_B(yaxis) vs W_F(xaxis) uncorrelated (\sigma_B = 30mV)")


%correlated case 
wOGCor = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\finalCorrelelatedWeights\rho=0.9\ogW.csv");
wAsymCor = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\finalCorrelelatedWeights\rho=0.9\Wvar.csv");
wAsymRevCor = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\finalCorrelelatedWeights\rho=0.9\Wasym.csv");
figure()
plot(wAsymCor, wAsymRevCor, 'r.')
hold on;
plot(-6:0.01:6, -6:0.01:6, 'b-')
title("W_B(yaxis) vs W_F(xaxis) correlated rho = 0.9 \sigma=30mV")


%voltagesUNcorrelatedbackvs for
Vthforward = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\uncorRevWeights\VthForward.csv");
Vthbackward = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\uncorRevWeights\VthBackward.csv");
figure()
plot(Vthforward, Vthbackward, 'r.')
hold on;
plot(0.5:0.01:0.9, 0.5:0.01:0.9, 'b-')
title("Uncorrelated  \sigma = 30mV")

%voltagescorrelatedbackvs for
Vthforward = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\finalCorrelelatedWeights\rho=0.9\VthForward.csv");
Vthbackward = csvread("D:\perturbation_on_chip_learning\Perturbation-techniques-in-CNNs\dataforpaper\finalCorrelelatedWeights\rho=0.9\VthBackward.csv");
figure()
plot(Vthforward, Vthbackward, 'r.')
hold on;
plot(0.5:0.01:0.9, 0.5:0.01:0.9, 'b-')
title("Correlated \rho = 0.9 \sigma = 30mV")