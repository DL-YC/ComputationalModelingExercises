% ---------------------------------
% Problem Set 6, Question 3 Parts A-D
% ---------------------------------
%
% Author: Cameron Hahsemi
% Collaborators: 
%
% ---------------------------------

% file: kMeansClustering.m
% This is the main script that implements the k-means clustering algorithm
% You will be completing some functions to get it to work properly!

% Clear variable space and figures
close all;
clear;

% Load the data
load X;

% Initialize number of clusters and an assignment vector
numClusters = 3;
clusterAssignments = zeros(length(X));

% We'll have a figure with 8 subplots corresponding the each step of the
% k-means algorithm over 4 iterations
figure;
hold on;


% Run k-means algorithm for 4 iterations
for i=1:4,

    % Step (1) Update the cluster assignments
    % ------------------------------------
    %  THIS IS WHERE YOU SHOULD CALL YOUR 
    %  FUNCTION FROM PART A
    % ------------------------------------
    clusterAssignments = updateAssignments(numClusters,X,centers);
    
    % Plot the data with colors associated to assignments
    subplot(2,4,(2*i)-1);
    hold on;
    for j=1:length(X),
        if(clusterAssignments(j) == 1)
            plot(X(j,1),X(j,2),'r.');
        elseif(clusterAssignments(j) == 2)
            plot(X(j,1),X(j,2),'b.');
        else
            plot(X(j,1),X(j,2),'g.');
        end
    end
    
    % Plot the centers as stars with associated colors
    plot(centers(1,1),centers(1,2),'r*','MarkerSize',10)
    plot(centers(2,1),centers(2,2),'b*','MarkerSize',10);
    plot(centers(3,1),centers(3,2),'g*','MarkerSize',10);
    
    title(['Step(1) Iteration : ' num2str(i) ])

    % Step (2) Update the cluster center parameters
    % ------------------------------------
    %  THIS IS WHERE YOU SHOULD CALL YOUR 
    %  FUNCTION FROM PART B
    % ------------------------------------
    updatedCenters = updateParameters(numClusters,X,clusterAssignments);
    
    % Plot the data with new cluster center positions
    subplot(2,4,2*i)
    hold on;
    for j=1:length(X),
        if(clusterAssignments(j) == 1)
            plot(X(j,1),X(j,2),'r.');
        elseif(clusterAssignments(j) == 2)
            plot(X(j,1),X(j,2),'b.');
        else
            plot(X(j,1),X(j,2),'g.');
        end
    end
    plot(updatedCenters(1,1),updatedCenters(1,2),'r*','MarkerSize',10)
    plot(updatedCenters(2,1),updatedCenters(2,2),'b*','MarkerSize',10);
    plot(updatedCenters(3,1),updatedCenters(3,2),'g*','MarkerSize',10);
    
    title(['Step (2) Iteration : ' num2str(i) ])
    centers = updatedCenters;
end

% In a new figure, plot the final assignments after 4 iterations
figure;
hold on;

for j=1:length(X),
    if(clusterAssignments(j) == 1)
        plot(X(j,1),X(j,2),'r.');
    elseif(clusterAssignments(j) == 2)
        plot(X(j,1),X(j,2),'b.');
    else
        plot(X(j,1),X(j,2),'g.');
    end
end

plot(updatedCenters(1,1),updatedCenters(1,2),'r*','MarkerSize',10)
plot(updatedCenters(2,1),updatedCenters(2,2),'b*','MarkerSize',10);
plot(updatedCenters(3,1),updatedCenters(3,2),'g*','MarkerSize',10);


% new datapoint ( a Shih-Tzu! )
newObject = [3.3 3.5];
newObjectAssignment = 0;

%
% Find the label for a new object
% ------------------------------------
%  YOU SHOULD UNCOMMENT THE FOLLOWING 
%  LINE ONCE YOU HAVE WRITTEN THE 
%  FUNCTION FOR PART 1(d)
% ------------------------------------
newObjectAssignment = assignNewObject(numClusters,newObject,centers);

% Now color the new datapoint based on your assignment above.
% It will be represented as a big circle in the plot
if(newObjectAssignment == 1)
    plot(newObject(1,1),newObject(1,2),'ro','MarkerSize',10);
elseif(newObjectAssignment == 2)
    plot(newObject(1,1),newObject(1,2),'bo','MarkerSize',10);
elseif(newObjectAssignment == 3)
    plot(newObject(1,1),newObject(1,2),'go','MarkerSize',10);
else
    plot(newObject(1,1),newObject(1,2),'ko','MarkerSize',10);
end

% Now let's plot the true cluster assignments for comparison
% NOTE: the colors will be probably be different from your colors,
% you can think of each as just a category though
figure;
hold on;
plot(X(1:10,1),X(1:10,2),'r.');
plot(X(11:20,1),X(11:20,2),'b.');
plot(X(21:30,1),X(21:30,2),'g.');
title('True Clusters');
legend({'cats','dogs','mops'})
