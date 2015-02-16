% ---------------------------------
% Problem Set 1, Question 1, Part C
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function [animals] = findAnimals(featureNames, names, features, data)

featureNames = cellstr(featureNames);

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% YOUR CODE HERE (replace the [] with your answer, and note that
% you may need more than one line of code!)

indices = [];

for i = 1:length(featureNames)
    featureName = featureNames(i);
    for j = 1:85
        if strcmp(features(j),featureName)
            indices = [indices, j];
        end
    end     
end

relevantFeatures = data(:,indices);

result = relevantFeatures(:,1);

for i = 2:length(relevantFeatures(1,:))
    result = result & relevantFeatures(:,i);
end

animals = names(find(result));

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end
