% ---------------------------------
% Problem Set 4, Question 1, Problem1.m
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------

%% FUNCTION DESCRIPTION
%Train a Hebbian network to associate input vectors with output vectors by
%way of features.

%% Define the input data
function [updatedW, yhatDog, yhatCat, yhatAnimalX2,yhatAnimalX5,yhatAnimalX8] = Problem1()

inputFeatures = {'chases sticks', 'likes water','whiskers','furry'};
outputFeatures = {'hiss','bark','neigh','growl'};

xDog = [ 1, 1, 1, 1 ]';
xCat = [ -1, -1, 1, 1 ]';

yDog = [ -1, 1, -1, 1 ]';
yCat = [ 1, -1, -1, 1 ]';

W = zeros(length(xDog));


% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%% Problem 1 (B)
updatedW = calculateWeights(W, [xDog xCat], [yDog yCat]); % call the function as specified

yhatDog = updatedW*xDog; % set using equation 1
yhatCat = updatedW*xCat; % set using eauation 1


%% Problem 1 (C)

yhatAnimalX2 = updatedW*((.2*xDog)+(.8*xCat))
yhatAnimalX5 = updatedW*((.5*xDog)+(.5*xCat))
yhatAnimalX8 = updatedW*((.8*xDog)+(.2*xCat))

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end


