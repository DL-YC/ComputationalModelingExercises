function success = validateP2()
success = ones(1, 2);

fprintf('Checking `findMSE`... ');
try
    validateFindMSE();
catch err
    fprintf('%s\n', err.getReport());
    success(1) = 0;
end

if success(1)
    fprintf('OK\n');
end

fprintf('Checking `plotMSE`... ');
try
    validatePlotMSE();
catch err
    fprintf('%s\n', err.getReport());
    success(2) = 0;
end

if success(2)
    fprintf('OK\n');
end

if all(success)
    fprintf(['Hooray, your answers for Problem 2 passed the validation ' ...
        'script!\n']);
else
    fprintf(['There were some problems with your solutions for Problem 2. ' ...
        'Please make sure to fix them before submitting ' ...
        'your problem set!\n']);
end
end

function validateFindMSE()

load xyData.mat

[MSE] = findMSE(traindata, testdata);

if ~all(size(MSE) == [9 2])
    error(['MSE should have dimensions [9 2], but '...
        'yours has dimensions %s'], mat2str(size(MSE)));
end

if ~all(all(MSE < 1)) || ~all(all(MSE > 0)),
    error(['MSE values for xyData should be between 0 and 1']);
end

% test on an AB dataset
a = [0:0.1:1]';
b = [0:0.01:1]';

adata = [a a];
bdata = [b b];

[MSE] = findMSE(adata, bdata);

if ~all(size(MSE) == [9 2])
    error(['MSE should have dimensions [9 2], but '...
        'yours has dimensions %s'], mat2str(size(MSE)));
end

if ~all(all(MSE < 0.2)) || ~all(all(MSE > 0)),
    error(['MSE values for AB dataset (see validateP2 source code) '...
        'should be between 0 and 0.2']);
end
end

function validatePlotMSE()

testMSE = [1:9; 2:10]';

set(0,'DefaultFigureVisible','off');
[msePlot] = plotMSE(testMSE);
set(0,'DefaultFigureVisible','on');

if size(msePlot,1)~= 2,
    error(['msePlot should display two lines, one for testdata and' ... 
       ' one for traindata']);
end

[a, b] = msePlot.DisplayName;

if isempty(a) || isempty(b),
    error(['Make sure to include a legend in your msePlot!']);
end

if ~all(msePlot(1).XData == [0:8]) || ~all(msePlot(2).XData == [0:8]),
    error(['Incorrect X data used in msePlot'])
end

if ~all(msePlot(1).YData == testMSE(:,1)') || ~all(msePlot(2).YData == testMSE(:,2)'),
    error(['Incorrect Y data used in msePlot'])
end

if ~exist('msePlot.jpg', 'file')
    error('msePlot.jpg does not exist, did you save it?');
end

end
