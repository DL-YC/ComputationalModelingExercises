function sim = tverskySim(theta,alpha,beta)
% function: tverskySim.m
%   computes the similarities of animals based off Tversky's contrast model
%
% input: 
%   (1) theta: the weight for common features
%   (2) alpha: the weight for distinctive features of a
%   (3) beta: the weight for distinctive features of b
% 
% output: 
%   (1) sim: a 50 x 50 matrix of similarities where sim(i,j) corresponds to
%   the Tversky's contrast model S(i,j) for animals i and j
%
%
% Tversky's Contrast model:
%   sim(a,b) = theta*f(A & B) - alpha*f(A-B) - beta*f(B-A)
%
% for the purposes of this problem set, we'll assume the function f is
% simply the sum() function.


% set default parameter values
if (nargin < 3)
    theta = 1.0;
    alpha = 0.5;
    beta = 0.5;
end


% for this problem, we will be using the animal features dataset that is
% 50 animals x 85 binary features
load 50animalbindat.mat;

% initialize the sim matrix
sim = zeros(length(names));


% iterate through the data matrix to create a new matrix of similarities
% using Tversky's contrast model
% ****
% NOTE - this may take 10-15 seconds to run
% ****
for i=1:length(names),
    for j=1:length(names),
        
        % THIS IS ONE OF YOUR FUNCTIONS (commonFeatures)
        commonFeaturesOfAandB = theta*commonFeatures(data(i,:),data(j,:));
        
        % THIS IS ONE OF YOUR FUNCTIONS (differences)
        distinctiveFeaturesOfA = alpha*differences(data(i,:),data(j,:));
        
        % THIS IS ONE OF YOUR FUNCTIONS (differences)
        distinctiveFeaturesOfB = beta*differences(data(j,:),data(i,:));
        
        sim(i,j) = commonFeaturesOfAandB - distinctiveFeaturesOfA - distinctiveFeaturesOfB;
    end
end

% save the similarity matrix for later use
% save('sim.mat','sim');
