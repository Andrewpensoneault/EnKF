function [Data,Truth] = Datagen(odefun,tspan,Gamma,Truth,H,Datdim)
%Datagen takes the previous state 'Data', applies 'odefun' over tspan, then
%applies noise centered at zero with covariance 'Gamma' to it
    [~,y]=ode45(odefun, tspan , Truth);                                    %Calculate vp of t=1
    Truth=y(end,:)';                                                       %Takes the final as the total true state
    Data=H*Truth+sqrt(Gamma)*randn(Datdim,1);                              %Adds the noise to Data
end

