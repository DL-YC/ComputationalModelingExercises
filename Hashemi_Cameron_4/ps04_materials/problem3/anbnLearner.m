% ---------------------------------
% Problem Set 4, Question 3, Part A
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function [net, predictions] = anbnLearner(traindata, testdata)
% function: anbnLearner.m
%
% Creates an Elman neural network with two hidden units, and trains it
% on the provided data.
%
% input:
%       traindata: a 1xN matrix of training data
%
% output:
%       net: a cell array containing the weights of the network

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    % YOUR CODE HERE
    
    net = trainElman(traindata(1:end-1),traindata(2:end),2,100);
    predictions = predictElman(net,testdata);

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end
