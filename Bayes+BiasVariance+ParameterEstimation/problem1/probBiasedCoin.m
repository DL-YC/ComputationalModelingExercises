% ---------------------------------
% Problem Set 5, Question 1 Part B
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------
%
% file: probBiasedCoin.m
%       computes the posterior probability of a biased coin (h1), given a
%       sequence of coin flips
%
% input:
%   flipSequence: a row vector of 0s (Tails) and 1s (Heads)
%
% output:
%   postProbH1: the posterior probability of the sequence of coin flips under
%         hypothesis 1 (a biased coin)
%

function [postProbH1] = probBiasedCoin(flipSequence)

% probability that the coin produces heads 
theta0=0.5;     % hypothesis 0 is a fair coin
theta1=0.95;    % hypothesis 1 is a biased coin

% prior probabilities of hypotheses
ph0=0.6;  
ph1=0.4; 

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% YOUR CODE HERE
Nh = sum(flipSequence);
Nt = length(flipSequence)-Nh;
pDgivH1 = (theta1^Nh)*((1-theta1)^Nt);
pDgivH0 = (theta0^Nh)*((1-theta0)^Nt);
postProbH1 = pDgivH1*ph1/(pDgivH1*ph1+pDgivH0*ph0);

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end

