function success = validateP3()

    success = ones(4, 1);
    
    fprintf('Checking `anbnLearner`... ');
    try
        validateanbnLearner();
    catch err
        fprintf('%s\n', err.getReport());
        success(1) = 0;
    end
    
    if success(1)
        fprintf('OK\n');
    end

    fprintf('Checking `meanSquaredErrors`... ');
    try
        validateMeanSquaredErrors();
    catch err
        fprintf('%s\n', err.getReport());
        success(2) = 0;
    end
    
    if success(2)
        fprintf('OK\n');
    end
    
    fprintf('Checking `plotMSE`... ');
    try
        validatePlotMSE();
    catch err
        fprintf('ERROR: %s\n', err.getReport());
        success(3) = 0;
    end
    
    if success(3)
        fprintf('OK\n');
    end
    
    fprintf('Checking `anbnError`... ');
    try
        validateanbnError();
    catch err
        fprintf('ERROR: %s\n', err.getReport());
        success(4) = 0;
    end
    
    if success(4)
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

function validateanbnLearner()

    traindata = [zeros(1, 10) ones(1, 10)];
    testdata = [0 1];
    
    [net, predictions] = anbnLearner(traindata, testdata);
    
    % check type of net
    if ~iscell(net)
        error('anbnLearner should return the network weights from trainElman');
    end
    
    % check size of net
    if any(size(net) ~= [2, 1])
        error('anbnLearner should return the network weights from trainElman');
    end
    
    % check type of the arrays inside net
    if ~all(cellfun(@isfloat, net))
        error('anbnLearner returned invalid network weights, which should be a cell array of regular arrays');
    end
    
    % check size of the arrays inside net
    if any(size(net{1}) ~= [2 4])
        error(['anbnLearner returned invalid network weights for the first level. ' ...
               'Did you specify the number of hidden units correctly?']);
    end
    if any(size(net{2}) ~= [1 3])
        error(['anbnLearner returned invalid network weights for the second level. ' ...
               'Did you specify the number of hidden units correctly?']);
    end
    
    % check type for predictions
    if ~isfloat(predictions)
        error('anbnLearner should return an array of network predictions for testdata');
    end
    
    % check size of predictions
    if any(size(predictions) ~= [1 2])
        error('anbnLearner returned predictions with size %s (should be [1 2])', ...
            mat2str(size(predictions)));
    end
    
    if predictions(:, 1) >= 0.5 || predictions(:, 2) <= 0.5
        error('anbnLearner returned incorrect predictions: %s', mat2str(predictions));
    end
end
    
function validateMeanSquaredErrors()

    predictions = [1 0 1];
    testdata = [0 1 0];
    mse = meanSquaredErrors(predictions, testdata);
    
    if ~isfloat(mse)
        error('meanSquaredErrors should return an array of mean squared errors');
    end
    
    if any(size(mse) ~= [1 3])
        error('meanSquaredErrors returned an array of incorrect size: %s (should be [1 3])', mat2str(size(mse)));
    end
    
    if any(mse ~= 0)
        error('meanSquaredErrors should have returned all zeros');
    end
    
    predictions = 0;
    testdata = 0;
    mse = meanSquaredErrors(predictions, testdata);
    
    if mse ~= 1
        error('meanSquaredErrors(0, 0) should have returned 1 (did you remember to append an a to testdata?)');
    end
end

function validatePlotMSE()

    close all;

    mse = [1 0 1];
    
    set(0,'DefaultFigureVisible','off');
    plot = plotMSE(mse);
    set(0,'DefaultFigureVisible','on');
    
    if ~all(size(plot.XData) == size(mse))
        error(['incorrect number of bars in MSE plot: %d (expected %d)'], size(plot.XData, 2), size(mse, 2));
    end
    
    mse = [1 0 1 0];
    
    set(0,'DefaultFigureVisible','off');
    plot = plotMSE(mse);
    set(0,'DefaultFigureVisible','on');
    
    if ~all(size(plot.XData) == size(mse))
        error('incorrect number of bars in MSE plot: %d (expected %d)', size(plot.XData, 2), size(mse, 2));
    end
    
    xlabel = get(get(gca, 'xlabel'));
    if strcmp(xlabel.String, '')
        error('you did not specify a label for the x-axis');
    end
    ylabel = get(get(gca, 'ylabel'));
    if strcmp(ylabel.String, '')
        error('you did not specify a label for the y-axis');
    end
end

function validateanbnError()

    set(0,'DefaultFigureVisible','off');
    anbnError;
    set(0,'DefaultFigureVisible','on');
    
    if ~exist('barGraph.jpg', 'file')
        error('barGraph.jpg does not exist, did you save it?');
    end
end