% ---------------------------------
% Problem Set 1, Question 1, Part A 
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function [orTable, andTable, notTable] = truthTables(a, b)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% YOUR CODE HERE (replace the [] with your answer)

orTable = [ a, b, (a|b)];
andTable = [ a, b, (a&b)];
notTable = [ a, ~a];

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end
