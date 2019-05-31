function [vps,mps,weight,ps] = psinf(id,time,sigma,lambda,tau,rw,s);
%
% PSINF.M
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
% which a spike was observed.
%
% Copyright Quentin Huys 2006




Tsp = length(time);

dt = abs(repmat(time',1,Tsp)-repmat(time,Tsp,1));
if rw==0; 		C = lambda*exp(-.5*dt.^2/tau^2);
elseif rw==1; 		C = lambda.^dt*tau^2/(1-lambda^2);
end

Cll = C(1:end-1,1:end-1);
ClT = C(1:end-1,end);
CTl = C(1:end-1,end)';
CTT = C(end,end);

iC = inv( sigma^2*eye(size(Cll)) + Cll);

vps = 	inv( 1/(CTT-CTl*iC*ClT) + 1/sigma^2);
weight = vps*[1/(CTT-CTl*iC*ClT)*CTl*iC  1/sigma^2];

mps = weight*id';


ps = exp(-.5*(s'-mps).^2/vps -.5*log(2*pi*vps));
