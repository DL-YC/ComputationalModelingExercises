function success = validateP2()

success = 1;

%% Check selectTargetLanguage

fprintf('Checking `selectTargetLanguage`... ');

if selectTargetLanguage(10) > 10;
    error('target language should not exceed the highest specified language')
    success = 0;
end
 
languageStore = zeros(10000,1);
for i = 1:length(languageStore)
    languageStore(i) = selectTargetLanguage(10);
end
if length(unique(languageStore)) == 1
    error('selectTargetLanguage should return different target languages if called many times')
    success = 0;
end
    
fprintf('OK\n');    


%% Check generateExample

fprintf('Checking `generateExample`... ');

if length(generateExample(1:10)) > 1;
    error('generateExample should return a single sentence')
    success = 0;
end
 
exampleStore = zeros(1000,1);
for i = 1:length(exampleStore)
    exampleStore(i) = generateExample(1:10);
end
if length(unique(exampleStore)) == 1
    error('generateExample should return different example sentences if called many times')
    success = 0;
end
    
fprintf('OK\n');    

%% Check guessLanguage

fprintf('Checking `guessLanguage`... ');

numLanguages = 10;
L = cell(1,numLanguages);
for i = 1:numLanguages
    L{i} = 1:i; % language i contains sentences 1 through i
end

if length(guessLanguage(randi(4,1,10),L)) > 1;
    error('guessLanguage should return only a single guess each time it is called')
    success = 0;
end
    
fprintf('OK\n');    

end



