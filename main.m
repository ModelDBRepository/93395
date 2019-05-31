% MAIN.M
%
% This code is released in conjunction with the paper 
%
%	Huys QJM, Zemel RS, Natarajan R and Dayan P (2006): Fast population
%	coding Neural Computation
%	
% and can be downloaded from 
%
%	http://www.gatsby.ucl.ac.uk/~qhuys/code.html
%
% This script is the main script. It generates a time-varying stimulus drawn
% from a Gaussian Process prior, produces a population spike train from it and
% infers the posterior over the stimulus given the spikes. It calls PARAM.M to
% set the parameters, and that should be the only script you should have to
% modify. It then calls SETUP.M to setup a few more things and GETSTIM.M to
% produce the time-varying stimuli. The iteration over these stimuli then
% begins, and for each stimulus a set of spikes is drawn by GETSPK.M, the
% true posterior distribution p(s_T|\xi) is inferred and plotted by PLOTS.M
%
% Copyright Quentin Huys 2006



clear all
param;		% get parameters
setup;		% setup a few more things
getstim;	% get the stimuli

for infsample = 1:infsamples
	getspk;		% get the spikes
	getinf;		% do the inference 
	plots;		% plot plots
	fprintf('infsample = %g\r',infsample)
end


