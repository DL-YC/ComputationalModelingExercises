function theta = bayespolyfit(x,y,k,sigmay,alpha,beta)

% 
% BAYESPOLYFIT Finds a MAP estimate for a polynomial based on (x,y) data
%
% Usage: 
%
% THETA = BAYESPOLYFIT(X,Y,K,SIGMAY,ALPHA,BETA)
%
% THETA are the parameters of the polynomial
% X and Y are the input and output values respectively 
% K is the degree of the polynomial
% SIGMAY is the standard deviation of Y around the estimated function
% ALPHA and BETA are parameters of the prior
%

%sigmay = sigmay*0.05; % fixed by TLG to match true generating function

n = length(x);
x = reshape(x,n,1); % turn x into a column vector
y = reshape(y,n,1); % turn y into a column vector

sigma = alpha*beta.^(k:-1:0); % compute sigma_j as a vector
sigmad = diag(sigma.^2); % convert sigma to a covariance matrix

X = [ ones(n,1) ]; 

for i = 1:k
  X = [ x.^i X ]; % construct matrix of powers of x
end

varpost = inv(X'*X + sigmay^2*inv(sigmad)); % variance of posterior on theta

meanpost = varpost*(X'*y); % mean of posterior on theta

theta = meanpost; % posterior mean is equal to MAP estimate