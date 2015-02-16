% ---------------------------------
% Problem Set 2, Question 5, Part A
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function p = prototype(category, features, data)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% YOUR CODE HERE (replace the [] with your answer, and note that
% you may need more than one line of code!)

load 50animalbindat;

j = strmatch(category,features);
p = [];
animals = data(:,j)>0;
for i = 1:85
    if sum(data(animals,i))>=fix(sum(animals)/2)+1
            p = [p 1];
        else
            p = [p 0];
        end
end
    
    
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end