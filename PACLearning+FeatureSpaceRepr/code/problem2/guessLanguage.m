% function: guessLanguage.m
%   Guess which language is the target, based on all previous observations.
%   You should guess the first language in the list of possible languages which is
%   consistent with all the observaions.
% 
% input:
%   observations: all the previous observations of valid sentences from the target language.
%   possibleLanguages: a cell array of vectors. Each cell in corresponds to a single language,
%   a single language is represented as a vector of sentence IDs permissible in that language.
% output:
%   guess: the index of your guess for which language is the target. This should be a single number.

function guess = guessLanguage(observations, possibleLanguages)
    % DON'T EDIT ABOVE THIS LINE
    % ENTER YOUR CODE HERE
    for i = 1:length(possibleLanguages)
        if length(possibleLanguages{i})==1
            if length(observations) > 1
                continue
            elseif observations(1) == possibleLanguages{i}(1)
                guess = i;
                return
            end
        end
        if length(intersect(observations,possibleLanguages{i}))==length(union(observations,[]))
            guess = i;
            return;
        end
    end
        
    % DON'T EDIT BELOW THIS LINE    
end
    
