function success = validateP2()

    success = ones(1, 1);
    
    fprintf('Checking `makeDendrogram`... ');
    try
        validateMakeDendrogram();
    catch err
        fprintf('%s\n', err.getReport());
        success(1) = 0;
    end
    
    if success(1)
        fprintf('OK\n');
    end
    
    if all(success)
        fprintf(['Hooray, your answers for Problem 2 all passed the validation ' ...
                 'script!\n']);
    else
        fprintf(['There were some problems with your solutions for Problem 2. ' ...
                 'Please make sure to fix them before submitting ' ...
                 'your problem set!\n']);
    end
end

function validateMakeDendrogram()

    load kinship.mat

    set(0,'DefaultFigureVisible','off')
    [dissimilarities, lowerDiag, linkageMatrix, plot1] = makeDendrogram(names, similarities);
    set(0,'DefaultFigureVisible','on')
    
    if ~all(size(dissimilarities)  ==  size(similarities)),
        error('dissimilarities should be a %s matrix, but your output is %s', ...
            mat2str(size(similarities)), mat2str(size(dissimilarities)));
    end

    if ~isfloat(dissimilarities),
        error('dissimilarities should be a matrix of numbers');
    end

    for i = 1:size(similarities,1),
        if dissimilarities(i,i) ~= 0,
            error('dissimilarities should have 0s down the diagonal');
        end
    end
    
    if ~all(size(lowerDiag) == [1, sum(1:size(similarities, 1)-1)]),
        error(['lowerDiag should be a 1 x 66 row vector (current dimensions ' ...
            'are %s)'], mat2str(lowerDiag));
    end
    
    if ~isfloat(lowerDiag),
        error('lowerDiag should be a vector of numbers');
    end
    
    if ~all(size(linkageMatrix) == [size(similarities, 1)-1, 3]),
        error(['linkageMatrix should be an 11 x 3 matrix (current dimensions are '...
            '%s)'], mat2str(size(linkageMatrix)));
    end
    
    if ~isfloat(linkageMatrix),
        error('linkageMatrix should be a matrix of numbers');
    end
    
    if ~all(size(plot1) == [size(similarities, 1)-1, 1]),
        error(['plot1 does not have the right number of elements (should ' ...
            'be of dimension [11 1] but is currently of dimension %s)'], ...
            mat2str(size(plot1)));
    end
    
    if ~exist('den2.jpg', 'file')
        error('den2.jpg does not exist, did you save it?');
    end
end
