% function: generateExample.m
%   Randomly generate an example sentence from the target language.
%
% input:
%   validSentences: a vector of the valid sentences in the language.
% output:
%   example: one example sentence, generated at random from the valid sentences. This should be a single number.
%

function example = generateExample(validSentences)
    % DON'T EDIT ABOVE THIS LINE
    % ENTER YOUR CODE HERE
    index = fix(rand*length(validSentences)+1);
    example = validSentences(index);
        
    % DON'T EDIT BELOW THIS LINE
end