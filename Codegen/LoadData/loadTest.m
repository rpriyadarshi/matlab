function data = loadTest()
% https://www.mathworks.com/matlabcentral/answers/49900-how-to-make-codegen-concatenate-strings
% https://stackoverflow.com/questions/39139904/how-can-i-initialize-variables-at-runtime-using-the-matlab-coder

data = loadBuiltin('datafile.mat');
%data = loadCoderBuiltin('datafile.mat');
%data = loadFopen('datafile.mat');

end

