% ---------------------------------
% Problem Set 6, Question 2 Part B
% ---------------------------------
%
% Author: YOUR NAME HERE
% Collaborators: 
%
% ---------------------------------
%
% file: plotBayesPolyfit.m

function [MSE_train, MSE_test, funcPlot, msePlot] = plotBayesPolyfit()

    load xyData.mat;

    % constant parameters 
    alpha = 5;
    k = 7;
    betas = [1 0.5 0.3 0.2 0.1 0.05 0.01 0.001]';
    sigma_y = 0.05;
    
    figure('units', 'normalized', 'outerposition', [0 0 1 1]); 

    % Do not edit above this line!
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    % YOUR CODE HERE
    MSE_train = [];
    MSE_test = [];
    funcPlot = [];
    for n = 1:length(betas)
        poly = bayespolyfit(traindata(:,1),traindata(:,2),k,sigma_y,alpha,betas(n));
        subplot(4,2,n);
        plot(traindata(:,1),traindata(:,2),'b');
        hold on;
        plot(traindata(:,1),polyval(poly,traindata(:,1)),'r');
        hold off;
        betaStr = num2str(betas(n));
        titleStr = strcat('Bayesian Regression Function, Beta value == ', betaStr);
        title(titleStr);
        xlabel('Input');
        ylabel('Output');
        %legend('True function','Regression Function'); % legend was
        %failing the validation script b/c too many subplots
    end

    % Do not edit between these lines!
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    funcPlot = get(gcf);
    figure('units', 'normalized', 'outerposition', [0 0 1 1]); 
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    % YOUR CODE HERE
    msePlot = [];
    MSE_train = zeros(1,length(betas))';
    MSE_test = zeros(1,length(betas))';
    for n = 1:length(betas)
        poly = bayespolyfit(traindata(:,1),traindata(:,2),k,sigma_y,alpha,betas(n));
        MSE_train(n) = mean((traindata(:,2) - polyval(poly,traindata(:,1))).^2);
        MSE_test(n) = mean((testdata(:,2) - polyval(poly,testdata(:,1))).^2);
    end
    subplot(1,1,1);
    plot(betas,MSE_train,'b',betas,MSE_test,'r');
    title('Mean Squared Error by Beta Value');
    xlabel('Beta Value');
    ylabel('Mean Squared Error');
    legend('Train Data', 'Test Data');



    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % Do not edit below this line!
    
    msePlot = get(gcf);

end
