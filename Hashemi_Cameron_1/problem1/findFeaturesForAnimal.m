% ---------------------------------
% Problem Set 1, Question 1, Part D
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function [features] = findFeaturesForAnimal(animal, names, data)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% YOUR CODE HERE (replace the [] with your answer, and note that
% you may need more than one line of code!)

for i = 1:length(names)
    if strcmp(names(i),animal)
        index = i;
        break;
    end
end

animalIndex = find(strcmp(names,animal));

features = data(animalIndex,:);

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end
