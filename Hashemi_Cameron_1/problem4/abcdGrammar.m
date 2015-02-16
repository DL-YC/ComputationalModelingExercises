% ---------------------------------
% Problem Set 1, Question 4, Part B
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function sentence = abcdGrammar

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% Finish the function to generate sentences defined by the context
% free grammar defined in Problem 4, Part A.  
%
% Store the result of calling the function in the `sentence` variable
% below. Note that because this is a random function, the value of
% `sentence` should be different each time the function is run!

action = fix(2*rand);

if action == 0
    sentence = [ 'abcd' ];
else
    sentence = [ 'ab' abcdGrammar 'cd'];
end

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end
