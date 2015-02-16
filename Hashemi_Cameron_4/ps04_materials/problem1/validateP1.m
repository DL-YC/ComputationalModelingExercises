function success = validateP1()

success = ones(2, 1);
    
fprintf('Checking `calculateWeights`... ');
    try
        validateCalculateWeights();
    catch err
        fprintf('%s\n', err.getReport());
        success(1) = 0;
    end
    
    if success(1)
        fprintf('OK\n');
    end
    
    fprintf('Checking `Problem1`... ');
    try
        validateP1main();
    catch err
        fprintf('%s\n', err.getReport());
        success(2) = 0;
    end
    
    if success(2)
        fprintf('OK\n');
    end    
    
     if all(success)
        fprintf(['Hooray, your answers for Problem 1 all passed the validation ' ...
                 'script!\n']);
    else
        fprintf(['There were some problems with your solutions for Problem 1. ' ...
                 'Please make sure to fix them before submitting ' ...
                 'your problem set!']);
    end
    
end

%%
function validateCalculateWeights()

testW = calculateWeights(zeros(4),[1 -1; 1 -1; 1 1; 1 1],[-1 1; 1 -1; -1 -1; 1 1]);

%check if dimensions are the same as the original weights 
if ~all(size(testW) == [4 4])    
    error(['calculateWeights.m should return a 4*4 matrix, but your output is %s'], mat2str(size(testW)));
end

%weightMatrix should sum to zero
if sum(sum(testW)) ~= 0
    error(['The matrix returned by calculateWeights.m (with W=zeros(4)) should sum to 0, but your output is %s'], mat2str(sum(sum(testW))));
end

testW = calculateWeights(ones(4),[1 -1; 1 -1; 1 1; 1 1],[-1 1; 1 -1; -1 -1; 1 1]);

%weightMatrix should sum to zero
if sum(sum(testW)) == 0
    error(['The matrix returned by calculateWeights.m (with W=ones(4)) should NOT sum to 0']);
end

testW = calculateWeights(zeros(4),[1 -1 1; 1 -1 1; 1 1 1; 1 1 1],[-1 1 1; 1 -1 1; -1 -1 1; 1 1 1]);

%check if dimensions are the same as the original weights 
if ~all(size(testW) == [4 4])    
    error(['calculateWeights.m should return a 4*4 matrix, but your output is %s'], mat2str(size(testW)));
end

testW = calculateWeights(zeros(3),[1 -1 1; 1 -1 1; 1 1 1],[-1 1 1; 1 -1 1; -1 -1 1]);

%check if dimensions are the same as the original weights 
if ~all(size(testW) == [3 3])    
    error(['calculateWeights.m should return a 3*3 matrix, but your output is %s'], mat2str(size(testW)));
end

end

%%
function validateP1main()

[updatedW, yhatDog, yhatCat, yhatAnimalX2,yhatAnimalX5,yhatAnimalX8] = Problem1();

%check if dimensions are the same as the original weights 
if ~all(size(updatedW) == [4 4])    
    error(['updatedW should be a 4*4 matrix, but your output is %s'], mat2str(size(updatedW)));
end

%weightMatrix should sum to zero
if sum(sum(updatedW)) ~= 0
    error(['updatedW should sum to 0, but your output is %s'], mat2str(sum(sum(updatedW))));
end

%iterate through the remaining values and check dimensionality
sizeCheck = cell2mat(cellfun(@(x) all(size(x) == [4 1]) , {yhatDog yhatCat yhatAnimalX2 yhatAnimalX5,yhatAnimalX8},'UniformOutput',false));
returnVarNames = {'yhatDog', 'yhatCat', 'yhatAnimalX2','yhatAnimalX5','yhatAnimalX8'};

for i=1:length(sizeCheck)
    if ~sizeCheck(i)
        error('%s should a 4*1 matrix, but your output is %s', returnVarNames{i}, mat2str(size(eval(returnVarNames{i}))));
    end
end

end
