% GETSTIM.M
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
% This script generates the stimuli. 
%
% Copyright Quentin Huys 2006



[dt1,dt2] = meshgrid([1:T]*delta,[1:T]*delta);
dt = abs(dt1-dt2);
meanstim = zeros(1,T);

if rw ==0;	Cstim = lambda*exp(-dt.^2/tau^2);
elseif rw==1;	Cstim = lambda.^dt*tau^2/(1-lambda^2);
end

stim = mvnrnd(zeros(T,1),Cstim,infsamples);
