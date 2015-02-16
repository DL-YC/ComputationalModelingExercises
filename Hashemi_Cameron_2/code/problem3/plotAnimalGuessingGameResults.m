% function: plotAnimalGuessingGameResults.m
%
% AUTHOR: Cameron Hashemi
%
% COLLABORATORS: 
%
% 
%
% input:
%   trialData: 3 * 5 matrix of scores from animalGuessingGame.m
%   
% output:
%   meanTrialData: mean number of guesses per hypothesis space from trial data  
%   plot1: a plot of meanTrialData as a function of hypothesisSizes
%   plot2: a plot of meanTrialData as a function of the logarithms in base 2 of hypothesisSizes
function [meanTrialData, plot1, plot2] = plotAnimalGuessingGameResults(trialData)

    hypothesisSizes = [2, 4, 8, 16, 32];
    
    % DON'T EDIT ABOVE THIS LINE
    % ENTER YOUR CODE HERE
    meanTrialData = mean(trialData,1);
    
    figure(1);
    p1=plot(hypothesisSizes,meanTrialData); %please supply arguments to plot  
    title('Hypothesis Sizes vs Mean Trial Count')
    xlabel('Hypothesis Size')
    ylabel('Mean Trial Count')
    
    figure(2);
    p2=plot(log2(hypothesisSizes),meanTrialData); %please supply arguments to plot  
    title('Log2(Hypothesis Sizes) vs Mean Trial Count')
    xlabel('Hypothesis Size')
    ylabel('Mean Trial Count')
    
    %DON'T EDIT BELOW THIS LINE
    %get() retrieves parameters from the plot objects for grading  
    plot1 = get(p1);
    plot2 = get(p2);
end
