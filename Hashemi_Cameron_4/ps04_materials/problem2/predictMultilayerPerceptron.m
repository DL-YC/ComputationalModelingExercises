% Based on code from from
% http://www.cs.cmu.edu/afs/cs/academic/class/15782-f06/matlab/recurrent/

function [output] = predictMultilayerPerceptron(net, input)

num_train = size(input, 2);

Input1 = [input; ones(1, num_train)];

NetIn1 = net{1} * Input1;
Result1 = tanh(NetIn1);

Input2 = [Result1; ones(1, num_train)];
NetIn2 = net{2} * Input2;
output = tanh(NetIn2);