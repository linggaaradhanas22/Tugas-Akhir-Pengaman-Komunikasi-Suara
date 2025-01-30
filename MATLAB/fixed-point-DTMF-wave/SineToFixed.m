% MATLAB script to generate a 697 Hz sinusoid and convert it to 16-bit fixed-point format

%% Parameter Configuration
Fs = 16000; % Sampling Frequency
duration = 0.020; % Duration for each tone
N = Fs * duration; % Number of samples
t = (0:N-1) / Fs; % Create a time vector

%% DTMF Sample creation
x = zeros(1,length(t)); 
x(1) = 1; % Impulse function for generating tones

% Generate tones using filter function
y697 = filter([0 sin(2*pi*697/Fs)], [1 -2*cos(2*pi*697/Fs) 1], x);  
y770 = filter([0 sin(2*pi*770/Fs)], [1 -2*cos(2*pi*770/Fs) 1], x);  
y852 = filter([0 sin(2*pi*852/Fs)], [1 -2*cos(2*pi*852/Fs) 1], x);  
y941 = filter([0 sin(2*pi*941/Fs)], [1 -2*cos(2*pi*941/Fs) 1], x);  
y1209 = filter([0 sin(2*pi*1209/Fs)], [1 -2*cos(2*pi*1209/Fs) 1], x);  
y1336 = filter([0 sin(2*pi*1336/Fs)], [1 -2*cos(2*pi*1336/Fs) 1], x);  
y1477 = filter([0 sin(2*pi*1477/Fs)], [1 -2*cos(2*pi*1477/Fs) 1], x);

% Example tone: y697 + y1209 (digit 1)
xDTMF = y697 + y1209;

% Fixed-point parameters
wordLength = 16;    % Total number of bits
signed = true;      % Use signed numbers
fractionLength = 14; % Number of fractional bits (Q15 format)

% Convert to fixed-point format
xDTMF_fixed = fi(xDTMF, signed, wordLength, fractionLength);

% Optional: Retrieve quantized values and compute error
xDTMF_quantized = double(xDTMF_fixed);
quantization_error = xDTMF - xDTMF_quantized;
max_error = max(abs(quantization_error));

% Display the maximum quantization error
fprintf('Maximum quantization error: %e\n', max_error);

% Plot the original and quantized signals for comparison
figure;
subplot(2,1,1);
plot(t, xDTMF);
title('Original signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, xDTMF_quantized);
title('Quantized Sinusoid (Fixed-Point)');
xlabel('Time (s)');
ylabel('Amplitude');

% Save the fixed-point data in binary format to a .txt file
% Get the integer representation of the fixed-point numbers
xDTMF_fixed_int = xDTMF_fixed.int;

% Convert integer values to binary strings
bin_values = dec2bin(xDTMF_fixed_int, wordLength);

% Open a file for writing
filename = 'dtmf_fixed_point_binary.txt';
fileID = fopen(filename, 'w');

% Write each binary value to the file
for i = 1:size(bin_values, 1)
    fprintf(fileID, '%s\n', bin_values(i,:));
end

% Close the file
fclose(fileID);
