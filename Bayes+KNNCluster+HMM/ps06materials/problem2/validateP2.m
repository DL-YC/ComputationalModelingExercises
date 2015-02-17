function success = validateP2()
    success = ones(1, 2);
    
    fprintf('Checking `findAndDisplayFunctions`... ');
    try
        validateFindAndDisplayFunctions();
    catch err
        fprintf('%s\n', err.getReport());
        success(1) = 0;
    end
    
    if success(1)
        fprintf('OK\n');
    end
    
    fprintf('Checking `plotBayesPolyfit`... ');
    try
        validatePlotBayesPolyfit();
    catch err
        fprintf('%s\n', err.getReport());
        success(2) = 0;
    end
    
    if success(2)
        fprintf('OK\n');
    end

    if all(success)
        fprintf(['Hooray, your answers for Problem 1 passed the validation ' ...
                 'script!\n']);
    else
        fprintf(['There were some problems with your solutions for Problem 1. ' ...
                 'Please make sure to fix them before submitting ' ...
                 'your problem set!\n']);
    end
end

function validateFindAndDisplayFunctions()

set(0,'DefaultFigureVisible','off');
[thetas, funcPlot] = findAndDisplayFunctions();
set(0,'DefaultFigureVisible','on');

subPlots = {};
titles = {};
children = funcPlot.Children;
for i=1:length(children)
    subPlots{i} = get(children(i));
    titles{i} = get(subPlots{i}.Title);
end

close all;

if ~all(size(thetas) == [8 8])
    error('thetas has an incorrect size: %s (should be [8 8])', ...
          mat2str(size(thetas)));
end

if all(thetas(1, :) == thetas(2, :))
    error(['thetas(1, :) is the same as thetas(2, :), but they should ' ...
           'be different']);
end

if length(subPlots) ~= 8
    error('invalid number of subplots: %s (expected 8)', ...
          num2str(length(subPlots)));
end

for i=1:length(subPlots)
    if strcmp(titles{i}.String, '')
        error('no title specified for subplot %s', num2str(i));
    end
end

if ~exist('functions.jpg', 'file')
    error('functions.jpg does not exist, did you save it?');
end

end

function validatePlotBayesPolyfit()

set(0,'DefaultFigureVisible','off');
[MSE_train, MSE_test, funcPlot, msePlot] = plotBayesPolyfit();
set(0,'DefaultFigureVisible','on');

xlabel = get(get(gca, 'xlabel'));
ylabel = get(get(gca, 'ylabel'));
title = get(get(gca, 'title'));

subPlots = {};
titles = {};
children = funcPlot.Children;
for i=1:length(children)
    subPlots{i} = get(children(i));
    titles{i} = get(subPlots{i}.Title);
end

close all;

if ~all(size(MSE_train) == [8 1])
    error('invalid size for MSE_train: %s (expected [8 1])', ...
          mat2str(size(MSE_train)));
end

if ~all(MSE_train >= 0)
    error('MSE_train should be positive, but some elements were negative');
end

if ~all(size(MSE_test) == [8 1])
    error('invalid size for MSE_test: %s (expected [8 1])', ...
          mat2str(size(MSE_test)));
end

if ~all(MSE_test >= 0)
    error('MSE_test should be positive, but some elements were negative');
end

if length(subPlots) ~= 8
    error('invalid number of subplots: %s (expected 8)', ...
          num2str(length(subPlots)));
end

for i=1:length(subPlots)
    if strcmp(titles{i}.String, '')
        error('no title specified for subplot %s', num2str(i));
    end
end

if strcmp(xlabel.String, '')
    error('no xlabel specified for MSE plot');
end

if strcmp(ylabel.String, '')
    error('no ylabel specified for MSE plot');
end

if strcmp(title.String, '')
    error('no title specified for MSE plot');
end

if ~exist('fits.jpg', 'file')
    error('fits.jpg does not exist, did you save it?');
end

if ~exist('mse.jpg', 'file')
    error('mse.jpg does not exist, did you save it?');
end

end
