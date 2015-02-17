% ---------------------------------
% Problem Set 6, Question 3 Part A
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------
%
% function: updateAssignments
%
% input
%   numClusters: an integer representing the number of clusters we assume
%                the data can be partitioned into. For the current
%                assignment, you may assume numClusters = 3
%
%   X: a 30x2 matrix of the observations
%
%   centers: a 3x2 matrix of the cluster centers where each row corresponds
%            to one of the clusters. Centers = random samples from a normal
%            distribution about mean(X) with std dev = 0.5
%
% output
%   clusterAssignments: a column vector containing the cluster label
%       assignments for each data point in X. The labels will be either 1, 
%       2, or 3, corresponding to which cluster center is closet to a 
%       particular data point

function [clusterAssignments] = updateAssignments(numClusters,X,centers)

% This might be useful when computing the distance from a point to a center
distanceToCenter = zeros(numClusters,1);

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% ENTER YOUR CODE HERE
clusterAssignments = zeros(size(X,1),1);
for n = 1:length(clusterAssignments)
    cluster = 0;
    minDistance = realmax;
    for m = 1:numClusters
        currDistance = sqrt((centers(m,1)-X(n,1))^2+(centers(m,2)-X(n,2))^2);
        if currDistance < minDistance
            minDistance = currDistance;
            cluster = m;
        end
    end
    clusterAssignments(n) = cluster;
end


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Do not edit below this line!
  
end


