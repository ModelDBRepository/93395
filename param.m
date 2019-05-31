% PARAM.M
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
% This script sets the parameters. It is called by MAIN.M. You shold not have to
% modify anything but this script. The main variable to set is RW. 
%
% Copyright Quentin Huys 2006


rw = 1;			% set rw=1 for OU prior, and rw=0 for smooth prior

%==============================================================================
%			PARAMETERS SPECIFIC TO OU AND SMOOTH STIMULI
%==============================================================================

%.......................................Smooth prior
if rw==0;	tau = .05;		% tau is the main (temporal) parameter
		lambda = .2;		% lambda scales the prior
		maxrate = 144;		% max firing rate (scaled by delta later)
%.......................................OU prior
elseif rw==1;	tau = .35;		% tau scales the prior here 
		lambda = 2e-4;		% lambda is the main (temporal) parameter
		maxrate = 108;		% max firing rate (scaled by delta later)
end

%==============================================================================
%			GENERAL PARAMETERS 
%==============================================================================
n = 100;		% number of neurones
ds = n;			% resolution of the distribution to be plotted. 
infsamples = 1;		% how many different trajectories

lim = 1;		% size of the stimulus space to be plotted.
sigma=.1;		% width of (normalised) tuning functions

Tmax = .3;		% Total length of time [s]
delta = .001;		% Timestep [s];
