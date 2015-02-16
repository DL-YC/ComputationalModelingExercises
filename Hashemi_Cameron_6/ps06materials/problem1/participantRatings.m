% ---------------------------------
% Problem Set 6, Question 1 Part E
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------
%
% file: participantRatings.m
 
function [ratings, ratingsPlot] = participantRatings()

    figure(3);
    load animalDataset.mat;

    % Do not edit above this line!
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   
    % YOUR CODE HERE
    ratings = [4,4,2,2,1,1,1,1,7,5]'; % fill in with judgments from your participant
    ratingsPlot = bar(1:10,ratings); % fill in arguments to bar
    title('Likelihood Ratings of Animals Having K, Given Elephants have K');
    xlabel('Animal');
    ylabel('Likelihood Ratings');
    set(gca, 'XTick',1:10, 'XTickLabel',names) % fill in arguments to bar

    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % Do not edit below this line!
    
    ratingsPlot = get(ratingsPlot);

end
