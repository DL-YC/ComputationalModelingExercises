% ---------------------------------
% Problem Set 1, Question 1, Part G
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function [valid] = isHippo2(features)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% YOUR CODE HERE (replace the [] with your answer, and note that
% you may need more than one line of code!)

valid = 1:50;

for i = 1:length(features(:,1))
    animal = features(i,:);
    if animal(13) && animal(30) && animal(46) && animal(72)
        valid(i) = 1;
    else
        valid(i) = 0;
    end
end

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end
