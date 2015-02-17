function success = validateP1()
    success = ones(1, 2);
    
    fprintf('Checking `probBiasedCoin`... ');
    try
        validateProbBiasedCoin();
    catch err
        fprintf('%s\n', err.getReport());
        success(1) = 0;
    end
    
    if success(1)
        fprintf('OK\n');
    end
    
    fprintf('Checking `plotHeads`... ');
    try
        validatePlotHeads();
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

function validateProbBiasedCoin()

testFlips={[1 1 1 1 1 1],[0],[0 1 0 0]};

for i = 1:size(testFlips,2)
    [postProbH1] = probBiasedCoin(testFlips{i});
    
    if ~all(size(postProbH1)  ==  [1 1]),
        error(['postProbH1 should always be a single number, but '...
            'yours has size %s'], mat2str(size(postProbH1)));
    end
    
    if ~all(postProbH1 <= 1 & postProbH1 >= 0)
        error(['postProbH1 should always be between 0 and 1, but '...
            'yours has value %s'], mat2str(postProbH1));
    end
    
end

end

function validatePlotHeads()

testHeads = [5, 10, 1];
testAxis = {1:5,1:10,1};

for i = 1:size(testHeads, 2),
    [postPlot] = plotHeads(testHeads(i));
    
    if ~all(postPlot.XData == testAxis{i}),
        error(['postPlot uses the wrong data for its X axis.']);
    end
    
end

if ~exist('postPlot.jpg', 'file')
    error('postPlot.jpg does not exist, did you save it?');
end
end