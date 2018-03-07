%% Loads Preset Parameters for The hillslope model
linkstructuretoy                                                           %Loads link structure
Ah=ones(1,LSize);                                                          %Area of surrounding hillslope at link i 
A=1:LSize;
L=500*ones(1,LSize);                                                       %Length of link i
S=.1*ones(1,LSize);                                                        %Average slope of hillslope suroundin link i
eta=.1*ones(1,LSize);                                                      %Manning coefficients
vr=1;                                                                      %Reference flow velocity
RC=.5;                                                                     %Runnoff coefficients
l1=0.2;                                                                    %Exponents of flow velocity discharge 
l2=-.1;                                                                    %Exponents of flow velocity upstream area
Tau=((1-l1)/(60*vr))*(L./(A.^l2));                                         %Constant 0
c1=(2/.6)*((L.*S.^(1/2))./eta);                                            %Constant 1
c2=(10^-3/60)*RC;                                                          %Constant 2
c3=(60*10^-6)*c1./Ah;                                                      %Constant 3
p=zeros(1,LSize);                                                          %Percipitation at hillslope i