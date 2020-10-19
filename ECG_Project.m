clear;
clc;
load Sample_1;

threshold=1000;
rawData=Orig_Sig;
numSamples = length(rawData);

% render rawData
figure(1);
subplot(3,1,1);
xlim([0 numSamples]); % rawData contains 360*10s samples
plot(rawData);

% plot threshold line
hold on
plot([0, numSamples],[threshold, threshold]);
hold off

% only keep y values above threshold
aboveThresholdData = rawData;
aboveThresholdData(aboveThresholdData < threshold) = threshold;
subplot(3,1,2);
plot(aboveThresholdData);

% count numHeartBeats as number of peaks
[y,x]=findpeaks(aboveThresholdData);
subplot(3,1,3);
plot(x,y); 
numPeaks = size(y,1);
heartRate=(numPeaks * 60) / 10; % 60s in a min, 10s of samples
disp("Heart Rate is : " + heartRate + " Beats/Min");



