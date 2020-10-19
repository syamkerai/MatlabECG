clear;
clc;
load Sample_3;

threshold=1000;
rawData=Orig_Sig;
numSamples = length(rawData);
maxValue = max(rawData);
minValue = min(rawData);


% render rawData
figure(1);
subplot(3,1,1);
plot(rawData);
title('raw data')
xlim([0 numSamples]);
ylim([minValue maxValue]);


% plot threshold line
hold on
plot([0, numSamples],[threshold, threshold]);
xlim([0 numSamples]);
ylim([minValue maxValue]);
hold off

% only keep y values above threshold
aboveThresholdData = rawData;
aboveThresholdData(aboveThresholdData < threshold) = threshold;
subplot(3,1,2);
plot(aboveThresholdData);
title('thresholded');
xlim([0 numSamples]);
ylim([minValue maxValue]);

% count numHeartBeats as number of peaks
[peaksY, peaksX] = findpeaks(aboveThresholdData);
subplot(3,1,3);
plot(rawData);
title('labelled peaks');
hold on
scatter(peaksX, peaksY, 'r'); 
hold off
xlim([0 numSamples]);
ylim([minValue maxValue]);

numPeaks = size(peaksX, 1);
heartRate=(numPeaks * 60) / 10; % 60s in a min, 10s of samples
disp("Heart Rate is : " + heartRate + " Beats/Min");



