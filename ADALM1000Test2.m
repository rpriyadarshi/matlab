clear;
clc;

d = daq.getDevices;
s = daq.createSession('adi');

addAnalogOutputChannel(s,'smu1','a','Voltage');
addAnalogInputChannel(s,'smu1','b','Voltage');

k = 5;                  % Number of waves
fy = 1;             	% Signal frequency in Hz
wy = 2 * pi * fy;       % Signal frequency in radians/sec
fs = 60;                % Sampling frequency in Hz
tiv = 1 / fs;           % Time interval between samples
t = 0:tiv:(fy*k);       % Time interval set
y = sin(wy * t);        % Signal data set
y = y + 1;              % Shift for positive voltage output

v = zeros(length(t), 1);

for i=1:length(t)
    outputSingleScan(s, y(i));
    v(i) = inputSingleScan(s);
end

plot(t, y);
hold on;
plot(t, v);

clear s;

