% ---------------------------------
% Problem Set 5, Question 2 Part B
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------
%
% file: plotMSE.m
%       generate a single plot of MSE vs. polynomial degree for traindata and
%       testdata. 
% input:
%   MSE: 9x2 matrix of MSE values calculated in findMSE.m
%
% output:
%   msePlot: a plot structure containing information about the plot of 
%       MSE vs. polynomial degree for traindata and testdata. MAKE SURE TO 
%       SAVE YOUR PLOT AS A JPEG NAMED msePlot.jpg 
%

function [msePlot] = plotMSE(MSE)


% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
k = 0:8;
MSE
msePlot = plot(k,MSE(:,1)','r',k,MSE(:,2)','b'); % YOUR ANSWER HERE
title('Mean Squared Error versus Degree of Polynomial');
xlabel('Degree of Polynomial');
ylabel('Mean Squared Error');
legend('Training Data','Test Data');


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

msePlot = get(msePlot);

end