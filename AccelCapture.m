% ADALM1000 + ADXL327 data capture
clear
clc

ADIDevices = daq.getDevices;
ADISession = daq.createSession('adi');

addAnalogInputChannel(ADISession,'smu1','a','Voltage');
addAnalogInputChannel(ADISession,'smu1','b','Voltage');

%User Defined Properties 
plotTitle = 'Data Log';             % plot title
xLabel = 'Elapsed Time (s)';        % x-axis label
yLabel = 'Acceleration';            % y-axis label
legendx = 'Acceleration(x)';
legendy = 'Acceleration(y)';

yMax  = 2;                          %y Maximum Value
yMin  = 0;                          %y minimum Value

plotGrid = 'on';                    % 'off' to turn off grid
max = yMax;                       	% set y-max
min = yMin;                         % set y-min
delay = .0001;                      % make sure sample faster than resolution 

%Define Function Variables
t = 0;
X = 0;
Y = 0;
n = 0;

%Set up Plot
gx = plot(t, X,'-r' );              % every AnalogRead needs to be on its own Plotgraph
hold on;                            % hold on makes sure all of the channels are plotted
gy = plot(t, Y,'-b');

title(plotTitle, 'FontSize', 15);
xlabel(xLabel, 'FontSize', 15);
ylabel(yLabel, 'FontSize', 15);
legend(legendx, legendy)
axis([yMin yMax min max]);
grid(plotGrid);

tic

W = 200;
% t = zeros(1, W);
% X = zeros(1, W);
% Y = zeros(1, W);

while ishandle(gx)                  % Loop when Plot is Active will run until plot is closed
    accl = inputSingleScan(ADISession);
    x = accl(1);
    y = accl(2);
    
    n = n + 1;    
    t(n) = toc;    
    X(n) = x;         
    Y(n) = y;
    
    %This is the magic code 
    %Using plot will slow down the sampling time.. At times to over 20
    %seconds per sample!
    set(gx, 'XData', t, 'YData', X);
    set(gy, 'XData', t, 'YData', Y);
    
    xMin = 0;
    xMax = t(n);
    if (n > W)
        xMin = t(n - W);
    end
    axis([xMin xMax min max]);
    
    %Update the graph
    pause(delay);
end

clear ADISession

disp('Plot and ADISession is Closed');
