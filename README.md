# Fall-detection
This is my thesis work on fall detection which compares state of art models with ResNet 2D adapted to multivariate time series wearable data

The data uses the fall repository samples from Farseeing data research 
We thank all participating men and women in the FARSEEING project, as well as all FARSEEING research scientists, study and data managers and clinical and administrative staff who make the study possible. The data can be obtained by sending a request for access @http://farseeingresearch.eu/

The folder below contains the following models: 
1) Mahalanobis distance metric
2) Simple Feed forward NN
3) Simple LSTM
4) Advanced LSTM
5) ResNet with flattened data - Conv 1D
6) ResNet with Conv 2D
7) ResNet with class weights for fall and non-fall samples

It also contains a visualization of the intermediate activations learnt by the ResNet 2D model with CW for windowed data
