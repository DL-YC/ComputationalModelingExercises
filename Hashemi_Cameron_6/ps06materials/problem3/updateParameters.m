% ---------------------------------
% Problem Set 6, Question 3 Part B
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------
%
% function: updateParameters
%
% input
%   numClusters: an integer representing the number of clusters we assume
%                the data can be partitioned into
%
%   X: a 30x2 matrix of the observations
%
%   clusterAssignments: a column vector containing the cluster label
%       assignments you calculated with updateAssignments. The labels will 
%       be either 1, 2, or 3, corresponding to which cluster center is closet
%       to a particular data point
%   
% output
%   updatedCenters: a 3x2 matrix of the updated cluster centers where each row 
%            corresponds to one of the centers
  
function [updatedCenters] = updateParameters(numClusters,X,clusterAssignments)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% ENTER YOUR CODE HERE
updatedCenters = zeros(numClusters,2);
for n = 1:numClusters
    indices = find(clusterAssignments==n);
    updatedCenters(n,:) = mean(X(indices,:));
end
    

% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!

end