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
% This is a small script that gets the neuron preferred stimuli and some other
% bits.
%
% Copyright Quentin Huys 2006


T 	= Tmax/delta;
timevec = [1:T]/T*Tmax;
s 	= linspace(-lim,lim,ds);
nrnpos	= linspace(-lim,lim,n);
P 	= zeros(n,T);
