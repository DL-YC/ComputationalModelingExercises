% ---------------------------------
% Problem Set 4, Question 1, Problem2.m
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------
%% FUNCTION DEFINITION
%In Problem2.m, you will use perceptrons to try to learn two kinds of logical relationships: OR and XOR 

%%
function [inputs, ORoutput, XORoutput, ORweights, ORprediction, XORweights, XORprediction, XORweights_mp, XORprediction_mp] = Problem2()

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    %% Part A: Define the input data 
    inputs  = [-1 -1 1 1; -1 1 -1 1];
    ORoutput = [-1 1 1 1];
    XORoutput = [-1 1 1 -1];

    %% Part B: Single-layer `OR` Perceptron  
    ORweights = trainPerceptron(inputs,ORoutput,0);  %use the function trainPerceptron()
    ORprediction = tanh(ORweights(1)*inputs(1,:)+ORweights(2)*inputs(2,:)+ORweights(3));

    %% Part C: Single-layer `XOR` Perceptron
    XORweights = trainPerceptron(inputs,XORoutput,0); %use the function trainPerceptron()
    XORprediction = tanh(XORweights(1)*inputs(1,:)+XORweights(2)*inputs(2,:)+XORweights(3));
    
    %% Part D: Multi-layer `XOR` Perceptron
    XORweights_mp = trainMultilayerPerceptron(inputs,XORoutput,2,20000); %use the function trainMultilayerPerceptron()
    XORprediction_mp = predictMultilayerPerceptron(XORweights_mp,inputs); %use the function predictMultilayerPerceptron()
    
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % Do not edit below this line!

end