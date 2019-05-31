% GETINF.M
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
% This script is the workhorse. It is called by MAIN.M and infers the posterior
% distribution p(s_T|\xi). If app=1 in PARAM.M, it also infers the approximate
% posteriors with metronomic spikes. 
%
% Copyright Quentin Huys 2006



%.........................compute true p(s_T|phi_0:T)...............................
minspkt = min(round(spiketime/delta));	% find the minimum spike time. Start
					% inference there, as don't want to do acausal 
					% inference.
P(:,1:minspkt)=1/ds; M(1:minspkt) =0;	% uniform distribution before observe spikes
ts=1;	
for t = min(round(spiketime/delta)):T
	if ~isempty(ts);tsold = ts;end
	ts = max(find(round(spiketime/delta)==t));
	% posterior is different depending on whether there is a spike at time t
	if ~isempty(ts); 
		[V(t),M(t),weight,P(:,t)] = psinf(spikeid(1:ts),spiketime(1:ts),sigma,lambda,tau,rw,s);
	elseif isempty(ts); 
		[V(t),M(t),weight,P(:,t)] = pspred(spikeid(1:tsold),spiketime(1:tsold),t*delta,sigma,lambda,tau,rw,s);
	end
end
P = P./repmat(sum(P),ds,1);		% renormalize for the plots;
