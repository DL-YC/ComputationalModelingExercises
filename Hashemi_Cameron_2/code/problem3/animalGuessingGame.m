function trialData = animalGuessingGame(names,features,data)
% This function plays an animal guessing game for multiple trials. In
% each trial the number of possible animals to choose from is varied,
% changing the difficulty of the game. The function will return
% a matrix <trialData> which contains the number of guesses it took
% to correctly guess an animal for each trial (along rows) and setting
% of the number of animals (columns). Make sure to save trialData for later
% use in the problem set.
%
% To begin the came, call it like this:
% >> trialData = animalGuessingGame;
%
% (no input needed for the function)

% LOAD REQUIRED DATA
load 50animalbindat.mat;

% SET UP SOME CONSTANTS
nAnimals = 2.^[1:5];
nTrials = 3;

% PRINT OUT THE RULES OF THE GAME
displayRules

% SET UP STORAGE FOR TRIAL DATA SIZE =  [#Trials x #Animals]
trialData = zeros(nTrials,length(nAnimals));

for iT = 1:nTrials % LOOP OVER TRIALS
	for jN = 1:length(nAnimals) % LOOP OVER # OF POSSIBLE ANIMALS

		% SET UP TRIAL
		[ourAnimalIndex,userOptions,listOfFeatures] = guessingGameSetup(names,features,data);

		% PLAY THE GAME FOR A TRIAL
		trialData(iT,jN) = playGuessingGame(names,ourAnimalIndex,userOptions,listOfFeatures);
		if iT ~= nTrials || jN ~= length(nAnimals)
			fprintf('\nLet''s play again\n');
		else
			fprintf('\nFinished playing');
		end
	end
end

function displayRules
% Display the rules of the guessing game to user
instructions = 'Hello! Welcome to our game.';
instructions = strcat(instructions, ' In this game, you will be shown some features of a particular animal.');
fprintf('\n%s\n',instructions);
instructions = 'Your goal is to guess which animal has these features.';
instructions = strcat(instructions, ' We will first show you two features,');
fprintf('%s\n',instructions);
instructions = 'and then a list of animals to guess from. If you guess incorrectly,';
instructions = strcat(instructions, ' we will show you more features,');
fprintf('%s\n',instructions);
instructions = 'and you will get more chances to guess the animal.';
fprintf('%s\n',instructions);
instructions = 'If you cannot guess the animal correctly after we have displayed all its features';
instructions = strcat(instructions, ' then you lose.');
fprintf('%s\n',instructions);

instructions = 'We''ll play the game many times, each time varying the';
instructions = strcat(instructions, ' number animals to choose from.');
fprintf('\n%s',instructions);
instructions = 'Press any key to continue.';
fprintf('\n%s\n',instructions);
pause
clc
end % END displayRules

function [ourAnimalIndex,userOptions,listOfFeatures] = guessingGameSetup(names,features,data);
% Set up arguments for a guessing game trial

	% CHOOSE AN ANIMAL AT RANDOM
	ourAnimalIndex = randomAnimal(names);

	% FIND OUR ANIMAL'S FEATURES
	listOfFeatures = findFeatures(ourAnimalIndex,features,data);

	% RANDOMIZE FEATURES
	listOfFeatures = listOfFeatures(randperm(length(listOfFeatures)));

	numberOfAnimals = nAnimals(jN);
	userOptions = makeAnimalList(ourAnimalIndex,names,numberOfAnimals);
end % END guessingGameSetup


function [nGuesses] = playGuessingGame(names,ourAnimalIndex,userOptions,listOfFeatures)
% Play a guessing game trial

	% iterate through the list of features for this animal
	nGuesses=1;
	endGame = false;
	win = false;
	while (endGame == false),

	    % display the features (adding a new feature for each wrong guess)
	    fprintf('\nThis animal has the following features:\n');
	    disp(listOfFeatures(1:nGuesses+1));

	    % display the animals the user gets to choose from
	    fprintf('Choose from the following selection of animals:\n');
	    disp(userOptions);
	    fprintf('\n');

	    % grab the user's guess
	    userInput = input('Enter the name of the animal for your guess: ','s');

	    correct = checkGuess(userInput,ourAnimalIndex,names);

	    if correct,
		    clc
	        fprintf('**Congrats, you picked the animal and won the game!\n');
	        endGame = true;
	        win = true;
	    else
	        % increment the counter nGuesses
	        % remember it keeps track of how many features we show the user
	        nGuesses=nGuesses+1;

	        % check to make sure we're not at the end of the number of features for
	        % our animal - this means the user loses if we get to the end of the list
	        if ((nGuesses+1) == length(listOfFeatures))
		        clc
	            fprintf('\nSorry, but you have lost the game :(\n');
	            fprintf('The correct animal was a %s\n',names{ourAnimalIndex});

	            % even though they weren't correct, we set it to true to end the while
	            % loop and exit the game
	            endGame = true;
	        else
	            % they guessed incorrectly but are not at the end of the
	            % game
	            clc
	            fprintf('\nSorry, you guessed incorrectly. Try again!\n');
	        end
	    end
	end
end % END playGuessingGame

function [userOptions] = makeAnimalList(ourAnimalIndex,names,numberOfAnimals)
% Return a list of animals for the user to select from

    % randomly permute a list of the numbers 1 through length(names)
    randList = randperm(length(names));

    % grab the first N = numberOfAnimals from this list of random numbers
    otherAnimals = randList(1:numberOfAnimals);

    % check to see if our animal is in the list, if it is, do nothing. if it
    % isn't, overwrite the last element with our animal
    if(find(otherAnimals == ourAnimalIndex))
        %do nothing, it's in the list
    else
        % overwrite the last element with animalIndex
        otherAnimals(numberOfAnimals) = ourAnimalIndex;
    end

    % sort the list to hide our animal (ie: not have it always be last!)
    sortedList = sort(otherAnimals);

    % return a cell array vector of the sortedList
    userOptions = names(sortedList);
end


function isCorrect = checkGuess(userInput,ourAnimalIndex,names)
% function: checkGuess.m
%   checks the user's guess to see if it was correct
    animalGuessIndex = find(strcmp(names,userInput));

    if (ourAnimalIndex == animalGuessIndex),
        isCorrect = true;
    else
        isCorrect = false;
    end
end % END checkGuess

function animal = randomAnimal(names)
% Pick a ranomd animal from <names>
        animal = round(length(names)*rand());
end % END randomAnimal

function [listOfFeatures] = findFeatures(animalIndex,features,data)
% Find a list of features of an animal corresponding to <animalIndex>
    [listOfFeatures] = features(~~ data (animalIndex,:));
end % END findFeatures

end % END animalGuessingGame