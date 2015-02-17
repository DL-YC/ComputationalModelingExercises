% ---------------------------------
% Problem Set 2, Question 4, Part D
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function [simRhinoToSquirrel, simSquirrelToRhino] = findRhinoAndSquirrelSim(theta, alpha, beta)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% YOUR CODE HERE (replace the [] with your answer, and note that
% you may need more than one line of code!)

load 50animalbindat;

squirrel = data(27,:);

rhino = data(28,:);

simRhinoToSquirrel = theta * commonFeatures(rhino,squirrel) - alpha * differences(rhino,squirrel) - beta * differences(squirrel,rhino)

simSquirrelToRhino = theta * commonFeatures(squirrel,rhino) - alpha * differences(squirrel,rhino) - beta * differences(rhino,squirrel)

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end