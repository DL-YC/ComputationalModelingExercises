function success = validateP1()
    success = ones(1, 5);
    
    fprintf('Checking `probClustersHaveK`... ');
    try
        validateProbClustersHaveK();
    catch err
        fprintf('%s\n', err.getReport());
        success(1) = 0;
    end
    
    if success(1)
        fprintf('OK\n');
    end
    
    fprintf('Checking `plotProbClustersHaveK`... ');
    try
        validatePlotProbClustersHaveK();
    catch err
        fprintf('%s\n', err.getReport());
        success(2) = 0;
    end
    
    if success(2)
        fprintf('OK\n');
    end

    fprintf('Checking `probAnimalsHaveK`... ');
    try
        validateProbAnimalsHaveK();
    catch err
        fprintf('%s\n', err.getReport());
        success(3) = 0;
    end
    
    if success(3)
        fprintf('OK\n');
    end
    
    fprintf('Checking `plotProbAnimalsHaveK`... ');
    try
        validatePlotProbAnimalsHaveK();
    catch err
        fprintf('%s\n', err.getReport());
        success(4) = 0;
    end
    
    if success(4)
        fprintf('OK\n');
    end
    
    fprintf('Checking `participantRatings`... ');
    try
        validateParticipantRatings();
    catch err
        fprintf('%s\n', err.getReport());
        success(5) = 0;
    end
    
    if success(5)
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

function validateProbClustersHaveK()

load animalDataset.mat;
correct_size = [size(hyps, 1) 1];

for i = 1:length(names)
    probs = probClustersHaveK(names{i});
    
    if ~all(size(probs) == correct_size),
        error(['for animal "%s", probs should be an array of size %s, but '...
            'yours has size %s'], names{i}, correct_size, mat2str(size(probs)));
    end
    
    if ~all(probs <= 1 & probs >= 0)
        error(['for animal "%s", probs should always be between 0 and 1, but '...
            'yours has value %s'], names{i}, mat2str(probs, 4));
    end
    
    if ~sum(probs) == 1
        error('probs should always sum to 1, but yours sums to %s for animal "%s"', ...
              sum(probs), names{i});
    end

end

probs1 = probClustersHaveK('elephant');
probs2 = probClustersHaveK('squirrel');

if all(probs1 == probs2)
    error(['probs should be different for animals "elephant" and ' ...
           '"squirrel", but yours returned %s for both'], mat2str(probs1, ...
                                                      4));
end

end

function validatePlotProbClustersHaveK()

close all;
load animalDataset.mat;
correct_size = size(hyps, 1);

set(0,'DefaultFigureVisible','off');
plot1 = plotProbClustersHaveK('elephant');
plot2 = plotProbClustersHaveK('squirrel');
set(0,'DefaultFigureVisible','on');

if ~all(size(plot1.XData, 2) == correct_size),
    error(['your plot should have %s bars, but yours has %s'], ...
          num2str(correct_size), num2str(size(plot1.XData, 2)));
end

if all(plot1.YData == plot2.YData)
    error(['plots should be different for animals "elephant" and ' ...
           '"squirrel", but yours returned the same thing for both']);
end

xlabel = get(get(gca, 'xlabel'));
ylabel = get(get(gca, 'ylabel'));
title = get(get(gca, 'title'));

close all;

if strcmp(xlabel.String, '')
    error('you did not specify a label for the x-axis');
end
if strcmp(ylabel.String, '')
    error('you did not specify a label for the y-axis');
end
if strcmp(ylabel.String, '')
    error('you did not specify a title for the plot');
end

if ~exist('postHypothesisPlot.jpg', 'file')
    error('postHypothesisPlot.jpg does not exist, did you save it?');
end
end

function validateProbAnimalsHaveK()

load animalDataset.mat;
correct_size = [size(hyps, 2) 1];


for i = 1:length(names)
    probs = probAnimalsHaveK(names{i});
    
    if ~all(size(probs) == correct_size),
        error(['for animal "%s", probs should be an array of size %s, but '...
            'yours has size %s'], names{i}, correct_size, mat2str(size(probs)));
    end
    
    if ~all(probs <= 1.000000001 & probs >= 0)
        error(['for animal "%s", probs should always be between 0 and 1, but '...
            'yours has value %s'], names{i}, mat2str(probs, 4));
    end

end

probs1 = probAnimalsHaveK('elephant');
probs2 = probAnimalsHaveK('squirrel');

if all(probs1 == probs2)
    error(['probs should be different for animals "elephant" and ' ...
           '"squirrel", but yours returned %s for both'], mat2str(probs1, ...
                                                      4));
end

end

function validatePlotProbAnimalsHaveK()

close all;
load animalDataset.mat;
correct_size = size(hyps, 2);

set(0,'DefaultFigureVisible','off');
plot1 = plotProbAnimalsHaveK('elephant');
plot2 = plotProbAnimalsHaveK('squirrel');
set(0,'DefaultFigureVisible','on');

if ~all(size(plot1.XData, 2) == correct_size),
    error(['your plot should have %s bars, but yours has %s'], ...
          num2str(correct_size), num2str(size(plot1.XData, 2)));
end

if all(plot1.YData == plot2.YData)
    error(['plots should be different for animals "elephant" and ' ...
           '"squirrel", but yours returned the same thing for both']);
end

xlabel = get(get(gca, 'xlabel'));
ylabel = get(get(gca, 'ylabel'));
title = get(get(gca, 'title'));
xticklabel = get(gca, 'xticklabel');

close all;

if strcmp(xlabel.String, '')
    error('you did not specify a label for the x-axis');
end
if strcmp(ylabel.String, '')
    error('you did not specify a label for the y-axis');
end
if strcmp(ylabel.String, '')
    error('you did not specify a title for the plot');
end
if ~all(strcmp(xticklabel, names))
    error('your xticklabels are incorrect');
end

if ~exist('postAnimalPlot.jpg', 'file')
    error('postAnimalPlot.jpg does not exist, did you save it?');
end
end

function validateParticipantRatings()

close all;
load animalDataset.mat;

set(0,'DefaultFigureVisible','off');
[ratings, ratingsPlot] = participantRatings();
set(0,'DefaultFigureVisible','on');
    
if ~all(size(ratings) == [10 1]),
    error(['ratings should be an array of size [10 1], but '...
           'yours has size %s'], mat2str(size(ratings)));
end
    
if ~all(ratings <= 7 & ratings >= 1)
    error(['ratings should always be between 1 and 7, but '...
           'yours has value %s'], mat2str(ratings));
end

xlabel = get(get(gca, 'xlabel'));
ylabel = get(get(gca, 'ylabel'));
title = get(get(gca, 'title'));
xticklabel = get(gca, 'xticklabel');

close all;

if strcmp(xlabel.String, '')
    error('you did not specify a label for the x-axis');
end
if strcmp(ylabel.String, '')
    error('you did not specify a label for the y-axis');
end
if strcmp(ylabel.String, '')
    error('you did not specify a title for the plot');
end
if ~all(strcmp(xticklabel, names))
    error('your xticklabels are incorrect');
end

if ~exist('ratingsPlot.jpg', 'file')
    error('ratingsPlot.jpg does not exist, did you save it?');
end
end
