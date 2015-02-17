% ---------------------------------
% Problem Set 6, Question 2 Part A
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------
%
% file: findAndDisplayFunctions.m

function [thetas, funcPlot] = findAndDisplayFunctions()

    % constant parameters 
    alpha = 5;
    k = 7;
    betas = [1 0.5 0.3 0.2 0.1 0.05 0.01 0.001]'

    figure('units', 'normalized', 'outerposition', [0 0 1 1]); 

    % Do not edit above this line!
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    % YOUR ANSWER HERE
    thetas = zeros(length(betas),k+1)
    for n = 1:length(betas)
        thetas(n,:) = funcsamp(alpha,betas(n),k);
        plotx = -1:.01:1;
        ploty = polyval(thetas(n,:),plotx);
        subplot(2,4,n);
        funcPlot = plot(plotx,ploty);
        betaStr = num2str(betas(n));
        titleStr = strcat('Beta value == ', betaStr);
        title(titleStr);
        xlabel('Input');
        ylabel('Output');
    end

    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % Do not edit below this line!

    funcPlot = get(gcf);
end
