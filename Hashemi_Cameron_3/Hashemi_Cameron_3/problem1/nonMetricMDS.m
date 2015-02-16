% ---------------------------------
% Problem Set 3, Question 1
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------

%% FUNCTION DESCRIPTION
% nonMetricMDS takes as input the 1 x n cell array names and a real valued 
% n x n matrix similarities and outputs sim2d, an n x 2 matrix of coordinates in 2D space 
% and plot1, a structured array containing information about the kinshipPlot 
% plot object you define within the function.

% Problem 1 (a)
% Compute a 2-dimensional representation of the similarities between the 
% kinship terms in names and store it in the variable sim2d
%
% Problem 1 (b)
% Plot a BLUE SQUARE at the location of each of the 12 kinship terms using 
% the plot command. Save this plot object to the variable kinshipPlot

% Problem 1 (c)
% Use the hold and text commands to place each kinship term next to its 
% corresponding blue square in kinshipPlot

%%
function [sim2d, plot1, labels] = nonMetricMDS(names, similarities)

% ensures that kinshipPlot is fullscreen
figure('units','normalized','outerposition',[0 0 1 1]); 

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Part A
sim2d = mdscale(similarities,2);


% Part B
kinshipPlot = plot(sim2d(:,1),sim2d(:,2),'s');

% Part C
hold on;
for i = 1:length(similarities),
    labels(i) = text(sim2d(i,1),sim2d(i,2),names(i));
end

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

plot1 = get(kinshipPlot);
labels = get(labels);
hold off;

end
