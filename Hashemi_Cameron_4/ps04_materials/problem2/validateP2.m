function success = validateP2()
    success = 1; 
    fprintf('Checking `Problem2`... ');
    try
        validateProblem2();
        
    catch err
        fprintf('%s\n', err.getReport());
        success = 0;
    end
    
    if success
        fprintf('OK\n');
    end
    
    if all(success)
        fprintf(['Hooray, your answers for Problem 2 all passed the validation ' ...
                 'script!\n']);
    else
        fprintf(['There were some problems with your solutions for Problem 2. ' ...
                 'Please make sure to fix them before submitting ' ...
                 'your problem set!']);
    end   
end

function validateProblem2()
    set(0,'DefaultFigureVisible','off');  
    [inputs, ORoutput, XORoutput, ORweights, ORprediction, XORweights,...
        XORprediction, XORweights_mp, XORprediction_mp] = Problem2();
    set(0,'DefaultFigureVisible','on');  
    %% Input checks
    if ~all(size(inputs) == [2 4])
        error(['inputs should be a 2*4 matrix, but your output is %s'], mat2str(size(inputs)));
    end
    
    if ~all(all(arrayfun(@(x) x == 1 || x == -1, inputs )))
        error(['inputs should contain only the values 1 or -1']);
    end
    
    if ~all(sum(inputs,2) == 0)
        error(['each input vector should contain an equal number of positive and negative examples ']);
    end 
     
    %% OR checks
    if ~all(size(ORoutput) == [1 4])
        error(['ORoutput should be a 1*4 matrix, but your ORoutput is %s'], mat2str(size(inputs)));
    end
    
    if ~all(all(arrayfun(@(x) x == 1 || x == -1, ORoutput)))
        error(['ORoutput should contain only the values 1 or -1']);
    end
    
    if ~all((ORoutput == 1) == ((inputs(1,:) == 1) | (inputs(2,:) == 1)))
        error(['ORoutput should be the output of the logical OR function applied to the two rows of the matrix `inputs`; false should be represented with -1 and true with 1']);
    end
    
    %% XOR checks
    if ~all(size(XORoutput) == [1 4])
        error(['XORoutput should be a 1*4 matrix, but your XORoutput is %s'], mat2str(size(inputs)));
    end
    
    if ~all(all(arrayfun(@(x) x == 1 || x == -1, XORoutput)))
        error(['XORoutput should contain only the values 1 or -1']);
    end
    
    if ~all((XORoutput == 1) == (xor(inputs(1,:) == 1,inputs(2,:) == 1)))
        error(['XORoutput should be the output of the logical XOR function applied to the two rows of the matrix `inputs`; false should be represented with -1 and true with 1']);
    end
    
    %% ORweights checks
    if ~all(size(ORweights) == [1 3])
        error(['ORweights should be a 1*3 matrix corresponding to two connection weights and a bias weight, but your ORweights is %s'], mat2str(size(inputs)));
    end
    
    %% ORprediction checks
    if ~all(size(ORprediction) == [1 4])
        error(['ORprediction should be a 1*4 matrix, but your ORprediction is %s'], mat2str(size(inputs)));
    end
    
    if ~all(ORprediction <= 1 & ORprediction >= -1)
        error(['ORprediction values should be between -1 and 1 (inclusive)']);
    end
    
    %% XORweights checks
    if ~all(size(XORweights) == [1 3])
        error(['XORweights should be a 1*3 matrix corresponding to two connection weights and a bias weight, but your ORweights is %s'], mat2str(size(inputs)));
    end
    
    %% XORprediction checks
    if ~all(size(XORprediction) == [1 4])
        error(['XORprediction should be a 1*4 matrix, but your XORprediction is %s'], mat2str(size(inputs)));
    end
    
    if ~all(XORprediction <= 1 & XORprediction >= -1)
        error(['XORprediction values should be between -1 and 1 (inclusive)']);
    end
    
    %% XORweights_mp checks
    if ~all(size(XORweights_mp) == [2 1])
        error(['XORweights_mp should be a 2*1 cell array with each cell corresponding to a layer in the network, but your XORweights_mp is %s'], mat2str(size(inputs)));
    end
    
    if ~all(size(XORweights_mp{1}) == [2 3])
        error(['The first layer in XORweights_mp should be a 2*3 matrix, but your in you XORweights_mp the first layer is %s'], mat2str(size(inputs)));
    end
    
    if ~all(size(XORweights_mp{2}) == [1 3])
        error(['The second layer in XORweights_mp should be a 1*3 matrix, but your in you XORweights_mp the second layer is %s'], mat2str(size(inputs)));
    end        
    
    %% XORprediction_mp checks
    if ~all(size(XORprediction_mp) == [1 4])
        error(['XORprediction_mp should be a 1*4 matrix, but your XORprediction_mp is %s'], mat2str(size(inputs)));
    end
    
    if ~all(XORprediction_mp <= 1 & XORprediction_mp >= -1)
        error(['XORprediction_mp values should be between -1 and 1 (inclusive)']);
    end
     
end