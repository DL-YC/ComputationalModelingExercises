% ---------------------------------
% Problem Set 3, Question 4, Part B
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 

function probCatA = contextModel(exemplars, exemplarCategories, testStimuli, s)
% function contextModel.m 
%
% Implements Medin and Schaffer's context model for categorization.
%
% Input:
%    exemplars:
%        N-by-M matrix of N training stimuli, where each row is one
%        stimulus and each column is a feature. The stimulus features
%        are binary-valued (0 or 1).
%    exemplarCategories: 
%        N-by-1 column vector of category assignments for the training
%        stimuli. Legal values are 1 and 2, representing category A
%        and category B, respectively.
%    testStimuli: 
%        K-by-M matrix of K test stimuli, in the same format as
%        exemplars.
%    s:
%        A number corresponding the s parameter in Equation 4
%        (optional; default value is 0.1)
%
% Output:
%    probCatA: 
%        K-by-1 column vector of category assignment probabilities for
%        the context model trained on the training stimuli and tested
%        on the test stimuli. probCatA(i) gives the probability that
%        test stimulus i belongs to category A.
    
    if (nargin < 4)
        % if s was not passed in, then set it to 0.1
        s = 0.1;
    end

    % Do not edit above this line!
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    % YOUR CODE HERE
    A = find(exemplarCategories==1);
    B = find(exemplarCategories==2);
    
    rows = size(testStimuli,1);

    probCatA = zeros(rows,1);
    
    for i = 1:rows
        simA = 0;
        simB = 0;
        for j = 1:length(A)
            simA = simA + calculateSimilarity(exemplars(A(j),:),testStimuli(i,:),s);
        end

        for j = 1:length(B)
            simB = simB + calculateSimilarity(exemplars(B(j),:),testStimuli(i,:),s);
        end

        probCatA(i) = simA/(simA+simB);
    end
    
    % ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    % Do not edit below this line!

end
