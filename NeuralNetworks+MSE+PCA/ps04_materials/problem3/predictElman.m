% Based on code from from
% http://www.cs.cmu.edu/afs/cs/academic/class/15782-f06/matlab/recurrent/

function [output] = predictElman(net, input)

num_hidden = size(net{1}, 1);
num_output = size(net{2}, 1);
num_train = size(input, 2);

Inputs = [input; ones(1, num_train)];
Result1 = zeros(num_hidden, 1);

output = zeros(num_output, num_train);

for i=1:num_train
    Input1 = [Inputs(:, i); Result1];
    NetIn1 = net{1} * Input1;
    Result1 = tanh(NetIn1);

    Input2 = [Result1; ones(1, 1)];
    NetIn2 = net{2} * Input2;
    output(:, i) = tanh(NetIn2);
end