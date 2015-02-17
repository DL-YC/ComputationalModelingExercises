
% function PCA 
function [P,X_low] = PCA_proj(X,dim)
[U S]=eig(cov(X))
S = diag(S);
[~,idx] = sort(S, 'descend');
U = U(:,idx);
P = U(:,1:dim);
X_low = (P' * X')';
