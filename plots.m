% PLOTS.M
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
% This script produces the plots. 
%
% Copyright Quentin Huys 2006



clf
colormap((1-gray).^2)

imagesc(timevec,s,P);
hold on
plot(timevec,M,'w',timevec,stim(infsample,:),'w--','linewidth',4)
plot(timevec,M,'k',timevec,stim(infsample,:),'k--','linewidth',2)
plot(spiketime,spikeid,'w.','markersize',30)
plot(spiketime,spikeid,'k.','markersize',20)
hold off
set(gca,'fontsize',18)
ylabel('Space')
xlabel('Time [s]')
Lbl = {'Smooth prior \zeta=2','Ornstein-Uhlenbeck prior \zeta=1'};
title(Lbl{rw+1});

drawnow;
