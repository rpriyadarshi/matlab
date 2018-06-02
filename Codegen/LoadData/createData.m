function data = createData()
    data.bearing.sr = 97656;
    data.bearing.gs = [0.8315881; 0.0387017; 0.4676445; 0.6616452; ...
        1.770335; 1.523985; 1.916429; 0.5592487; 0.3270139; -1.082491];
    data.bearing.load = 270;
    data.bearing.rate = 25;
    save('datafile.mat', 'data');
end

