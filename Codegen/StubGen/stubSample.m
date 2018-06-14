function outputArg1 = stubSample()
%STUBSAMPLE Summary of this function goes here
%   Detailed explanation goes here

if coder.target('rtw')
    outputArg1 = coder.ceval('stub', 'args');
else
    outputArg1 = stub('args');
end
end

