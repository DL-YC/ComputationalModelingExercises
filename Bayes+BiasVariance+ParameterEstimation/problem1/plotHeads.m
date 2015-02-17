% ---------------------------------
% Problem Set 5, Question 1 Part C
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------
%
% file: plotHeads.m
%       uses probBiasedCoin to plot the change in posterior probability
%       under h1 for increasing sequences of consecutive heads
%
% input:
%   numHeads: the max length for our sequence of H's
%
% output:
%   postPlot: a plot structure containing information about the plot of 
%       posterior probabilities under h1 vs. length of the H sequence. 
%       MAKE SURE TO SAVE YOUR PLOT AS A JPEG NAMED postPlot.jpg 
%

function [postPlot] = plotHeads(numHeads)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% YOUR CODE HERE
pBC = zeros(1,numHeads);
for n = 1:numHeads;
    pBC(n) = probBiasedCoin(ones(1,n));
postPlot = plot(1:numHeads,pBC);
xlabel('Number of Heads');
ylabel('Probability of Biased Coin');

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

postPlot = get(postPlot);

end