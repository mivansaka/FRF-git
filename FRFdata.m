%this m file is for process the FRF data
%read the Raw data file to workspace
load RawData.mat
%remember to import data to workspace

%assignment to variables
%time is the same frequence,only choose one
%AI1 is the Accelerometer signal
time = x10HzHealthy{:,1};
%recovery gained value
AI0 = x10HzHealthy{:,2}/24;
AI1 = x10HzHealthy{:,3}/24;

%plot the origin data plot
figure;
grid on;
subplot(2,1,1);
plot(time,AI1);
axis([0 6e+7 -0.1 0.2]);
    %label plot
title('Time domain image');
xlabel('Time(s)');
ylabel('Voltage');
%basic fast fourier transform
FAI1 = fft(AI1);
subplot(2,1,2);
plot(time,abs(FAI1));
axis([0 3e+7 0 600]);
    %label plot
title('Frequency domain image');
xlabel('Frequency(Hz)');
ylabel('Amplitude');

