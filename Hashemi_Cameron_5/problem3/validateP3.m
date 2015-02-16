function success = validateP3()

    success = ones(1, 1);
    
    fprintf('Checking `probAzeroth`... ');
    try
        validateProbAzeroth();
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
        fprintf(['There were some problems with your solutions for Problem 1. ' ...
                 'Please make sure to fix them before submitting ' ...
                 'your problem set!']);
    end
end


function validateProbAzeroth()
    
    tossSequence = [1 1 0 1 0 1 1 1 1 1];
    
    [prob3a, prob3b, prob3c] = probAzeroth(tossSequence);
    
    if numel(prob3a) ~= 1 || numel(prob3b) ~= 1 || numel(prob3c) ~= 1,
        error(['make sure that prob3a, prob3b, and prob3c are each single numbers']);
    end
    
    if prob3a < 0 || prob3a > 1
        error(['prob3a should be a probability between 0 and 1, but your output is %s'], prob3a);
    end
    
    if prob3b < 0 || prob3b > 1
        error(['prob3b should be a probability between 0 and 1, but your output is %s'], prob3b);
    end
    
    if prob3c < 0 || prob3c > 1
        error(['prob3c should be a probability between 0 and 1, but your output is %s'], prob3c);
    end    
end