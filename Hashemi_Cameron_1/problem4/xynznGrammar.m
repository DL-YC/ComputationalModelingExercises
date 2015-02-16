% ---------------------------------
% Problem Set 1, Question 4, Part C
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function sentence = xynznGrammar(n)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% Finish the code to create sentences defined as (xy)^n(z)^n, where `n` is
% the argument to this function. Store the result of calling the
% function in the `sentence` variable below.

action = fix(2*rand);

sentence = [];

for i = 1:n
    sentence = [sentence 'xy'];
end

for i = 1:n
    sentence = [sentence 'z'];
end

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end
