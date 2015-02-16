% -------------------------
% Problem Set 1, Question 3
% -------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function [answers] = productionSystemsUpdated()

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% For each variable below, replace the [] with a value that reflects
% the state of the supplied variable. Make sure not to delete any of
% the commas, or you will get an syntax error!
%
% Use the following conventions when defining the variables:
%
% 1 = TRUE
% 0 = FALSE
% NaN = Cannot determine the state with given information

% Part A. Given that you observe the switch is flipped, enter the
% values for the variables below:
sprinklerIsOnA = [1];
grassIsWetA = [0];
carIsWetA = [NaN];
pathSlipperyA = [NaN];
    
% Part B. Given that you observe that the path is slippery, enter values
% for each variable below:

switchIsFlippedB = [NaN];
itRainedB = [1];

% Part C. Given that you observe the path is slippery, enter the values
% indicating the state of each variable below:

carIsWetC1 = [1];
grassIsWetC1 = [1];
itRainedC1 = [1];
switchIsFlippedC1 = [NaN];
sprinklerIsOnC1 = [NaN];

% If instead of observing that the path is slippery you observe that the 
% sprinkler is on, enter the values indicating the state of each variable below:

switchIsFlippedC2 = [1];
carIsWetC2 = [NaN];
itRainedC2 = [NaN];
grassIsWetC2 = [1];
pathSlipperyC2=[NaN];

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

answers = struct('sprinklerIsOnA',sprinklerIsOnA,'grassIsWetA',grassIsWetA,'carIsWetA',carIsWetA,...
	'pathSlipperyA',pathSlipperyA,'switchIsFlippedB',switchIsFlippedB,'itRainedB',itRainedB,...
	'carIsWetC1',carIsWetC1,'grassIsWetC1',grassIsWetC1,'itRainedC1',itRainedC1,...
	'switchIsFlippedC1',switchIsFlippedC1,'sprinklerIsOnC1',sprinklerIsOnC1,'switchIsFlippedC2',switchIsFlippedC2,...
	'carIsWetC2',carIsWetC2,'itRainedC2',itRainedC2,'grassIsWetC2',grassIsWetC2,'pathSlipperyC2',pathSlipperyC2);

end
