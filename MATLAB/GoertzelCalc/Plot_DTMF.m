clear all;
close all;

% Load the data
load('dtmf_data.mat');

% Create figure with three subplots
figure('Position', [100 100 1200 800]);

% First subplot: Full 10-second waveform
subplot(3,1,1);
plot(t, output);
title('Full DTMF Sequence Waveform (10 seconds)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% Second subplot: First 1.2 seconds (first pattern)
subplot(3,1,2);
zoom_duration = 1.2;
zoom_samples = round(zoom_duration * Fs);
plot(t(1:zoom_samples), output(1:zoom_samples));
title('First Pattern (1.2 seconds)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% Add markers for different sections
hold on;
initial_silence_end = 0.05;
first_hash_end = initial_silence_end + 0.04;
first_three_end = first_hash_end + 0.02;
first_hash_short_end = first_three_end + 0.02;

% Plot vertical lines at transition points
plot([initial_silence_end initial_silence_end], ylim, 'r--');
plot([first_hash_end first_hash_end], ylim, 'g--');
plot([first_three_end first_three_end], ylim, 'b--');
plot([first_hash_short_end first_hash_short_end], ylim, 'm--');
legend('Signal', 'End of Initial Silence', 'End of First #', 'End of 3', 'End of Second #');

% Third subplot: Super zoomed in view (80ms of signal)
subplot(3,1,3);
start_sample = round(0.05 * Fs);  % Start at the end of initial silence
zoom_samples_detailed = round(0.08 * Fs);  % Show 80ms of signal
t_detailed = t(start_sample:start_sample+zoom_samples_detailed);
signal_detailed = output(start_sample:start_sample+zoom_samples_detailed);
plot(t_detailed, signal_detailed);
title('Detailed View of Signal (80ms)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;