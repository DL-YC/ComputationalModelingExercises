% ---------------------------------
% Problem Set 5, Question 3
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------
%
% file: probAzeroth.m
%       estimate the probability of flipping a Head with a coin of Azeroth
%
% input:
%   tossSequence: 1xn vector of 1s (HEADS) and 0s (TAILS) corresponding to
%       the observed sequence of coin tosses. You will
%       use this sequence to compute prob3a, prob3b, and prob3c. 
%
% output:
%   prob3a, prob3b, prob3c: see instructions below.

% Problem 3:
%
% Assume you tossed a coin of Azeroth 10 times and observed the specific 
% sequence `HHTHTHHHHH`. As in lecture, assume we've observed some 
% fictitious trials as well, and we have a prior belief that coins of 
% Azeroth are slightly biased towards landing heads. 
% Thus, let VH = 55 and VT = 45, denoting that we've fictitiously observed 
% the coin of Azeroth flipped 100 times and saw 55 heads and 45 tails.

function [prob3a, prob3b, prob3c] = probAzeroth(tossSequence)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Problem 3 (a)
%
% Using the standard frequentist method of maximum likelihood estimation, 
% compute the value of theta and store this value in the
% variable prob3a. Remember that MLE only relies on data that we've 
% actually observed, so the prior should NOT factor into your answer.
prob3a = sum(tossSequence)/length(tossSequence)


% Problem 3 (b)
%
% Assuming a Bernoulli likelihood and Beta prior, compute the maximum a 
% posteriori (MAP) estimate for theta and store this value in the variable 
% prob3b
prob3b = (sum(tossSequence)+55)/(length(tossSequence)+100)


% Problem 3 (c)
%
% Assuming a Bernoulli likelihood and Beta prior, compute the posterior 
% mean estimate for theta and store this value in the variable prob3c. 
% The Beta and Bernoulli distributions are described in the lecture slides
prob3c = (sum(tossSequence)+55+1)/(length(tossSequence)+100+2)

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!
end
