function success = validateP1Updated()

success = 1;

%% Check truthTables

fprintf('Checking `truthTables`... ');

a = [0 0 1 1]';
b = [0 1 0 1]';

[orTable, andTable, notTable] = truthTables(a, b);

if any(size(orTable) ~= [4 3]);
    error(['orTable does not have the right size (size is %s, but ' ...
           'it should be [4 3])'], mat2str(size(orTable)));
    success = 0;
end

if any(size(andTable) ~= [4 3]);
    error(['andTable does not have the right size (size is %s, but ' ...
           'it should be [4 3])'], mat2str(size(andTable)));
    success = 0;
end

if any(size(notTable) ~= [4 2]);
    error(['notTable does not have the right size (size is %s, but ' ...
           'it should be [4 2])'], mat2str(size(notTable)));
    success = 0;
end

fprintf('OK\n');

%% Check findAnimalsWithFeature

fprintf('Checking `findAnimalsWithFeature`... ');

load 25animalbindat.mat

animals = findAnimalsWithFeature('bulbous', features, data);

if any(size(animals) ~= size(names));
    error(['output for bulbous does not have the right size (size is %s, but it ' ...
           'should be %s)'], mat2str(size(animals)), mat2str(size(names)));
    success = 0;
end

if any((animals ~= 0) & (animals ~= 1));
    error('output for bulbous is not a binary vector');
    success = 0;
end

animals = findAnimalsWithFeature('gray', features, data);

if any(size(animals) ~= size(names));
    error(['output for gray does not have the right size (size is %s, but it ' ...
           'should be %s)'], mat2str(size(animals)), mat2str(size(names)));
    success = 0;
end

if any((animals ~= 0) & (animals ~= 1));
    error('output for gray is not a binary vector');
    success = 0;
end

fprintf('OK\n');

%% Check findAnimals

fprintf('Checking `findAnimals`... ');

animals = findAnimals({'bulbous'; 'gray'; 'hairless'}, names, features, data);

if any(size(animals) ~= [1 3]);
    error(['output for bulbous+gray+hairless does not have the ' ...
           'right size (size is %s, but it ' ...
           'should be [1 3])'], mat2str(size(animals)));
    success = 0;
end

if ~strcmp(animals(1, 1), 'blue whale');
    error('first animal is %s, but it should be blue whale', ...
          cell2mat(animals(1, 1)));
    success = 0;
end

if ~strcmp(animals(1, 2), 'hippopotamus');
    error('second animal is %s, but it should be hippopotamus',  ...
          cell2mat(animals(1, 2)));
    success = 0;
end

if ~strcmp(animals(1, 3), 'humpback whale');
    error('second animal is %s, but it should be humpback whale',  ...
          cell2mat(animals(1, 3)));
    success = 0;
end

fprintf('OK\n');

%% Check findFeaturesForAnimal

fprintf('Checking `findFeaturesForAnimal`... ');

feats = findFeaturesForAnimal('tiger', names, data);

if any(size(feats) ~= size(features));
    error(['output for tiger does not have the right size (size is %s, but it ' ...
           'should be %s)'], mat2str(size(feats)), mat2str(size(features)));
    success = 0;
end

if any((feats ~= 0) & (feats ~= 1));
    error('output for tiger is not a binary vector');
    success = 0;
end

feats = findFeaturesForAnimal('seal', names, data);

if any(size(feats) ~= size(features));
    error(['output for seal does not have the right size (size is %s, but it ' ...
           'should be %s)'], mat2str(size(feats)), mat2str(size(features)));
    success = 0;
end

if any((feats ~= 0) & (feats ~= 1));
    error('output for seal is not a binary vector');
    success = 0;
end

fprintf('OK\n');

%% Check isHippo

fprintf('Checking `isHippo`... ');

feats = findFeaturesForAnimal('hippopotamus', names, data);
valid = isHippo(feats);

if ~valid;
    error('hippopotamus was not identified as a hippo');
    success = 0;
end

feats = findFeaturesForAnimal('tiger', names, data);
valid = isHippo(feats);

if valid;
    error('tiger was identified as a hippo');
    success = 0;
end

total = sum(isHippo(data));

if total ~= 1;
    error('more than one animal was identified as a hippo');
    success = 0;
end

fprintf('OK\n');

%% Check isHippo2

fprintf('Checking `isHippo2`... ');

load 50animalbindat.mat

feats = findFeaturesForAnimal('hippopotamus', names, data);
valid = isHippo2(feats);

if ~valid;
    error('hippopotamus was not identified as a hippo');
    success = 0;
end

total = sum(isHippo2(data));

if total ~= 1;
    error('more than one animal was identified as a hippo');
    success = 0;
end

fprintf('OK\n');

%% Print out success/failure

if success;
    fprintf('Hooray, your answers passed the validation script!\n')
end

end
