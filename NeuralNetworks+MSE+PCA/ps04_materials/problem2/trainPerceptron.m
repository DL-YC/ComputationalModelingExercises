% Based on code from from
% http://www.cs.cmu.edu/afs/cs/academic/class/15782-f06/matlab/perceptron/

function [Weights] = trainPerceptron(X, Y, bias)
    npats = size(X, 2);
    
    PlotPats(X,Y)

    Inputs = [ones(1,npats); X];
    Weights = [bias -9 9]; %three output notes; first is the bias term

    for i = 1:50
        Result = tanh(Weights * Inputs); 
        Weights = Weights + (Y-Result) * Inputs';
        PlotBoundary(Weights,i,0)
    end

    %plot final boundary
    PlotBoundary(Weights,i,1)
end

function PlotPats(P,D)
% PLOTPATS   Plots the training patterns defined by Patterns and Desired.
%
%            P - NELTS x NPATS matrix of input patterns (column vectors).
%		 The first two values in each pattern are used 
%		 as the coordinates of the point to be plotted.
%
%            D - NUNITS x NPATS matrix of desired binary output patterns.
%		 The first 2 bits of the output pattern determine the
%		 class of the point: o, +, *, or x.

    [NELTS,NPATS] = size(P);
    NUNITS = size(D,1);

    if NUNITS<2, D=[D;zeros(1,NPATS)]; end

    colordef none
    clf reset, whitebg(gcf,[0 0 0])
    hold on, box on

    % Calculate the bounds for the plot and cause axes to be drawn.
    xmin = min(P(1,:)); xmax = max(P(1,:)); xb = (xmax-xmin)*0.2;
    ymin = min(P(2,:)); ymax = max(P(2,:)); yb = (ymax-ymin)*0.2;
    %axis([xmin-xb, xmax+xb, ymin-yb, ymax+yb]);
    axis([-2, 2, -2, 2]);

    title('Input Classification');
    xlabel('x1'); ylabel('x2');

    class = 1 + D(1,:) + 2*D(2,:);
    colors = [1 0 1; 1 1 0; 0 1 1; 0 1 0];
    symbols = 'o+*x';

    for i=1:NPATS

      c = class(i) +2 ;

      plot(P(1,i),P(2,i),symbols(c),'Color',colors(c,:));
    end
end
  
function PlotBoundary(W,iter,done)
    colors = jet;

    if ~done
       lstyle = '--';
       color = colors(1+rem(3*iter+9,size(colors,1)),:);
    else
       lstyle = '-';
       color = [1 1 1];
    end

    d = W(3);
    if abs(d) < 0.001, d = 0.001; end

    plot([-2 2],(-W(2)*[-2 2]-W(1))/d,'LineStyle',lstyle,'Color',color);
    drawnow
end
