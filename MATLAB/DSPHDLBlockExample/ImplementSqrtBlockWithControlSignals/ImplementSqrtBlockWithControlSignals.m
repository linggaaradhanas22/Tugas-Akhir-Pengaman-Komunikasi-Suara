%% Open and Run the Simulink Model
% Specify the input data as a linear sweep. You can change these values according to your requirements.
SQRT_input = fi(1/2^17:1/2^17:1,0,18,17)';

%%
% Specify the word length for fixed-point datatypes and the latency for the model. For more information on the latency calculation, see <docid:hdlcoder_ref#mw_2252fa48-be02-4b7e-b6db-8d10ee508f45 Sqrt>. 
WL = 18;  latency = 20;

%%
% Open the |hdlcoder_sqrt_bitset_control| model and specify a stop time sufficient to process all the input combinations.
stoptime = length(SQRT_input)-1+latency;
open_system('my_hdlcoder_sqrt_bitset_control')
sim('my_hdlcoder_sqrt_bitset_control')

%% Validate Simulink Output by Using Reference Output
% To validate the output of the Simulink model, compare this output to a reference values. To obtain the
% reference values, use the <docid:matlab_ref#bu57a5h> function. Compute the reference output by using the |sqrt| function.
ref_SQRT = sqrt(double(SQRT_input));

%%
% Use logical indexing to extract valid output.
implementation_SQRT = simulink_SQRT(valid_output);

%%
% Plot the comparison results by using the
% |comparison_plot_sqrt| function. The maximum error value is significantly
% smaller than the output of the model.
comparison_plot_sqrt(ref_SQRT,implementation_SQRT,1,'SQRT linear input');

%% Generate HDL Code for Square Root Implementation
% Check the HDL settings saved of the model by using the |hdlsaveparams| function.
hdlsaveparams('my_hdlcoder_sqrt_bitset_control')

%%
% To generate HDL code for the Sqrt block in the model, use the |makehdl|
% function.
%
  makehdl('my_hdlcoder_sqrt_bitset_control/Sqrt')
  close_system('my_hdlcoder_sqrt_bitset_control')
  close all;