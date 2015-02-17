function success = validateP456()

    success = ones(3, 1);
    
    fprintf('Checking `calculateSimilarity`... ');
    try
        validateCalculateSimilarity();
    catch err
        fprintf('%s\n', err.getReport());
        success(1) = 0;
    end
    
    if success(1)
        fprintf('OK\n');
    end

    fprintf('Checking `contextModel`... ');
    try
        validateContextModel();
    catch err
        fprintf('%s\n', err.getReport());
        success(2) = 0;
    end
    
    if success(2)
        fprintf('OK\n');
    end
    
    fprintf('Checking `prototypeModel`... ');
    try
        validatePrototypeModel();
    catch err
        fprintf('ERROR: %s\n', err.getReport());
        success(3) = 0;
    end
    
    if success(3)
        fprintf('OK\n');
    end
    
    if all(success)
        fprintf(['Hooray, your answers for Problem 4 all passed the validation ' ...
                 'script!\n']);
    else
        fprintf(['There were some problems with your solutions for Problem 4. ' ...
                 'Please make sure to fix them before submitting ' ...
                 'your problem set!\n']);
    end
end

function validateCalculateSimilarity()
    
    % try it for vectors of length 4
    a = [0 0 1 1];
    b = [0 1 0 1];
    
    sim1 = calculateSimilarity(a, b);
    if ~isfloat(sim1)
        error('calculateSimilarity should return a number');
    end
    if any(size(sim1) ~= [1 1])
        error(['calculateSimilarity should only return a single value ' ...
               '(got %s instead)'], mat2str(sim1));
    end
    if (sim1 < 0) || (sim1 > 1)
        error(['calculateSimilarity should always return values between ' ...
               'zero and one (got %s instead)'], sim1);
    end
    
    % try it for vectors of length 5
    a = [0 0 1 1 0];
    b = [0 1 0 1 0];
    
    sim1 = calculateSimilarity(a, b);
    if ~isfloat(sim1)
        error('calculateSimilarity should return a number');
    end
    if any(size(sim1) ~= [1 1])
        error(['calculateSimilarity should only return a single value ' ...
               '(got %s instead)'], mat2str(sim1));
    end
    if (sim1 < 0) || (sim1 > 1)
        error(['calculateSimilarity should always return values between ' ...
               'zero and one (got %s instead)'], sim1);
    end

    % make sure the default value of s hasn't been changed
    sim2 = calculateSimilarity(a, b, 0.1);
    if sim1 ~= sim2
        error(['calculateSimilarity does not return the same thing ' ...
               'for the default value of s and s=0.1, but the default ' ...
               'value of s should be 0.1']);
    end
    
    % make sure the value of s affects the output
    sim3 = calculateSimilarity(a, b, 0.2);
    if sim2 == sim3
        error(['calculateSimilarity returned the same thing for two ' ...
               'different values of s']);
    end

end
    
function validateContextModel()
    
    % try it with the data from stimuli.mat
    load stimuli.mat
    
    probs = contextModel(exemplars, exemplarCategories, exemplars);
    if any(size(probs) ~= [6 1])
        error(['size of vector returned by contextModel should be ' ...
               '[6 1] (got %s instead)'], mat2str(size(probs)));
    end
    if any((probs < 0) | (probs > 1))
        error(['contextModel should return probabilities that are ' ...
               'between 0 and 1 (got %s)'], mat2str(probs));
    end
    
    probs = contextModel(exemplars, exemplarCategories, ...
                         prototypes);
    if any(size(probs) ~= [2 1])
        error(['size of vector returned by contextModel should be ' ...
               '[2 1] (got %s instead)'], mat2str(size(probs)));
    end
    if any((probs < 0) | (probs > 1))
        error(['contextModel should return probabilities that are ' ...
               'between 0 and 1 (got %s)'], mat2str(probs));
    end

    probs = contextModel(exemplars, exemplarCategories, novel);
    if any(size(probs) ~= [2 1])
        error(['size of vector returned by contextModel should be ' ...
               '[2 1] (got %s instead)'], mat2str(size(probs)));
    end
    if any((probs < 0) | (probs > 1))
        error(['contextModel should return probabilities that are ' ...
               'between 0 and 1 (got %s)'], mat2str(probs));
    end

    probs = contextModel(novel, novelCategories, exemplars);
    if any(size(probs) ~= [6 1])
        error(['size of vector returned by contextModel should be ' ...
               '[6 1] (got %s instead)'], mat2str(size(probs)));
    end
    if any((probs < 0) | (probs > 1))
        error(['contextModel should return probabilities that are ' ...
               'between 0 and 1 (got %s)'], mat2str(probs));
    end
    
    % make sure the s parameter works properly
    probs1 = contextModel(exemplars, exemplarCategories, prototypes);
    probs2 = contextModel(exemplars, exemplarCategories, prototypes, 0.1);
    probs3 = contextModel(exemplars, exemplarCategories, prototypes, 0.2);

    % make sure the default value of s hasn't been changed
    if any(probs1 ~= probs2)
        error(['contextModel does not return the same thing ' ...
               'for the default value of s and s=0.1, but the default ' ...
               'value of s should be 0.1']);
    end
    
    % make sure the value of s affects the output
    if any(probs2 == probs3)
        error(['contextModel returned the same thing for two ' ...
               'different values of s']);
    end

    % try it with data that has five features instead of four
    exemplars = [[0 1 1 1 0]; [1 0 1 1 0]; [1 1 0 1 0]; [1 0 0 0 0]; ...
                 [0 1 0 0 0]; [0 0 1 0 0]];
    novel = [[1 1 1 0 0]; [0 0 0 1 0]];

    probs = contextModel(exemplars, exemplarCategories, novel);
    if any(size(probs) ~= [2 1])
        error(['size of vector returned by contextModel should be ' ...
               '[2 1] (got %s instead)'], mat2str(size(probs)));
    end
    if any((probs < 0) | (probs > 1))
        error(['contextModel should return probabilities that are ' ...
               'between 0 and 1 (got %s)'], mat2str(probs));
    end

