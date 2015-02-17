function success = validateP3()
success = ones(1, 4);

fprintf('Checking `updateAssignments`... ');
try
    validateUpdateAssignments();
catch err
    fprintf('%s\n', err.getReport());
    success(1) = 0;
end

if success(1)
    fprintf('OK\n');
end

fprintf('Checking `updateParameters`... ');
try
    validateUpdateParameters();
catch err
    fprintf('%s\n', err.getReport());
    success(2) = 0;
end

if success(2)
    fprintf('OK\n');
end

fprintf('Checking `kMeansClustering`... ');
try
    validateKMeansClustering();
catch err
    fprintf('%s\n', err.getReport());
    success(3) = 0;
end

if success(3)
    fprintf('OK\n');
end

fprintf('Checking `assignNewObject`... ');
try
    validateAssignNewObject();
catch err
    fprintf('%s\n', err.getReport());
    success(4) = 0;
end

if success(4)
    fprintf('OK\n');
end

if all(success)
    fprintf(['Hooray, your answers for Problem 3 passed the validation ' ...
        'script!\n']);
else
    fprintf(['There were some problems with your solutions for Problem 3. ' ...
        'Please make sure to fix them before submitting ' ...
        'your problem set!\n']);
end
end

function validateUpdateAssignments()
load X.mat

% validate updateAssignments using different values for centers + numClusters
numClusters = 2;
[clusterAssignments] = updateAssignments(numClusters, X, [3,2; 1,4]);

if ~all(size(clusterAssignments) == [size(X,1),1])
    error(['clusterAssignments should be a column vector with the same '...
        'number of rows as X, but yours has dimensions %s'], mat2str(size(clusterAssignments)));
end

if ~all(unique(clusterAssignments) == [1;2])
    error(['clusterAssignments should only contain integers between 1 and '...
        'numClusters.']);
end

end

function validateUpdateParameters()
load X.mat

% validate updateParameters using different values for centers + numClusters
numClusters = 2;
[clusterAssignments] = updateAssignments(numClusters, X, [3,2; 1,4]);
[updatedCenters] = updateParameters(numClusters, X, clusterAssignments);

if ~all(size(updatedCenters) == [numClusters,2])
    error(['updatedCenters should be a matrix with dimensions [numClusters 2] '...
        ', but yours has dimensions %s'], mat2str(size(updatedCenters)));
end

if max(updatedCenters(:,1)) > max(X(:,1)) || min(updatedCenters(:,1)) < min(X(:,1)) ...
        || max(updatedCenters(:,2)) > max(X(:,2)) || min(updatedCenters(:,2)) < min(X(:,2))
    error(['The coordinates in updatedCenters should fall within the range of values in X.']);
end

end

function validateKMeansClustering()
load X.mat

set(0,'DefaultFigureVisible','off');
kMeansClustering;
set(0,'DefaultFigureVisible','on');
close all;

if ~exist('iterations.jpg', 'file')
    error('iterations.jpg does not exist, did you save it?');
end

if ~exist('final.jpg', 'file')
    error('final.jpg does not exist, did you save it?');
end

if ~exist('trueLabels.jpg', 'file')
    error('trueLabels.jpg does not exist, did you save it?');
end
end

function validateAssignNewObject()

load X.mat

% validate assignNewObject using different values for centers, numClusters,
% and newObject
numClusters = 2;
newObject = [1,2];
[clusterAssignments] = updateAssignments(numClusters, X, [3,2; 1,4]);
[updatedCenters] = updateParameters(numClusters, X, clusterAssignments);
[newObjectAssignment] = assignNewObject(numClusters, newObject, updatedCenters);

if numel(newObjectAssignment) ~= 1
    error(['newObjectAssignment should be a single integer corresponding to the cluster label'...
      ' assignment for newObject, but yours contains %s elements'], mat2str(numel(newObjectAssignment)));
end

if ~isnumeric(newObjectAssignment)
       error(['newObjectAssignment should be a single integer']);
end 

if isempty(find([1:numClusters] == newObjectAssignment))
    error(['newObjectAssignment should be a single integer in the range [1:numClusters] '...
        'but yours is %s.'], mat2str(newObjectAssignment));
end
end