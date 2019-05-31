% GETSPK.M
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
% This script is called by MAIN.M and produces the mean rate for each Poisson
% neurone, which is then used to produce spikes. If less than 2 spikes are
% generated, a new stimulus is drawn. 
%
% Copyright Quentin Huys 2006


meanrate = exp(-.5*(repmat(stim(infsample,:),n,1)-repmat(nrnpos',1,T)).^2/sigma^2);
meanrate = maxrate*delta/(n*sqrt(2*pi*sigma^2))*meanrate;

spikes = meanrate>rand(n,T);

while sum(sum(spikes))<=2
	stim(infsample,:) = mvnrnd(zeros(T,1),Cstim,infsamples);
	meanrate = exp(-.5*(repmat(stim(infsample,:),n,1)-repmat(nrnpos',1,T)).^2/sigma^2);
	meanrate = maxrate*delta/(n*sqrt(2*pi*sigma^2))*meanrate;
	spikes = meanrate>rand(n,T);
end

[sid,st] = find(spikes==1);
spiketime = timevec(st);
spikeid = nrnpos(sid);

Tsp = sum(sum(spikes));