end

function validatePrototypeModel()
    
    % try it with the data from stimuli.mat
    load stimuli.mat
    
    probs = prototypeModel(prototypes, exemplars);
    if any(size(probs) ~= [6 1])
        error(['size of vector returned by prototypeModel should be ' ...
               '[6 1] (got %s instead)'], mat2str(size(probs)));
    end
    if any((probs < 0) | (probs > 1))
        error(['prototypeModel should return probabilities that are ' ...
               'between 0 and 1 (got %s)'], mat2str(probs));
    end
    
    probs = prototypeModel(prototypes, prototypes);
    if any(size(probs) ~= [2 1])
        error(['size of vector returned by prototypeModel should be ' ...
               '[2 1] (got %s instead)'], mat2str(size(probs)));
    end
    if any((probs < 0) | (probs > 1))
        error(['prototypeModel should return probabilities that are ' ...
               'between 0 and 1 (got %s)'], mat2str(probs));
    end

    probs = prototypeModel(prototypes, novel);
    if any(size(probs) ~= [2 1])
        error(['size of vector returned by prototypeModel should be ' ...
               '[2 1] (got %s instead)'], mat2str(size(probs)));
    end
    if any((probs < 0) | (probs > 1))
        error(['prototypeModel should return probabilities that are ' ...
               'between 0 and 1 (got %s)'], mat2str(probs));
    end

    % make sure the s parameter works properly
    probs1 = prototypeModel(prototypes, novel);
    probs2 = prototypeModel(prototypes, novel, 0.1);
    probs3 = prototypeModel(prototypes, novel, 0.2);

    % make sure the default value of s hasn't been changed
    if any(probs1 ~= probs2)
        error(['prototypeModel does not return the same thing ' ...
               'for the default value of s and s=0.1, but the default ' ...
               'value of s should be 0.1']);
    end
    
    % make sure the value of s affects the output
    if any(probs2 == probs3)
        error(['prototypeModel returned the same thing for two ' ...
               'different values of s']);
    end

    % try it with data that has five features instead of four
    prototypes = [[0 0 0 0 0]; [1 1 1 1 1]];
    exemplars = [[0 1 1 1 0]; [1 0 1 1 0]; [1 1 0 1 0]; [1 0 0 0 0]; ...
                 [0 1 0 0 0]; [0 0 1 0 0]];
    novel = [[1 1 1 0 0]; [0 0 0 1 0]];

    probs = prototypeModel(prototypes, exemplars);
    if any(size(probs) ~= [6 1])
        error(['size of vector returned by prototypeModel should be ' ...
               '[6 1] (got %s instead)'], mat2str(size(probs)));
    end
    if any((probs < 0) | (probs > 1))
        error(['prototypeModel should return probabilities that are ' ...
               'between 0 and 1 (got %s)'], mat2str(probs));
    end
    
    probs = prototypeModel(prototypes, novel);
    if any(size(probs) ~= [2 1])
        error(['size of vector returned by prototypeModel should be ' ...
               '[2 1] (got %s instead)'], mat2str(size(probs)));
    end
    if any((probs < 0) | (probs > 1))
        error(['prototypeModel should return probabilities that are ' ...
               'between 0 and 1 (got %s)'], mat2str(probs));
    end
    
end