% ---------------------------------
% Problem Set 6, Question 1 Part D
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------
%
% file: plotProbAnimalsHaveK.m
%    computes the probability that each of the nine other animals has
%    blood that contains protein K
%
% input:
%    animal: the name of a kind of animal observed to have protein K
%
% output:
%    postPlot: a plot structure containing information about the plot of 
%        posterior probabilities over animals
 
function [postPlot] = plotProbAnimalsHaveK(animal)

    figure(2);
    load animalDataset.mat;

    % Do not edit above this line!
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    % YOUR CODE HERE
    probs = probAnimalsHaveK(animal);
    postPlot = bar(1:10,probs); % fill in arguments to bar
    title('Prob(Animal Having K | Elephant has K)');
    xlabel('Animal');
    ylabel('Probability');
    set(gca, 'XTick',1:10, 'XTickLabel',names)

    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % Do not edit below this line!

    postPlot = get(postPlot);
    
end
