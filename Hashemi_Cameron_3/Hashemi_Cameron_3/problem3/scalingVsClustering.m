% ---------------------------------
% Problem Set 3, Question 3
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------

%% FUNCTION DESCRIPTION
% scalingVsClustering takes as input city_dist and city_names from
% eurodist.mat and produces a non-metric MDS plot (saved as mdsPlot)
% and a dendrogram (saved as dendPlot). It also returns mdsCoordinates, the
% coordinate values for the points in mdsPlot and labels, a structure array 
% containing information on your label placement, as well as lowerDiag and
% linkageMatrix -- the intermediate steps in calculating dendPlot.

% Problem 3 (a)
% Use non-metric multidimensional scaling to obtain a 2-dimensional representation 
% and plot the results with text labels, marking each point with a RED PENTAGRAM. 
% Save the mdscale results to the variable mdsCoordinates and save the plot to the 
% variable mdsPlot.

% Problem 3 (b)
% Run hierarchical clustering on the eurodist.mat data to create a dendrogram with 
% labels. Save the output of the dendrogram function call to the 
% provided variable dendPlot. Save your intermediate stages as lowerDiag and
% linkageMatrix, respectively
% 
% Note that city_dist contains distances and not similarities, thus you cannot use 
% the exact same code as you did in Problem 2. Think about why we used dissimilarities 
% in P2 and how the magnitude of metric distances relate to similarity ratings.

%%
function [mdsCoordinates, mdsPlot, labelMDS, lowerDiag, linkageMatrix, dendPlot] = ...
    scalingVsClustering(city_dist, city_names)

% this makes mdsPlot fullscreen
figure('units','normalized','outerposition',[0 0 1 1]); 

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Part A
mdsCoordinates = mdscale(city_dist,2);
mdsPlot = plot(mdsCoordinates(:,1),mdsCoordinates(:,2),'rp');

for i=1:length(city_names),
    labelMDS(i) = text(mdsCoordinates(i,1),mdsCoordinates(i,2),city_names(i));
end

% --------------------------------------------------
mdsPlot = get(mdsPlot);   % DO NOT EDIT THIS LINE
labelMDS = get(labelMDS); % DO NOT EDIT THIS LINE
% --------------------------------------------------


% Part B
lowerDiag = squareform(city_dist);
linkageMatrix = linkage(lowerDiag);
dendPlot = dendrogram(linkageMatrix, 'LABELS',city_names);

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

% this makes dendPlot fullscreen
set(gcf,'units','normalized','outerposition',[0 0 1 1]);

dendPlot = get(dendPlot);

end
