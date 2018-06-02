function data = loadFopen(filename) %#codegen
    fid = fopen(filename,'r');
    data = fread(fid, Inf, 'double');
    fclose(fid);
end
