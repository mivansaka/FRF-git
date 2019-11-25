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
[indx,tf] = listdlg('ListString',list,'name','Data Selection','SelectionMode','single','ListSize',[350 250])
data_name = [];
switch indx
    case '1'
        data_name = [data_name x10HzHealthy];
end
%assignment to variables
%time is the same frequence,only choose one
time = x10HzHealthy{:,1};
%%AI1 is the Accelerometer signal and recovery gained value
AI0 = data_name{:,2}/24;
AI1 = data_name{:,3}/24;

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
plot(time,d)

%basic fast fourier transform
FAI1 = fft(AI1);
subplot(3,1,3);
plot(time,abs(FAI1));
axis([0 3e+7 0 600]);
    %label plot
title('Frequency domain image');
xlabel('Frequency(Hz)');
ylabel('Amplitude');

