% ---------------------------------
% Problem Set 5, Question 4
% ---------------------------------
%
% Author: YOUR NAME HERE
% Collaborators: 
%
% ---------------------------------
%
% file: graphicalModel.m
%       compute conditional distributions based on a Bayesian Network
%
% The conditional probability distributions associated with this graphical 
% model are as follows. The probability that X = 1 is 0.6. The probability 
% that Y = 1 is 0.2. The probability of Z given X and Y is given in this 
% table:
%       x  y   P(Z=1|x,y)
%       0  0      0.05
%       0  1      1.00
%       1  0      1.00
%       1  1      1.00


function [jointProbTable, condTable, condXgivenZ, condXgivenYandZ ] = graphicalModel()

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% Problem 4A
%
% Write down the factorization of the joint probability distribution on 
% X, Y, and Z into conditional distributions that is specified by this 
% Bayesian network. Use this factorization to compute the probability of 
% each of the eight possible sets of values for the three variables.
%
% Store these values in a column vector jointProbTable
jointProbTable = zeros(8,1);

jointProbTable(1) = [.3040]; % P( X=0, Y=0, Z=0 )
jointProbTable(2) = [.0160]; % P( X=0, Y=0, Z=1 )
jointProbTable(3) = [0]; % P( X=0, Y=1, Z=0 )
jointProbTable(4) = [.08]; % P( X=0, Y=1, Z=1 )
jointProbTable(5) = [0]; % P( X=1, Y=0, Z=0 )
jointProbTable(6) = [.48]; % P( X=1, Y=0, Z=1 )
jointProbTable(7) = [0]; % P( X=1, Y=1, Z=0 )
jointProbTable(8) = [.12]; % P( X=1, Y=1, Z=1 )



% Problem 4B
%
% Imagine that you observed the grass is wet in the morning (Z = 1). What 
% happens to your beliefs about the sprinklers being on?
%
% Problem 4B (1)
%
% Work out the conditional distribution over X and Y when Z=1, P(X,Y|Z=1)
condTable = zeros(4,1);

condTable(1) = [.023]; % P( X=0, Y=0 | Z=1 )
condTable(2) = [.1149]; % P( X=0, Y=1 | Z=1 )
condTable(3) = [.6897]; % P( X=1, Y=0 | Z=1 )
condTable(4) = [.1724]; % P( X=1, Y=1 | Z=1 )



% Problem 4B (2)
%
% Now, sum over the values of Y to calculate the probability that the 
% sprinklers were on given that the grass is wet, P(X = 1|Z = 1). 
% Store this conditional probability in a variable named condXgivenZ
condXgivenZ = [.8621];



% Problem 4C (1)
%
% Use the joint distribution to compute P (X = 1|Y = 1, Z = 1). 
% Store this conditional probability in a variable named condXgivenYandZ 
condXgivenYandZ = [.6];

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!
end