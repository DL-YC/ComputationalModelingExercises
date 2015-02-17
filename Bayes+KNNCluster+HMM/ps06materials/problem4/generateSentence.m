% ---------------------------------
% Problem Set 6, Question 4 Part A
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------

% generateSentence
%
% This function takes in all the parameters of the HMM language model and produces a random sentence
% from the model.
% 
% Input:
%     initProbs: a vector of the probabilities for the value of the first hidden state
%     transitionProbs: the transition probability matrix. Entry (i,j) contains the probability of
%         transitioning from hidden state j to hidden state i.
%     emissionProbs: the emission probability matrix. Entry (i,j) contains the probability of
%         observing word i when in hidden state j.
%
% Output:
%     sentence: a vector of word indices corresponding to the observations (the words) in the
%         generated sentence. Remember that the sentence should contain exactly five words. This
%         vector should contain only the numerical word indices, not the word strings themselves.
%

function sentence = generateSentence(initProbs, transitionProbs, emissionProbs)

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% YOUR CODE HERE
states = zeros(1,5);
states(1) = randomSample(initProbs);
for n = 2:5
    probNext = transitionProbs(:,states(n-1));
    states(n) = randomSample(probNext);
end
sentence = zeros(1,5);
for m = 1:5
    sentence(m) = randomSample(emissionProbs(:,states(m)));
end
% Do not edit below this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

end
