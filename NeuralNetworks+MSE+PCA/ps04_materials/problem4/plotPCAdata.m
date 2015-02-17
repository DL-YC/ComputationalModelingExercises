
close all;

% Dataset A
clear; 
load A.mat;
[~,X_low] = PCA_proj(X,1);
figure;
hold on;
for i = 1:length(X)
	plot(X_low(i,1),1,'.','Color',cm(C(i),:));
end
axis equal;
title('Dataset A');



% Dataset B
clear; 
load B.mat;
[~,X_low] = PCA_proj(X,2);
figure;
hold on;
for i = 1:length(X)
	plot(X_low(i,1),X_low(i,2),'.','Color',cm(C(i),:));
end
axis equal;
title('Dataset B');



% Dataset C
clear; 
load C.mat;
[~,X_low] = PCA_proj(X,2);
figure;
hold on;
for i = 1:length(X)
	plot(X_low(i,1),X_low(i,2),'.','Color',cm(C(i),:));
end
axis equal;
title('Dataset C');
