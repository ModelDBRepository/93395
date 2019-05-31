function [vps,mps,weight,ps] = pspred(id,spiketime,predtime,sigma,lambda,tau,rw,s);
%
% PSPRED.M
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
% This function is called by GETINF.M. It computes the posterior at times at
% which NO spike was observed.
%
% Copyright Quentin Huys 2006



timevec = [spiketime predtime];
Tsp = length(timevec);

dt = abs(repmat(timevec',1,Tsp)-repmat(timevec,Tsp,1));
if rw==0; 	C = lambda*exp(-.5*dt.^2/tau^2);
elseif rw==1; 	C = lambda.^dt * tau^2/(1-lambda^(2));
end

Cll = C(1:end-1,1:end-1);
ClT = C(1:end-1,end);
CTl = C(1:end-1,end)';
CTT = C(end,end);


iC = inv( sigma^2*eye(size(Cll)) + Cll);

vps = 	CTT- CTl*iC*ClT;
weight = CTl*iC;
mps = weight*id';

ps = exp(-.5*(s'-mps).^2/vps -.5*log(2*pi*vps));
