clear;clc;
load Sample_7
Threshold=1000;
Data=Orig_Sig;
figure(1);
subplot(2,1,1)
plot(Data);
xlim([0 3600]);
hold on
plot([0,length(Data)],[Threshold,Threshold]);
hold off
Data=highpass(Data,pi)
Data(Data<Threshold)=Threshold;
subplot(2,1,2)
plot(Data);
[n,m]=findpeaks(Data);
xlim([0 3600]);
ylim([800 1500]); 