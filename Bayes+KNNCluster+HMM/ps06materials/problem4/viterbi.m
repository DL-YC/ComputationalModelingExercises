% viterbi
%
% This function takes in a setence and the parameters of the HMM language model and calls the HMM
% Viterbi algorithm from the Matlab statistics toolbox to produce the most likely sequence of hidden
% state variables for the given sentence.
% 
% Input:
%     sentence: a vector of word indices corresponding to the observations (the words) in the
%         sentence. This vector should contain only the numerical word indices, not the word strings
%         themselves.
%     initProbs: a vector of the probabilities for the value of the first hidden state
%     transitionProbs: the transition probability matrix. Entry (i,j) contains the probability of
%         transitioning from hidden state j to hidden state i.
%     emissionProbs: the emission probability matrix. Entry (i,j) contains the probability of
%         observing word i when in hidden state j.
%
% Output:
%     states: a vector of hidden state indices corresponding to the most likely sequence of hidden
%         states (parts of speech) to have generated the input sentence. This vector contains the
%         numerical hidden state indices, not the part of speech strings themselves.
%

function states = viterbi(sentence, initProbs, transitionProbs, emissionProbs)
	
	[nObs nStates] = size(emissionProbs);
	
	trans = zeros(nStates+1);
	trans(2:end,2:end) = transitionProbs';
	trans(1,2:end) = initProbs';
	
	emis = [zeros(1,nObs); emissionProbs'];
	
	states = hmmviterbi_nostats(sentence, trans, emis)-1;

end
