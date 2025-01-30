%% About the test bench
% Filename: GoertzelCalc_tb

%% Parameter Configuration
Fs = 32000; % Sampling Frequency
duration = 0.020; % Duration for each tone
N = Fs * duration; % Number of samples
t = (0:N-1) / Fs; % Create a time vector

% Create coeff based on N and DTMF Frequency
    % Calculate k for each frequency
    k697 = round(0.5 + (N*697)/Fs);
    k770 = round(0.5 + (N*770)/Fs);
    k852 = round(0.5 + (N*852)/Fs);
    k941 = round(0.5 + (N*941)/Fs);
    k1209 = round(0.5 + (N*1209)/Fs);
    k1336 = round(0.5 + (N*1336)/Fs);
    k1477 = round(0.5 + (N*1477)/Fs);
    
    % Calculate coeff
    coeff697 = 2*cos(2*pi*k697/N);
    coeff770 = 2*cos(2*pi*k770/N);
    coeff852 = 2*cos(2*pi*k852/N);
    coeff941 = 2*cos(2*pi*k941/N);
    coeff1209 = 2*cos(2*pi*k1209/N);
    coeff1336 = 2*cos(2*pi*k1336/N);
    coeff1477 = 2*cos(2*pi*k1477/N);

    % Create a table for the coefficient values
coeffTable = table(coeff697, coeff770, coeff852, coeff941, coeff1209, coeff1336, coeff1477, ...
'VariableNames', {'Coeff_697', 'Coeff_770', 'Coeff_852', 'Coeff_941', 'Coeff_1209', 'Coeff_1336', 'Coeff_1477'});

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

% Input tone
xDTMF = y697 + y1209;

%% Define the Goertzel processing function
function [Q0_history, Q1_history, Q2_history, coeff_Q1_history, power_results] = processGoertzelForFreq(xDTMF, coeff, N, t, freq)
    % Initialize arrays to store Q values at each iteration
    Q0_history = zeros(1, N);
    Q1_history = zeros(1, N);
    Q2_history = zeros(1, N);
    coeff_Q1_history = zeros(1, N);
    x_min_Q2_history = zeros(1, N);

    % Process each sample using GoertzelCalc
    for n = 1:N
        [coeff_Q1, x_min_Q2, Q0, Q1, Q2] = ComputeGoertzelPower_wrapper_fixpt_mex('GoertzelCalc_wrapper_fixpt', xDTMF(1:n), coeff);
        
        % Store Q values and intermediate results
        Q0_history(n) = Q0;
        Q1_history(n) = Q1;
        Q2_history(n) = Q2;
        coeff_Q1_history(n) = coeff_Q1;
        x_min_Q2_history(n) = x_min_Q2;
    end

    % Calculate the power value
    [power, Q1_squared, Q2_squared, Q1_squared_plus_Q2_squared, coeff_Q1, coeff_Q1_Q2] = ...
        ComputeGoertzelPower_wrapper_fixpt_mex('ComputeGoertzelPower_wrapper_fixpt', Q1, Q2, coeff);
    
    % Store power results in a structure
    power_results = struct('power', power, ...
                          'Q1_squared', Q1_squared, ...
                          'Q2_squared', Q2_squared, ...
                          'Q1_squared_plus_Q2_squared', Q1_squared_plus_Q2_squared, ...
                          'coeff_Q1', coeff_Q1, ...
                          'coeff_Q1_Q2', coeff_Q1_Q2);

    % Plot the results
    figure('Name', sprintf('Goertzel Filter Q Outputs for %d Hz', freq));
    
    % Plot Q0 history
    subplot(4,1,1);
    plot(t, Q0_history, 'b-');
    title(sprintf('Q0 Output (%d Hz)', freq));
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;

    % Plot Q1 history
    subplot(4,1,2);
    plot(t, Q1_history, 'r-');
    title(sprintf('Q1 Output (%d Hz)', freq));
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;

    % Plot Q2 history
    subplot(4,1,3);
    plot(t, Q2_history, 'g-');
    title(sprintf('Q2 Output (%d Hz)', freq));
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    
    % Plot coeff_Q1 history
    subplot(4,1,4);
    plot(t, coeff_Q1_history, 'm-');
    title(sprintf('coeff_Q1 Output (%d Hz)', freq));
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
end

%% Process all DTMF frequencies
% Define frequencies and coefficients arrays
freqs = [697, 770, 852, 941, 1209, 1336, 1477];
coeffs = [coeff697, coeff770, coeff852, coeff941, coeff1209, coeff1336, coeff1477];

% Initialize cell arrays to store results
all_Q0_histories = cell(1, length(freqs));
all_Q1_histories = cell(1, length(freqs));
all_Q2_histories = cell(1, length(freqs));
all_coeff_Q1_histories = cell(1, length(freqs));
all_power_results = cell(1, length(freqs));

% Process each frequency
for i = 1:length(freqs)
    [Q0_hist, Q1_hist, Q2_hist, coeff_Q1_hist, power_res] = processGoertzelForFreq(xDTMF, coeffs(i), N, t, freqs(i));
    all_Q0_histories{i} = Q0_hist;
    all_Q1_histories{i} = Q1_hist;
    all_Q2_histories{i} = Q2_hist;
    all_coeff_Q1_histories{i} = coeff_Q1_hist;
    all_power_results{i} = power_res;
end

% Create a table with power results for all frequencies
freq_powers = zeros(1, length(freqs));
for i = 1:length(freqs)
    freq_powers(i) = all_power_results{i}.power;
end

% Create and display power comparison table
power_comparison = array2table(freq_powers, ...
    'VariableNames', cellstr(strcat('Freq_', string(freqs))));
disp('Power comparison across all frequencies:');
disp(power_comparison);

% Create a comprehensive results table
timePoints = t';  % Transpose to make it a column
results_table = table(timePoints, 'VariableNames', {'Time'});

% Add Q values and coeff_Q1 for each frequency to the table
for i = 1:length(freqs)
    freq_str = num2str(freqs(i));
    results_table.(['Q0_' freq_str]) = all_Q0_histories{i}';
    results_table.(['Q1_' freq_str]) = all_Q1_histories{i}';
    results_table.(['Q2_' freq_str]) = all_Q2_histories{i}';
    results_table.(['coeff_Q1_' freq_str]) = all_coeff_Q1_histories{i}';
end