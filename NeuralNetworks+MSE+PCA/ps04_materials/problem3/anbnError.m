% load the data
load abdata.mat;
% train the network and generate predictions
[net, predictions] = anbnLearner(traindata, testdata);
% compute mean squared error
mse = meanSquaredErrors(predictions, testdata);
% plot the error
plotMSE(mse);
