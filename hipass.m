function Hd = hipass
%HIPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.4 and Signal Processing Toolbox 8.0.
% Generated on: 07-Dec-2019 13:05:21

% Equiripple Highpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 5000;  % Sampling Frequency

N     = 10;      % Order
Fstop = 0.5;     % Stopband Frequency
Fpass = 2500;    % Passband Frequency
Wstop = 0.0001;  % Stopband Weight
Wpass = 1;       % Passband Weight
dens  = 20;      % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fstop Fpass Fs/2]/(Fs/2), [0 0 1 1], [Wstop Wpass], ...
           {dens});
Hd = dfilt.dffir(b);

% [EOF]
