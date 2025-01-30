function [Error]=comparison_plot_sqrt(reference,comparison,figure_number,textstring)
%

%   Copyright 2020 The MathWorks, Inc.

% make signals same length
v=1:min(length(reference),length(comparison));
reference=reference(v);
comparison=comparison(v);

% compute error
Error=reference-comparison;
PctError=Error./reference*100;

% plot results
figure(figure_number)
hold on
plot(reference,'b');
plot(Error,'r');
hold off
legend('Reference','Error')
grid on
title(textstring)

% display maximum error
fprintf('Maximum Error %s %d \n',textstring,max(abs(Error)))
fprintf('Maximum PctError %s %d \n',textstring,max(abs(PctError)))