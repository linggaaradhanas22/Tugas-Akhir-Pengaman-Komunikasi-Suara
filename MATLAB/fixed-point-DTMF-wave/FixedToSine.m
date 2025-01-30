% MATLAB script to read binary data from 'sinusoid_fixed_point_binary.txt' and plot the corresponding data

% Parameters
wordLength = 16;        % Total number of bits
fractionLength = 15;    % Number of fractional bits (Q15 format)

% Read the binary data from the text file
filename = 'sinusoid_fixed_point_binary.txt';

% Open the file for reading
fileID = fopen(filename, 'r');

% Read all binary strings into a cell array
bin_values = textscan(fileID, '%s');

% Close the file
fclose(fileID);

% Extract the cell array of binary strings
bin_values = bin_values{1};

% Number of samples
num_samples = length(bin_values);

% Initialize array to store the reconstructed fixed-point values
x_reconstructed = zeros(num_samples, 1);

% Loop over each binary string to convert back to fixed-point values
for i = 1:num_samples
    bin_str = bin_values{i};
    
    % Convert binary string to unsigned 16-bit integer
    u_int16 = uint16(bin2dec(bin_str));
    
    % Interpret the unsigned integer as a signed 16-bit integer
    s_int16 = typecast(u_int16, 'int16');
    
    % Convert to fixed-point value by scaling with the fraction length
    x_reconstructed(i) = double(s_int16) / 2^fractionLength;
end

% Generate time vector for plotting
fs = 16000;              % Sampling frequency in Hz
duration = 0.02;        % Duration in seconds (20 ms)
N = fs * duration;      % Number of samples
t = (0:N-1) / fs;       % Time vector

% Plot the reconstructed data
figure;
plot(t, x_reconstructed);
title('Reconstructed Sinusoid from Binary Data');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
