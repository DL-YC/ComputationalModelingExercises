function success = validateP3()

success = 1;

%% Check plotAnimalGuessingGameResults

fprintf('Checking `plotAnimalGuessingGameResults`... ');

try
    load('trialData.mat')
catch err    
    error('You must complete the animal guessing game in Part A and save the results to trialData.mat')
    success = 0;
end

set(0,'DefaultFigureVisible','off')
[means, p1, p2] = plotAnimalGuessingGameResults(trialData);
set(0,'DefaultFigureVisible','on')

if ~all(size(means)  ==  [1 5]);
    error('meanTrialData should have a 1*5 matrix of means (one for each number of animals)')
    success = 0;
end

if ~all(p1.XData == power(2, [1:5]))
    error('X axis of plot1 should correspond to the number of different sizes of hypothesis spaces tested')
    success = 0;
end    

if ~all(p1.YData < 100 & p1.YData >= 1)
    error('Y data for plot1 should be somewhere between 1 and 100')
    success = 0;
end    
    
if ~all(p2.XData == 1:5)   
    error('X axis of plot2 should correspond to the logarithm of the number of different sizes of hypothesis spaces tested')    
    success = 0;
end    
    
if ~all(p2.YData < 100 & p2.YData >= 1)
    error('Y data for plot1 should be somewhere between 1 and 100')
    success = 0;
end     
    
fprintf('OK\n');    

end



