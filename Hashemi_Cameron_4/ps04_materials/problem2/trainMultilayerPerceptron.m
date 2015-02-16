% Based on code from from
% http://www.cs.cmu.edu/afs/cs/academic/class/15782-f06/matlab/recurrent/

function [net] = trainMultilayerPerceptron(X, Y, num_hidden, num_iters)

%% Parameters
% increment to the derivative of the transfer function (Fahlman's trick)
DerivIncr = 0.2;
% momentum parameter
Momentum = 0.05;
% learning rate parameter
LearnRate = 0.001;

% figure out the number of input and output nodes we need
num_output = size(Y, 1);
num_input = size(X, 1);
num_train = size(X, 2);
if num_train ~= size(Y, 2)
    error('unequal number of input and output examples');
end

%% Allocation
% seed the random number generator
rng(2, 'twister');
% create a cell array to hold the network weights
net = cell(2, 1);
net{1} = rand(num_hidden, num_input + 1) - 0.5;
net{2} = rand(num_output, num_hidden + 1) - 0.5;

% the row of ones is the bias
Input1 = [X; ones(1, num_train)];
Desired = Y;

deltaW1 = 0;
deltaW2 = 0;

%% Training
for i=1:num_iters
    %% Forward propagate activations
    % input --> hidden
    NetIn1 = net{1} * Input1;
    Result1 = tanh(NetIn1);

    % hidden --> output
    % we again add a row of ones for bias
    Input2 = [Result1; ones(1, num_train)];
    NetIn2 = net{2} * Input2;
    Result2 = tanh(NetIn2);

    %% Backward propagate errors
    % output --> hidden
    Result2Error = Result2 - Desired;
    In2Error = Result2Error .* (DerivIncr + cosh(NetIn2).^(-2));

    % hidden --> input
    Result1Error = net{2}' * In2Error;
    In1Error = Result1Error(1:end-1, :) .* (DerivIncr + cosh(NetIn1).^(-2));

    %% Calculate the weight updates
    dW2 = In2Error * Input2';
    dW1 = In1Error * Input1';

    deltaW2 = -LearnRate * dW2 + Momentum * deltaW2;
    deltaW1 = -LearnRate * dW1 + Momentum * deltaW1;

    net{2} = net{2} + deltaW2;
    net{1} = net{1} + deltaW1;
end
