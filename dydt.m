function[dy]=dydt(t,y)
%% Simplified Hillslope Model - Using "An asynchronous solver for systems 
% of ODEs linked by a tree structure", a y-shaped simplified model was
% created
paramstoy                                                                  %Loads Toy Parameters
linkstructuretoy                                                           %Loads Toy structure
q=y(1:LSize)';
sp=y(LSize+1:end)';
%dq=(1./Tau).*q.^l1.*((Link*q')'-q+c1.*sp.^(5/3));                         %Generates change q
dq=(1./Tau).*q.^l1.*((q*Link')-q+c1.*sp.^(5/3));                           %Generates change q
dsp=c2*p-c3.*sp.^(5/3);                                                    %Generates change sp
dy=[dq,dsp]';