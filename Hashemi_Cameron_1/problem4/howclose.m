% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function sentence = howclose

% Produces sentences of the form (nearly)^(n)(finished) for n > 0 note
% that there are multiple functions defined in this file!

% set the variable 'sentence' to the output of the function
% 'adjective_phrase'
sentence = [ adjective_phrase ];


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function a_output = adjective_phrase

% Randomly picks a 0 or 1 and prepends the word 'nearly' to the start
% of a phrase and either calls the function 'adjective_phrase'
% recursively, or calls the function 'noun'.

% fix() rounds down to 0, so this command is a way to randomly
% generate a 0 or a 1
action = fix(2 * rand); 

% choose an action to take
if (action == 0)
    % here we are calling the function itself again and prepending the
    % word 'nearly' to the output of whatever 'adjective_phrase'
    % returns note that 'a_output' will not be set until this new call
    % to 'adjective_phrase' is finished.
    a_output = [ 'nearly ' adjective_phrase ];
    
else
    % here we are prepending the word 'nearly' to the output of the
    % function 'noun', which we see below is just the word 'finished'.
    % if this function gets called, it will essentially end things.
    a_output = [ 'nearly ' noun ];
    
end


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function n_output = noun

% Simply returns the word 'finished'
n_output = 'finished';





