function [] = validateP4()

load 50animalbindat.mat
success = 1;

%% Check commonFeatures
fprintf('Checking `commonFeatures`... ');

a = [1 0 0 0 1 0 1 0 1];
b = [1 0 1 1 1 0 0 0 1];

sumOfCommonFeatures = commonFeatures(a,b);

if isempty(sumOfCommonFeatures),
    error(['empty output for commonFeatures(a,b). The function should return' ...
        ' a single integer value']);
    success = 0;
end

if sumOfCommonFeatures == 6,
    error(['sumOfCommonFeatures should return only the number of features (ones) in common '...
        'between a and b, NOT the number of ones and zeros.']);
    success = 0;
elseif sumOfCommonFeatures ~= 3,
    error(['sumOfCommonFeatures is calculated incorrectly (value is %d, but ' ...
           'it should be 3 for the a & b defined in validateP4.m)'], sumOfCommonFeatures);
    success = 0;
end

fprintf('OK\n');

%% Check differences
fprintf('Checking `differences`... ');

sumOfDifferences = differences(a,b);

if isempty(sumOfDifferences),
    error(['empty output for commonFeatures(a,b). The function should return' ...
        ' a single integer value']);
    success = 0;
end

if sumOfDifferences == 3,
    error(['differences(a,b) should return only the number of features (ones) in a that '...
        'are not in b, NOT the number of ones and zeros.']);
    success = 0;
elseif sumOfDifferences ~= 1,
    error(['sumOfDifferences is calculated incorrectly (value is %d, but ' ...
           'it should be 3 for the a & b defined in validateP4.m)'], sumOfDifferences);
    success = 0;
end

fprintf('OK\n');

%% Check findDeerSim
fprintf('Checking `findDeerSim`... ');

[deerLike, notdeerLike] = findDeerSim(names);

if iscell(deerLike) ~= 1 || iscell(notdeerLike) ~= 1,
    error(['The outputs of findDeerSim do not have the correct datatype. Both outputs' ...
        ' should be 1 x 5 cell arrays.']);
    success = 0;
end

if size(deerLike,1) ~= 1 || size(deerLike,2) ~= 5,
    error(['deerLike does not have the right size (size is %s, but ' ...
           'it should be [1 5])'], mat2str(size(deerLike)));
    success = 0;
end

if size(notdeerLike,1) ~= 1 || size(notdeerLike,2) ~= 5,
    error(['notdeerLike does not have the right size (size is %s, but ' ...
           'it should be [1 5])'], mat2str(size(notdeerLike)));
    success = 0;
end

if isempty(find(strcmp(deerLike,'deer'))) == 0 || isempty(find(strcmp(notdeerLike,'deer'))) == 0,
    error(['deerLike and notdeerLike should not include deer in their similarity rankings']);
    success = 0;
end

fprintf('OK\n');

%% Check findRhinoAndSquirrelSim
fprintf('Checking `findRhinoAndSquirrelSim`... ');

% run findRhinoAndSquirrelSim using a different parameter set to ensure proper
% operation
[simRhinoToSquirrel, simSquirrelToRhino] = findRhinoAndSquirrelSim(2,3,2);

if size(simRhinoToSquirrel,1) > 1 || size(simRhinoToSquirrel,2) > 1 || size(simSquirrelToRhino,1) > 1 ...
        || size(simSquirrelToRhino,2) > 1,
    error(['the outputs of findRhinoAndSquirrelSim should each be a single number.'])
end 

if simRhinoToSquirrel ~= -76 || simSquirrelToRhino ~= -81,
    error(['findRhinoAndSquirrelSim is not returning the correct similarities. Make' ...
        ' sure that your function is calling tverskySim with the parameters '...
        'from the problem statement and that you have correctly identified '...
        'the indices for rhinos and squirrels']);
    success = 0;
end

fprintf('OK\n');

%% Print out success/failure

if success;
    fprintf('Hooray, your answers passed the validation script!\n')
end

end
