% randomSample
%
% This function takes a vector of probability values and produces a random sample.
% 
% Input:
%     probs: a vector of probability values that must sum to 1.
%
% Output:
%     samp: a random sample from the probability distribution given in the input. This will be
%         between 1 and the length of the input vector.
%

function samp = randomSample(probs)
	if abs(1-sum(probs)) > eps
		error('Input vector "probs" must sum to 1.');
	end
	cumProbs = cumsum(probs);
	r = rand;
	samp = 1;
	while cumProbs(samp) < r
		samp = samp + 1;
	end
end
