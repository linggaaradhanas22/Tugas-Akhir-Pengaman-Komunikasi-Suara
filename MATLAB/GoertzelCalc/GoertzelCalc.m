function [coeff_Q1, x_min_Q2, Q0, Q1, Q2] = GoertzelCalc(x, coeff)
    % GoertzelFilter - Applies the Goertzel algorithm to a signal x
    % Inputs:
    %   x     : Input signal (ADC samples)
    %   coeff : Goertzel filter coefficient
    % Output:
    %   Q0    : Goertzel output 
    %   Q1    : Delayed version of Q0
    %   Q2    : Delayed version of Q2

    N = length(x); % Get the number of samples
    
    % Initialize the state variables Q0, Q1, and Q2
    Q0 = 0;
    Q1 = 0;
    Q2 = 0;
    coeff_Q1 = 0;
    x_min_Q2 = 0;


    % Loop through the input signal x
    for n = 1:N        
        % Update the state variables
        Q2 (:) = Q1;
        Q1 (:) = Q0;
        
        % Compute multiplication of coeff and Q1
        coeff_Q1 (:) = coeff * Q1;

        % Compute substraction between x and Q2
        x_min_Q2 (:) = x(n) - Q2; 
        
        % Compute Q0 based on the Goertzel algorithm equation
        Q0 (:) = coeff_Q1 + x_min_Q2;


    end
end

