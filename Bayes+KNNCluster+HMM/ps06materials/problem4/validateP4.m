function success = validateP4()
success = ones(1, 2);

fprintf('Checking `generateSentence`... ');
try
    validateGenerateSentence();
catch err
    fprintf('%s\n', err.getReport());
    success(1) = 0;
end

if success(1)
    fprintf('OK\n');
end

fprintf('Checking `partOfSpeechTagging`... ');
try
    validatePartOfSpeechTagging();
catch err
    fprintf('%s\n', err.getReport());
    success(2) = 0;
end

if success(2)
    fprintf('OK\n');
end


if all(success)
    fprintf(['Hooray, your answers for Problem 4 passed the validation ' ...
        'script!\n']);
else
    fprintf(['There were some problems with your solutions for Problem 4. ' ...
        'Please make sure to fix them before submitting ' ...
        'your problem set!\n']);
end
end

function validateGenerateSentence()

load hmmLanguageModel.mat

sentence = generateSentence(initProbs, transitionProbs, emissionProbs);

if ~all(size(sentence) == [1 5])
    error(['sentence vector should have dimensions [1 5], but '...
        'yours has dimensions %s'], mat2str(size(sentence)));
end

if max(sentence) > 10 || min(sentence) < 1,
    error(['all indices in  the sentence vector should be between 1 and 10']);
end

end

function validatePartOfSpeechTagging()

testSentences = {'sally' 'reddit' 'john' 'big' 'parks'; ...
    'reddit' 'parks' 'john' 'big' 'sally'};

testTags = {'noun'    'noun'    'noun'    'adjective'    'noun';
    'noun'    'verb'    'noun'    'adjective'    'noun'};

[sentences, speechTags] = partOfSpeechTagging(testSentences);

if ~all(size(speechTags) == size(sentences)),
    error(['There should be the same number of words in speechTags as there are words in the '...
        'sentences matrix.']);
end

if ~iscell(speechTags) || ~iscell(sentences),
    error(['sentences and speechTags should be cell arrays.']);
end

if ~all(all(cellfun(@ischar,sentences))) || ~all(all(cellfun(@ischar, speechTags))),
    error(['The entries in sentences and speechTags should be strings (i.e., words).']);
end

if ~all(cellfun(@strcmp, speechTags, testTags)),
    error(['Incorrect speech tags generated on the testSentences defined '...
        'in validateP4.']);
end
end
