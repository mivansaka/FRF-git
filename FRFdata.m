%this m file is for process the FRF data
%read the Raw data file to workspace
load RawData.mat
x10HzHealthy = table2array(x10HzHealthy);
x10HzUnhealthy = table2array(x10HzUnhealthy);
x17HzHealthy = table2array(x17HzHealthy);
x17HzUnhealthy = table2array(x17HzUnhealthy);
%remember to import data to workspace

%choose the analysis data
list = {'x10HzHealthy','x10HzUnhealthy','x17HzHealthy','x17HzUnhealthy'};
[indx,tf] = listdlg('ListString',list,'name','Data Selection','SelectionMode','single','ListSize',[350 250]);
%assignment to variables
switch indx
    case 1
        time = x10HzHealthy(:,1);
        AI0 = x10HzHealthy(:,2)/24;
        AI1 = x10HzHealthy(:,3)/24;
    case 2
        time = x10HzUnhealthy(:,1);
        AI0 = x10HzUnhealthy(:,2)/24;
        AI1 = x10HzUnhealthy(:,3)/24;
    case 3
        time = x17HzHealthy(:,1);
        AI0 = x17HzHealthy(:,2)/24;
        AI1 = x17HzHealthy(:,3)/24;
    case 4
        time = x17HzUnhealthy(:,1);
        AI0 = x17HzUnhealthy(:,2)/24;
        AI1 = x17HzUnhealthy(:,3)/24;
end

%initialize parameters
samplerate = 5000;  %in Hz
N = numel(time);    %number of points

%use filterDesigner to create the filterDesigner
Hd = HzFDF;

%plot the origin data plot
figure;
grid on;
subplot(3,1,1);
plot(time,AI1);
axis([0 6e+7 -0.1 0.2]);
    %label plot
title('Time domain image');
xlabel('Time(s)');
ylabel('Voltage');

%pass signals through a 0.5Hz high-pass fliter
d = filter(Hd,AI1);
subplot(3,1,2);
plot(time,d);
axis([0 6e+7 -0.1 0.2]);
    %label plot
title('Time domain image');
xlabel('Time(s)');
ylabel('Voltage');

%basic fast fourier transform
FAI1 = fft(AI1);
subplot(3,1,3);
plot(time,abs(FAI1));
axis([0 3e+7 0 600]);
    %label plot
title('Frequency domain image');
xlabel('Frequency(Hz)');
ylabel('Amplitude');

