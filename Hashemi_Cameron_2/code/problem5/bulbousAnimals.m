% ---------------------------------
% Problem Set 2, Question 5, Part C
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function [bulbousPrototype, bulbousSimilarities, bulbousAnimalName] = bulbousAnimals(features, data, names)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% YOUR CODE HERE (replace the [] with your answer, and note that
% you may need more than one line of code!)

bulbousPrototype = prototype('bulbous', features, data);

bulbousSimilarities = [];
for i = 1:50
    bulbousSimilarities = [bulbousSimilarities; shepardSim(bulbousPrototype,data(i,:))];
end

[values, indices] = sort(bulbousSimilarities);

bulbousAnimalName = names(indices(end));

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end