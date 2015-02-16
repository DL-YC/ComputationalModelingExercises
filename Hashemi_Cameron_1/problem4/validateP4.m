function success = validateP4()

success = 1;

%% Check Part A

fprintf('Checking `abcdSentences`... ');

output = abcdSentences();

if isempty(output)
    success = 0;
    error('invalid value found in abcdSentences');
end

fprintf('OK\n');

%% Check Part B

fprintf('Checking `abcdGrammar`... ');

sentence = abcdGrammar();

if isempty(sentence) || all(isspace(sentence))==1,
    success = 0;
    error(['empty output. make sure that abcdGrammar() always returns ' ...
        'non-empty combinations of a b c and d']);
end

if ~ischar(sentence),
    success = 0;
    error(['unrecognized output type. make sure abcdGrammar() ' ...
        'returns a character string!']);
end

idx = regexp(sentence, '[^\s]');

if all(isletter(sentence(idx)))~=1 || ~isempty(regexpi(sentence, '[e-z]', 'once')),
    success = 0;
    error(['unrecognized character(s) in output. make sure abcdGrammar() ' ...
        'returns only combinations of a b c and d.']);
end

fprintf('OK\n');

%% Check Part C

fprintf('Checking `xynznGrammar`... ');

n=4;
sentence2 = xynznGrammar(n);

if isempty(sentence2) || all(isspace(sentence2))==1,
    success = 0;
    error(['empty output. make sure that xynznGrammar(n) always returns ' ...
        'non-empty combinations of x y and z for n > 0.']);
end

if ~ischar(sentence2),
    success = 0;
    error(['unrecognized output. make sure xynznGrammar(n) ' ...
        'returns a character string!']);
end

idx2 = regexp(sentence2, '[^\s]');

if all(isletter(sentence2(idx2)))~=1 || ~isempty(regexpi(sentence2, '[a-w]', 'once')),
    success = 0;
    error(['unrecognized character(s) in output. make sure xynznGrammar() ' ...
        'returns only combinations of x y and z.']);
end

fprintf('OK\n');

%% Print out success/failure

if success;
    fprintf('Hooray, your answers passed the validation script!\n')
end
