% file: goldGame.m

% The number of possible languages
numLanguages = 10;

% Construct the set of languages as a cell array
L = cell(1,numLanguages);
for i = 1:numLanguages
    L{i} = 1:i; % language i contains sentences 1 through i
end


%-------------------------------
% THIS IS ONE OF YOUR FUNCTIONS!
%-------------------------------
% Randomly select a target language
target = selectTargetLanguage(numLanguages);



% Whether the game is over (true when the learner guesses correctly)
gameOver = false;
% Vector of all observations seen
observations = [];
% Vector of all guesses made
guesses = [];

while ~gameOver
    %-------------------------------
    % THIS IS ONE OF YOUR FUNCTIONS!
    %-------------------------------
    % Randomly generate an observation from target language
    obs = generateExample(L{target});
    
    
    observations = [observations obs]; 
    
    disp('Observations:');
    disp(observations);
    
    
    %-------------------------------
    % THIS IS ONE OF YOUR FUNCTIONS!
    %-------------------------------
    % Guess the target language based on the observations
    guess = guessLanguage(observations, L);
    
    
    
    fprintf(1, 'Your guess is %d', guess);
    guesses = [guesses guess]; %#ok<AGROW>

    if (guess == target),
        fprintf(1, ' ==> You win!\n\n');
        gameOver = true;
	else
        fprintf(1, ' ==> Incorrect guess.\n\n');
    end
    
end

% Replay all observations and all responses 
disp('Your observations:');
disp(observations);
disp('Your guesses:');
disp(guesses);
