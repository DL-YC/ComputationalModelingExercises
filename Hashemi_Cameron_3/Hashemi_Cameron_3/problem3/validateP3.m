function success = validateP3()

    success = ones(1, 1);
    
    fprintf('Checking `scalingVsClustering`... ');
    try
        validateScalingVsClustering();
    catch err
        fprintf('%s\n', err.getReport());
        success(1) = 0;
    end
    
    if success(1)
        fprintf('OK\n');
    end
    
    if all(success)
        fprintf(['Hooray, your answers for Problem 3 all passed the validation ' ...
                 'script!\n']);
    else
        fprintf(['There were some problems with your solutions for Problem 3. ' ...
                 'Please make sure to fix them before submitting ' ...
                 'your problem set!\n']);
    end
end

function validateScalingVsClustering()

    load eurodist.mat

    set(0,'DefaultFigureVisible','off')

    [mdsCoordinates, mdsPlot, labelMDS, lowerDiag, linkageMatrix, dendPlot] = ...
        scalingVsClustering(city_dist, city_names);

    set(0,'DefaultFigureVisible','on')
    
    [l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,l16,l17,l18,l19,...
        l20,l21] = labelMDS.Position;
    labelPVector = {l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14,l15,...
        l16,l17,l18,l19,l20,l21};
    idx = randi(21);
    
    if ~all(size(mdsCoordinates)  ==  [21 2]),
        error(['mdsCoordinates should be a 21 x 2 matrix, but your output '...
            'is %s'], mat2str(size(mdsCoordinates)));
    end

    if ~isfloat(mdsCoordinates),
        error('mdsCoordinates should be a matrix of numbers');
    end

    if ~all(size(mdsPlot.XData) == [1 size(mdsCoordinates, 1)]) || ...
        ~all(size(mdsPlot.YData) == [1 size(mdsCoordinates, 1)]),
        error('incorrect number of points in kinshipPlot');
    end

    if ~strcmp(mdsPlot.Marker, 'pentagram'),
        error(['incorrect shape used to plot points in kinshipPlot (should be a square '...
            'but your plot uses a %s)'], mdsPlot.Marker);
    end


    if ~strcmp(mdsPlot.Marker, 'pentagram'),
        error(['incorrect shape used to plot points in mdsPlot (should be a pentagram '...
            'but your plot uses a %s'], mdsPlot.Marker);
    end

    if ~isequal(mdsPlot.Color, [1 0 0]),
        error(['incorrect color used to plot points in mdsPlot (points should be '...
            'red)']);
    end

    if ~all(mdsPlot.YData < 3000 & mdsPlot.YData >= -3000)
        error(['Y data for mdsPlot should be somewhere between 3000 and -3000 '...
            '(your data ranges between %s and %s)'], mat2str(min(mdsPlot.YData)), ...
            mat2str(max(mdsPlot.YData)));
    end    

    if ~all(mdsPlot.XData < 3000 & mdsPlot.XData >= -3000)
        error(['X data for mdsPlot should be somewhere between 3000 and -3000 '...
            '(your data ranges between %s and %s)'],mat2str(min(mdsPlot.XData)), ...
            mat2str(max(mdsPlot.XData)));
    end

    if ~isfloat(lowerDiag),
        error('lowerDiag should be a vector of numbers');
    end

    if ~all(size(lowerDiag) == [1, sum(1:size(city_dist, 1)-1)]),
        error(['lowerDiag should be a 1 x 210 row vector (current dimensions ' ...
            'are %s) \n'], mat2str(size(lowerDiag)));
    end

    if ~isfloat(linkageMatrix),
        error('linkageMatrix should be a matrix of numbers');
    end
       
    if ~all(size(linkageMatrix) == [size(city_dist, 1)-1, 3]),
        error(['linkageMatrix should be a 20 x 3 matrix (current dimensions are '...
            '%s)'], mat2str(size(linkageMatrix)));
    end
    
    if ~all(size(dendPlot) == [size(city_dist, 1)-1, 1]),
        error(['dendPlot does not have the right number of elements (should ' ...
            'be of dimension [20 1] but is currently of dimension %s)'], ...
            mat2str(size(dendPlot)));
    end
    
    if ~all(labelPVector{idx} == [mdsCoordinates(idx,1), mdsCoordinates(idx,2), 0]),
        error(['check that the labels in your MDS plot are placed correctly']);
    end 
    
    if ~exist('mds3.jpg', 'file')
        error('mds3.jpg does not exist, did you save it?');
    end
    
    if ~exist('den3.jpg', 'file')
        error('den3.jpg does not exist, did you save it?');
    end
end