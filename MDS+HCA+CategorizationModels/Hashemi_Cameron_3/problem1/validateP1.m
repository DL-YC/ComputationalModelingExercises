function success = validateP1()

    success = ones(1, 1);
    
    fprintf('Checking `nonMetricMDS`... ');
    try
        validateNonMetricMDS();
    catch err
        fprintf('%s\n', err.getReport());
        success(1) = 0;
    end
    
    if success(1)
        fprintf('OK\n');
    end
    
    if all(success)
        fprintf(['Hooray, your answers for Problem 1 all passed the validation ' ...
                 'script!\n']);
    else
        fprintf(['There were some problems with your solutions for Problem 1. ' ...
                 'Please make sure to fix them before submitting ' ...
                 'your problem set!kill canopy\n']);
    end
end

function validateNonMetricMDS()

    load kinship.mat

    set(0,'DefaultFigureVisible','off');
    [sim2d, plot1, labels] = nonMetricMDS(names, similarities);
    set(0,'DefaultFigureVisible','on');

    [l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12] = labels.Position;
    labelPVector = {l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12};
    idx = randi(12);
    
    if ~all(size(sim2d)  ==  [12 2]),
        error(['sim2d should be a 12 x 2 matrix, but your output is %s'], mat2str(size(sim2d)));
    end

    if ~isfloat(sim2d),
        error('sim2d should be a matrix of numbers');
    end

    if ~all(size(plot1.XData) == [1 size(sim2d, 1)]) || ...
        ~all(size(plot1.YData) == [1 size(sim2d, 1)]),
        error(['incorrect number of points in kinshipPlot']);
    end

    if ~strcmp(plot1.Marker, 'square'),
        error(['incorrect shape used to plot points in kinshipPlot (should be a square '...
            'but your plot uses a %s)'], plot1.Marker);
    end

    if ~isequal(plot1.Color, [0 0 1]),
        error(['incorrect color used to plot points in kinshipPlot (points should be '...
            'green)']);
    end

    if ~all(plot1.YData < 1 & plot1.YData >= -1)
        error('Y data for kinshipPlot should be somewhere between 1 and -1');
    end    

    if ~all(plot1.XData < 1 & plot1.XData >= -1)
        error('X data for kinshipPlot should be somewhere between 1 and -1');
    end  

    if ~all(size(labels) == [size(similarities, 1), 1]),
        error(['You have not placed the correct number of labels in mdsPlot']);
    end
    
    if ~all(labelPVector{idx} == [sim2d(idx,1), sim2d(idx,2), 0]),
        error(['check that your labels are placed incorrectly']);
    end
    
    clear all;
    
    % now try nonMetricMDS using 'fee fi fo fum' data set 
    data = [1, 0.1, 0.7, 0.1; 0.1, 1, 0.2, 0.3; 0.7, 0.2, 1, 0.1; 0.1, 0.3, 0.1, 1];
    words = {'fee' 'fi' 'fo' 'fum'};

    set(0,'DefaultFigureVisible','off');
    [sim2d, plot1, labels] = nonMetricMDS(words, data);
    set(0,'DefaultFigureVisible','on');
    
    [l1,l2,l3,l4] = labels.Position;
    labelPVector = {l1,l2,l3,l4};
    idx = randi(4);    
    
    if ~all(size(sim2d)  ==  [4 2]),
        error(['sim2d should be a 4 x 2 matrix for the "fee fi fo fum" dataset in '...
            'validateP1, but your output is %s'], mat2str(size(sim2d)));
    end

    if ~isfloat(sim2d),
        error('sim2d should be a matrix of numbers');
    end

    if ~all(size(plot1.XData) == [1 size(sim2d, 1)]) || ...
        ~all(size(plot1.YData) == [1 size(sim2d, 1)]),
        error(['incorrect number of points in kinshipPlot for "fee fi fo fum" '... 
            'dataset in validateP1']);
    end

    if ~strcmp(plot1.Marker, 'square'),
        error(['incorrect marker used to plot points in kinshipPlot (should be a square '...
            'but your plot uses a %s'], plot1.Marker);
    end

    if ~isequal(plot1.Color, [0 0 1]),
        error(['incorrect color used to plot points in kinshipPlot (points should be '...
            'green)']);
    end

    if ~all(plot1.YData < 1 & plot1.YData >= -1)
        error('Y data for kinshipPlot should be somewhere between 1 and -1');
    end    

    if ~all(plot1.XData < 1 & plot1.XData >= -1)
        error('X data for kinshipPlot should be somewhere between 1 and -1');
    end
    
    if ~all(labelPVector{idx} == [sim2d(idx,1), sim2d(idx,2), 0]),
        error(['check that your labels are placed incorrectly']);
    end 
    
    if ~exist('mds1.jpg', 'file')
        error('mds1.jpg does not exist, did you save it?');
    end
end
