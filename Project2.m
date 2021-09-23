load('Project2_PresetVariables.mat');

control = data(1: N1);
experimental = data(N1 + 1: end);
N2 = length(experimental);

controlMean = mean(control);
controlMode = mode(control);
controlMedian = median(control);
controlStdDev = std(control);

experimentalMean = mean(experimental);
experimentalMode = mode(experimental);
experimentalMedian = median(experimental);
experimentalStdDev = std(experimental);

deno = sqrt((controlStdDev^2 / N1) + (experimentalStdDev^2 / N2));
pvalue = (controlMean - experimentalMean) / deno;

pooledSD = sqrt((controlStdDev ^ 2 + experimentalStdDev ^ 2) / 2);

effectSize = (controlMean - experimentalMean) / pooledSD;

disp('Group Stats');
disp(sprintf('The control group has %d participants.', N1));