clear;
clc;
load Sample_8
Threshold=1000;
Data=Orig_Sig;
MedianValue = median(Data,1)
figure(1);
subplot(2,1,1)
plot(Data);
xlim([0 3600]);
hold on
plot([0,length(Data)],[Threshold,Threshold]);
plot([0,length(Data)],[MedianValue,MedianValue]);
hold off
%%Data(Data<Threshold)=Threshold;
%%SmoothData = movmean(Data,45)
FftData = fft(Data)
subplot(2,1,2)
plot(FftData);
[n,m]=findpeaks(FftData);
xlim([0 3600]);
ylim([800 1500]);  
peaks = size(n,1);
Heart_Rate=(peaks*60)/10;
disp("Heart Rate is : "+Heart_Rate+" Beats/Min");