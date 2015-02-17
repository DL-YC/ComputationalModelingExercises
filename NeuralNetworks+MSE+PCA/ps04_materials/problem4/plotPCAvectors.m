
close all;

% Dataset A
clear; 
load A.mat;
figure;
hold on;
for i = 1:length(X)
	plot(X(i,1),X(i,2),'.','Color',cm(C(i),:));
end
axis equal;
[P,~] = PCA_proj(X,1);
centers = mean(X);
scale = 5;
line([scale*P(1,1)+centers(1), centers(1)],...\
    [scale*P(2,1)+centers(2), centers(2)], ...\
    'Color','r', ...\
    'LineWidth',6);
title('Dataset A');



% Dataset B
clear; 
load B.mat;
figure;
hold on;
for i = 1:length(X)
	plot3(X(i,1),X(i,2),X(i,3),'.','Color',cm(C(i),:));
end
axis equal;
view(3);
[P,~] = PCA_proj(X,2);
centers = mean(X);
scale = 5;
line([scale*P(1,1)+centers(1), centers(1)],...\
     [scale*P(2,1)+centers(2), centers(2)], ...\
	 [scale*P(3,1)+centers(3), centers(3)], ...\
    'Color','r', ...\
    'LineWidth',6);
line([scale*P(1,2)+centers(1), centers(1)],...\
    [scale*P(2,2)+centers(2), centers(2)], ...\
	[scale*P(3,2)+centers(3), centers(3)], ...\
    'Color','g',...\
    'LineWidth',4);
title('Dataset B');



% Dataset C
clear; 
load C.mat;
figure;
hold on;
for i = 1:length(X)
	plot3(X(i,1),X(i,2),X(i,3),'.','Color',cm(C(i),:));
end
axis equal;
view([18.5,6]);
[P,~] = PCA_proj(X,2);
centers = mean(X);
scale = 15;
line([scale*P(1,1)+centers(1), centers(1)],...\
     [scale*P(2,1)+centers(2), centers(2)], ...\
	 [scale*P(3,1)+centers(3), centers(3)], ...\
    'Color','r', ...\
    'LineWidth',6);
line([scale*P(1,2)+centers(1), centers(1)],...\
     [scale*P(2,2)+centers(2), centers(2)], ...\
	 [scale*P(3,2)+centers(3), centers(3)], ...\
    'Color','g',...\
    'LineWidth',4);
title('Dataset C');
