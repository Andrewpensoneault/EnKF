function[vp]=Modelupdate(odefun,tspan,Sigma,N,vp,LSize)
%Modelupdate applies 'odefun' to the current state of each particle 'vp'
%and updates it to the end of 'tspan' and applies noise according to model
%covarience 'Sigma' and outputs the next state of 'vp' ('vp' should contain
%particle as column vectors).
options=[];
options=odeset(options,'InitialStep',.5);
for i=1:N
    [~,y]=ode23(odefun, tspan , vp(:,i));                                  %Calculate vp of t=1
    vp(:,i)=y(end,:)';                                                     %Takes the final as the particle    
    vp(:,i)=vp(:,i)+mvnrnd(zeros(2*LSize,1),Sigma)';                         %Adds the noise to particles
end
end