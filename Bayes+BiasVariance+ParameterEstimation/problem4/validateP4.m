function success = validateP4()

    success = ones(1, 1);
    
    fprintf('Checking `graphicalModel`... ');
    try
        validateGraphicalModel();
    catch err
        fprintf('%s\n', err.getReport());
        success(1) = 0;
    end
    
    if success(1)
        fprintf('OK\n');
    end
    
    if all(success)
        fprintf(['Hooray, your answers for Problem 4 all passed the validation ' ...
                 'script!\n']);
    else
        fprintf(['There were some problems with your solutions for Problem 1. ' ...
                 'Please make sure to fix them before submitting ' ...
                 'your problem set!']);
    end
end


function validateGraphicalModel()
    
    [jointProbTable, condTable, condXgivenZ, condXgivenYandZ ] = graphicalModel();
    
    if sum(jointProbTable) < .999 || sum(jointProbTable) > 1.001
        error(['jointProbTable should sum to 1, but your output is %s'], sum(jointProbTable));
    end
    
    if ~all(arrayfun(@(x) x >= 0 & x <= 1, jointProbTable))
        error(['probabilities in jointProbTable should be between 0 and 1']);
    end
    
    if sum(condTable) < .999 || sum(condTable) > 1.001
        error(['condTable should sum to 1, but your output is %s'], sum(condTable));
    end
    
    if ~all(arrayfun(@(x) x >= 0 & x <= 1, condTable))
        error(['probabilities in condTable should be between 0 and 1']);
    end
    
    if condXgivenZ < 0 || condXgivenZ > 1
        error(['condXgivenZ should be a probability between 0 and 1, but your output is %s'], condXgivenZ);
    end 
    
    if condXgivenYandZ < 0 || condXgivenYandZ > 1
        error(['condXgivenYandZ should be a probability between 0 and 1, but your output is %s'], condXgivenYandZ);
    end 
end