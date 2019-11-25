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


