% ---------------------------------
% Problem Set 6, Question 4 Part B
% ---------------------------------
%
% Author: Cameron Hashemi
% Collaborators: 
%
% ---------------------------------

% partOfSpeechTagging.m
%
% This function uses the provided viterbi function to perform part-of-speech 
% tagging on the sentences in the array sentences.
%
% Input (optional):
%     sentences: you can override the default sentence array defined in the
%       problem set and below by passing a new array to partOfSpeechTagging.
%
%    NOTE: When you generate answers for the problem set you should call 
%       partofSpeechTagging WITHOUT any input arguments (i.e., using the 
%       default sentences array defined below)
%
% Output:
%     sentences: the 5 x 5 cell array of words provided at the beginning of 
%		the function / passed as an optional argument to
%		partofSpeechTagging
%
% 	  speechTags: a 5 x 5 cell array of parts of speech for the corresponding 
%       words in sentences

function [sentences, speechTags] = partOfSpeechTagging(varargin)

load hmmLanguageModel.mat;

if isempty(varargin),
    sentences = {'exhausted' 'dogs' 'love' 'marbled' 'parks'; ...
        'inappropriate' 'sally' 'love' 'inappropriate' 'reddit'; ...
        'big' 'big' 'john' 'parks' 'sally'; ...
        'sally' 'dogs' 'big' 'exhausted' 'john'; ...
        'big' 'john' 'exhausted' 'exhausted' 'dogs'};

elseif numel(varargin) == 1,
%   Use only for debugging/validate purposes!
    sentences = varargin{1};
    
else
    error(['Too many inputs. partOfSpeechTagging takes at most a single argument!']);
end

% Do not edit above this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% YOUR ANSWER HERE

speechTags = zeros(size(sentences,1),size(sentences,2));
for n = 1:size(speechTags,1)
    wordIndices = zeros(1,size(speechTags,2));
    for m = 1:size(speechTags,2)
        wordIndices(m) = strmatch(sentences(n,m),words);
    end
    speechTags(n,:) = viterbi(wordIndices,initProbs,transitionProbs,emissionProbs);
end

speechTags = partsOfSpeech(speechTags);

% Do not edit below this line!
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

end