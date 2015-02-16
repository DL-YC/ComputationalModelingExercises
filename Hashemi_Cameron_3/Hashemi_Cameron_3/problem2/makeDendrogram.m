% ---------------------------------
% Problem Set 3, Question 2
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------

%% FUNCTION DESCRIPTION
% makeDendrogram takes as input the 1 x n cell array names and an n x n 
% similarity matrix similarities from kinship.mat and outputs a dendrogram 
% of the dissimilarities between the elements in names.  

% Problem 2 (a)
% Convert the similarity matrix similarities into a dissimilarity matrix and save it 
% as variable disSim. The content of cell [i,j] in a dissimilarity matrix 
% is equal to 1 minus the contents of cell [i,j] in the similarity matrix.

% Problem 2 (b)
% Convert the dissimilarity matrix from Part A into a row vector containing
% the cells below the diagonal. Save this vector as lowerDiag. Convert
% lowerDiag into a (n-1) x 2 linkageMatrix by passing lowerDiag to the
% linkage function in Matlab.

% Problem 2 (c)
% Plot dendrogram using Matlab's dendrogram function (see instructions for
% syntax). Save plot variable as dgram

%%
function [disSim, lowerDiag, linkageMatrix, plot1] = makeDendrogram(names, similarities)

% ensures that dendrogram plot is fullscreen
figure('units','normalized','outerposition',[0 0 1 1]); 

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% Part A
disSim = 1-similarities;


% Part B
lowerDiag = squareform(disSim);
linkageMatrix = linkage(lowerDiag);

% Part C
dgram = dendrogram(linkageMatrix, 'LABELS',names);

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!
plot1 = get(dgram);

end
