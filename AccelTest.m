clear;
clc;

ADIDevices = daq.getDevices;
ADISession = daq.createSession('adi');

addAnalogInputChannel(ADISession,'smu1','a','Voltage');
addAnalogInputChannel(ADISession,'smu1','b','Voltage');

v = 0:1:1000;

for i=1:length(v)
    accl = inputSingleScan(ADISession);
    x(i) = accl(1);
    y(i) = accl(2);
end

% Plot the measured data 
plot(v, x);
hold on;
plot(v, y);

clear ADISession
