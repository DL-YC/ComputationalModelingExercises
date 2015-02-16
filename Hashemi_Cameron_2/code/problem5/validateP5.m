function [] = validateP5()

load 50animalbindat.mat
success = 1;

%% Check prototype
fprintf('Checking `prototype`... ');

% validate prototype() using a different category value.
p = prototype('paws', features, data);
correct = [1,1,0,1,1,0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,1,1,0,0,1,1,1,0,0,0,...
    1,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,1,0,1,0,1,0,0,0,1,0,1,0,0,0,1,1,0,0,...
    0,0,0,1,0,0,0,0,1,0,0,0,1,1,1,0,1,1,0];

if any((p ~= 0) & (p ~= 1)),
    error(['p should be a binary feature vector']);
    success = 0;
end

if size(p,1) ~= 1 || size(p,2) ~= 85,
    error(['p does not have the right size (size is %s, but ' ...
           'it should be [1 85])'], mat2str(size(p)));
    success = 0;
end

if isequal(p,correct) == 0,
    error(['p is not calculated correctly. make sure you are utilizing ' ...
        ' the `majority rule` procedure described in the problem statement.']);
    success = 0;
end

fprintf('OK\n');

%% Check shepardSim
fprintf('Checking `shepardSim`... ');

a = [1 0 0 0 1 0 1 0 1];
b = [1 0 1 1 1 0 0 0 1];

simScore = shepardSim(a,b);

if size(simScore,1) ~= 1 || size(simScore,2) ~= 1 || isnumeric(simScore) ~= 1,
    error(['the output of your shepardSim function should be a single number']);
    success = 0;
end

if simScore < 0 || simScore > 1,
    error(['check that you are calculating simScore correctly (it should '...
        'always take a value between 0 and 1.']);
    success = 0;
end

fprintf('OK\n');

%% Check bulbousAnimals
fprintf('Checking `bulbousAnimals`... ');

[bulbousPrototype, bulbousSimilarities, bulbousAnimalName] = ...
    bulbousAnimals(features, data, names);

if size(bulbousPrototype,1) ~= 1 || size(bulbousPrototype,2) ~=85,
    error(['bulbousPrototype does not have the right size (size is %s, but ' ...
           'it should be [1 85])'], mat2str(size(bulbousPrototype)));
    success = 0;
end

if size(bulbousSimilarities,1) ~= 50 || size(bulbousSimilarities,2) ~= 1,
    error(['bulbousSimilarities does not have the right size (size is %s, but ' ...
           'it should be [50 1])'], mat2str(size(bulbousSimilarities)));
    success = 0;
end

if iscell(bulbousAnimalName) ~= 1,
    error(['bulbousAnimalName should be a cell string containing a single animal name']);
    success = 0;
end    

fprintf('OK\n');

%% Print out success/failure

if success;
    fprintf('Hooray, your answers passed the validation script!\n')
end

end
