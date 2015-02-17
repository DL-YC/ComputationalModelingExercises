function success = validateAll()
    success = cell(1, 4);

    addpath([pwd() '/problem1']);
    success{1} = validateP1();
    rmpath([pwd() '/problem1']);
    
    addpath([pwd() '/problem2']);
    success{2} = validateP2();
    rmpath([pwd() '/problem2']);
    
    addpath([pwd() '/problem3']);
    success{3} = validateP3();
    rmpath([pwd() '/problem3']);
    
    addpath([pwd() '/problem4']);
    success{3} = validateP4();
    rmpath([pwd() '/problem4']);
    
    allgood = 1;
    for i = 1:length(success)
        allgood = allgood & all(success{i});
    end
    
    if allgood
        fprintf(['\n---> Hooray, your answers all passed the validation ' ...
                 'scripts!\n']);
    else
        fprintf(['\n!!!! There were some problems with your solutions. ' ...
                 'Please make sure to fix them before submitting ' ...
                 'your problem set!\n']);
    end
end

