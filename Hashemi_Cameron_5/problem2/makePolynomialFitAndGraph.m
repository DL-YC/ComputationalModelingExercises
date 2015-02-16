% ---------------------------------
% Problem Set 5, Question 2 Part A
% ---------------------------------
%
% file: makePolynomialFitAndGraph.m
%      finds the best-fitting polynomials for k = {0, ... , 8}, using 
%      traindata as the source of x and y.      

% loads the dataset
load xyData.mat

% relabel the training data
x = traindata(:,1);
y = traindata(:,2);

% iterate through the values of k (0 through 8)
for k = 0:8
    % create a range of values for x between 0 and 1
    plotx = 0:0.01:1;
    
    % find the coefficients p
    p = polyfit(x,y,k);
    
    % find the values of the polynomial parameterized by p and evaluated
    % for the points plotx
    ploty = polyval(p,plotx);

    % plot the original data points
    subplot(3,3,k+1);
    plot(plotx,ploty,'r-');
    ylim([0 0.35]);
    
    % plot the original data points
    hold on
    subplot(3,3,k+1);
    plot(x,y,'b.');
    ylim([0 0.35]);
    
    % put a title on each plot
    title(['k = ' num2str(k) ])
end

