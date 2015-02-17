function theta = funcsamp(alpha,beta,k);

%
% FUNCSAMP samples a k-th order polynomial from a Gaussian prior
%
% Usage:
% 
% THETA = FUNCSAMP(ALPHA,BETA,K)
%
% THETA are the parameters of the polynomial
% ALPHA and BETA are parameters of the prior
% K is the degree of the polynomial
%

try
    rng(22875, 'twister');
catch err
    fprintf('Warning: rng failed, falling back to rand\n');
    rand('twister', 22875)
end

sigma = alpha*beta.^(k:-1:0); % compute sigma_j as a vector

theta = randn(1,k+1).*sigma; % randn is distributed Gaussian(0,1), so
                           % randn*sigma is distributed Gaussian(0,sigma)




