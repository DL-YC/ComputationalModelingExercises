% ---------------------------------
% Problem Set 3, Question 5, Part A
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function probCatA = prototypeModel(prototypes, testStimuli, s)
% function prototypeModel.m 
% 
% Implements a prototype model of categorization.
%
% Input:
%    prototypes:
%        2-by-M matrix of the category prototypes. The first row is the
%        prototype for category A, and the second row is the prototype
%        for category B.
%    testStimuli:
%        N-by-M matrix of test stimuli, where each row is one stimulus
%        and each column is a feature. The stimulus features are
%        binary-valued (0 or 1).
%    s:
%        A number corresponding the s parameter in Equation 4
%        (optional; default value is 0.1)
%
% Output:
%    probCatA:
%        N-by-1 column vector of category assignment probabilities for
%        the prototype model trained on the training stimuli and
%        tested on the test stimuli. probCatA(i) gives the probability
%        that test stimulus i belongs to category A.
    
    if (nargin < 3)
        % if s was not passed in, then set it to 0.1
        s = 0.1;
    end

    % Do not edit above this line!
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    % YOUR CODE HERE
    probCatA = contextModel(prototypes,[1 2], testStimuli,s);
    

    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % Do not edit below this line!

end
