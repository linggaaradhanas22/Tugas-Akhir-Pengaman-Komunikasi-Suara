%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                          %
%          Generated by MATLAB 24.1 and Fixed-Point Designer 24.1          %
%                                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [power,Q1_squared,Q2_squared,Q1_squared_plus_Q2_squared,coeff_Q1,coeff_Q1_Q2] = ComputeGoertzelPower_wrapper_fixpt(Q1,Q2,coeff)
    fm = get_fimath();
    Q1_in = fi( Q1, 1, 16, 3, fm );
    Q2_in = fi( Q2, 1, 16, 3, fm );
    coeff_in = fi( coeff, 0, 16, 15, fm );
    [power_out,Q1_squared_out,Q2_squared_out,Q1_squared_plus_Q2_squared_out,coeff_Q1_out,coeff_Q1_Q2_out] = ComputeGoertzelPower_fixpt( Q1_in, Q2_in, coeff_in );
    power = double( power_out );
    Q1_squared = double( Q1_squared_out );
    Q2_squared = double( Q2_squared_out );
    Q1_squared_plus_Q2_squared = double( Q1_squared_plus_Q2_squared_out );
    coeff_Q1 = double( coeff_Q1_out );
    coeff_Q1_Q2 = double( coeff_Q1_Q2_out );
end

function fm = get_fimath()
	fm = fimath('RoundingMethod', 'Round',...
	     'OverflowAction', 'Saturate',...
	     'ProductMode','FullPrecision',...
	     'SumMode','FullPrecision');
end
