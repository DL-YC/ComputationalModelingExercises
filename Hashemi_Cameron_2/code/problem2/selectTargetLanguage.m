% function: selectTargetLanguage.m
%   Randomly choose a target language.
%
% input:
%   numLanguages: the number of possible languages to choose from.
% output:
%   target: the index of the selected target language. This should be a single number.
%

function target = selectTargetLanguage(numLanguages)
    % DON'T EDIT ABOVE THIS LINE
    % ENTER YOUR CODE HERE
    
    target = [fix(rand*numLanguages)+1];

    % DON'T EDIT BELOW THIS LINE
end
