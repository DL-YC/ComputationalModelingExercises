% ---------------------------------
% Problem Set 1, Question 1, Part B
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function [animals] = findAnimalsWithFeature(featureName, features, data)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% YOUR CODE HERE (replace the [] with your answer, and note that
% you may need more than one line of code!)

featureIndex = find(strcmp(featureName,features));

animals = transpose(data(:,featureIndex));

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end
