% ---------------------------------
% Problem Set 4, Question 3, Part C
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function [mseVector]  = meanSquaredErrors(predictions, testdata)
% function: meanSquaredErrors.m
%
% Computes the MSE for each of the predictions of the network compared
% to the test set, following Equation 1 from the homework.
%
% input:
%       predictions: a 1xN array of predictions from the Elman network
%       testdata: a 1xN array of test data
%
% output:
%       mseVector: a vector containing the MSE value for each of the
%       predictions of the network compared to the test set

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    % Don't forget to append an 'a' (represented as a '1') to testdata as
    % described in the problem set!
    
    % YOUR CODE HERE
    testdata = [testdata 1];
    mseVector = (predictions-testdata(2:end)).^2;

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end
