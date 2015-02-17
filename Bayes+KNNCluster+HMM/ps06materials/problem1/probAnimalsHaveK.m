% ---------------------------------
% Problem Set 6, Question 1 Part C
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------
%
% file: probAnimalsHaveK.m
%    computes the probability that each of the nine other animals has
%    blood that contains protein K
%
% input:
%    animal: the name of a kind of animal observed to have protein K
%
% output:
%    probs: a column vector containing the posterior probability of
%        each animal having protein K.
 
function [probs] = probAnimalsHaveK(animal)

    load animalDataset.mat;

    % Do not edit above this line!
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
    % YOUR CODE HERE
    probs = zeros(size(names),1);
    clustProbs = probClustersHaveK(animal);
    for n = 1:size(names,1)
        for m = 1:size(clustProbs,1)
            probs(n) = probs(n) + (clustProbs(m)*hyps(m,n));
        end
    end
        
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % Do not edit below this line!

end
