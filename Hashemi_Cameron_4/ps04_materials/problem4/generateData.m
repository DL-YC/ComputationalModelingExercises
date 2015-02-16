
close all;

% generate 1D random data
N = 100;
x=randn(N,1);
y=x * 3.0 + 5.0;
X = [x,y];

cm = colormap('jet');
C = x;
C = C-min(C);
C = round(C/max(C)*(length(cm)-1)+1);

figure(1);
hold on;
for i = 1:length(X)
	plot(X(i,1),X(i,2),'.','Color',cm(C(i),:));
end
axis equal;
grid on
title('Dataset A');

save A.mat X C cm;


% generate 2D random data
N = 100;
mu = [1,3,4]; C = [2 0.8; 0.8 5; 0.8 0.8];
x = randn(N,2);
X = (C * x')' + repmat(mu,[N,1]);

cm = colormap('jet');
C = x(:,2);
C = C-min(C);
C = round(C/max(C)*(length(cm)-1)+1);

figure(2);
hold on;
for i = 1:length(X)
	plot3(X(i,1),X(i,2),X(i,3),'.','Color',cm(C(i),:));
end
axis equal;
view(3);
grid on
title('Dataset B');

save B.mat X C cm;

% generate 3D Swiss roll data
N = 800;
phi = (3*pi/2)*(1+2*rand(1,N));
height = 50*rand(1,N);
X = [2*phi.*cos(phi); height; phi.*sin(phi)]';

cm = colormap('jet');
C = phi-min(phi);
C = round(C/max(C)*(length(cm)-1)+1);

figure(3);
hold on;
for i = 1:length(X)
	plot3(X(i,1),X(i,2),X(i,3),'.','Color',cm(C(i),:));
end
axis equal;
view([18.5,6]);
grid on
title('Dataset C');

save C.mat X C cm;
