% --------------------------------
% Problem Set 6, Question 1 Part A
% --------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------
%
% file: probClustersHaveK.m
%    computes a posterior distribution over hypotheses as to which
%    sets of animals have blood containing protein K, using the
%    Bayesian generalization model
%
% input: 
%    animal: the name of a kind of animal observed to have protein K
%
% output:
%    probs: a column vector containing the posterior probability of
%        each hypothesis.

function [probs] = probClustersHaveK(animal)
    
    load animalDataset.mat;

    % Do not edit above this line!
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    % YOUR CODE HERE
    index = strmatch(animal,names);
    probs = zeros(size(names,1),1);
    for n = 1:size(hyps,1)
        top = ((hyps(n,index)/sum(hyps(n,:)))*prior(n));
        bottom = zeros(1,size(hyps,1));
        for m = 1:size(hyps,1)
            if (m == n)
                bottom(m) = top;
            else
                bottom(m) = ((hyps(m,index)/sum(hyps(m,:)))*prior(m));
            end
        end
        sum(bottom);
        probs(n) = top/sum(bottom);
    end

    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % Do not edit below this line!
    
end

