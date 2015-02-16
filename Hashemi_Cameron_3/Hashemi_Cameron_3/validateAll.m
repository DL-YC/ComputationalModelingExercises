function success = validateAll()
    success = cell(1, 5);

    addpath([pwd() '/problem1']);
    success{1} = validateP1();
    
    addpath([pwd() '/problem2']);
    success{2} = validateP2();
    
    addpath([pwd() '/problem3']);
    success{3} = validateP3();
    
    addpath([pwd() '/problem456']);
    success{4} = validateP4();
    success{5} = validateP5();
    
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

