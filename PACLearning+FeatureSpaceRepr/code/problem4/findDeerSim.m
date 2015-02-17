% ---------------------------------
% Problem Set 2, Question 4, Part C
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function [deerLike, notdeerLike] = findDeerSim(names)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% YOUR CODE HERE (replace the [] with your answer, and note that
% you may need more than one line of code!)

load 50animalbindat;

sim = tverskySim;

[B, I] = sort(sim(40,:));

deerLike = setdiff(names(I(end-5:end)),{'deer'});

notdeerLike = names(I(1:5));

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end