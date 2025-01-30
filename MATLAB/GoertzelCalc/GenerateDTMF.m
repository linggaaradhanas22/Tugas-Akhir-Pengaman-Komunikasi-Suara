clear all;

% Parameters
Fs = 32000;  % Sampling frequency (32 kHz)
duration = 10;  % Total duration in seconds
amplitude = 0.5;  % Amplitude of the signal (to avoid clipping)

% Calculate samples for different time segments
initial_silence_samples = round(0.05 * Fs);  % 50ms
hash_samples = round(0.04 * Fs);  % 40ms
three_samples = round(0.02 * Fs);  % 20ms
hash_short_samples = round(0.02 * Fs);  % 20ms
silence_samples = round(1.0 * Fs);  % 1s

% Calculate total samples needed
total_samples = Fs * duration;

% Create time vector for the entire duration
t = (0:total_samples-1) / Fs;

% Create impulse signal for tone generation
x = zeros(1, total_samples);
x(1) = 1;

% Generate DTMF tones using filter
% Low frequencies
y697 = filter([0 sin(2*pi*697/Fs)], [1 -2*cos(2*pi*697/Fs) 1], x);  % for '3'
y941 = filter([0 sin(2*pi*941/Fs)], [1 -2*cos(2*pi*941/Fs) 1], x);  % for '#'

% High frequency
y1477 = filter([0 sin(2*pi*1477/Fs)], [1 -2*cos(2*pi*1477/Fs) 1], x);  % for both '3' and '#'

% Initialize output signal
output = zeros(1, total_samples);

% Create DTMF tones
hash_tone = amplitude * (y1477 + y941);  % '#' tone
three_tone = amplitude * (y1477 + y697);  % '3' tone

% Initial pattern (happens once)
current_sample = initial_silence_samples;

% First '#' (40ms)
output(current_sample+1 : current_sample+hash_samples) = hash_tone(1:hash_samples);
current_sample = current_sample + hash_samples;

% First '3' (20ms)
output(current_sample+1 : current_sample+three_samples) = three_tone(1:three_samples);
current_sample = current_sample + three_samples;

% First '#' short (20ms)
output(current_sample+1 : current_sample+hash_short_samples) = hash_tone(1:hash_short_samples);
current_sample = current_sample + hash_short_samples;

% First silence (1s)
current_sample = current_sample + silence_samples;

% Repeating pattern
pattern_length = hash_samples + three_samples + hash_short_samples + silence_samples;

while current_sample + pattern_length <= total_samples
    % '#' (40ms)
    output(current_sample+1 : current_sample+hash_samples) = hash_tone(1:hash_samples);
    current_sample = current_sample + hash_samples;
    
    % '3' (20ms)
    output(current_sample+1 : current_sample+three_samples) = three_tone(1:three_samples);
    current_sample = current_sample + three_samples;
    
    % '#' short (20ms)
    output(current_sample+1 : current_sample+hash_short_samples) = hash_tone(1:hash_short_samples);
    current_sample = current_sample + hash_short_samples;
    
    % Silence (1s)
    current_sample = current_sample + silence_samples;
end

% Convert to 16-bit signed integer
output_int16 = int16(output * 32767);

% Write to WAV file
audiowrite('dtmf_sequence.wav', output_int16, Fs, 'BitsPerSample', 16);

% Save variables for plotting
save('dtmf_data.mat', 't', 'output', 'Fs');