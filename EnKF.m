function[vamean,Truth,Caabs]=EnKF(Data,Truth,vp,Tmax,vpmean,vamean,H,N,Datdim,Statedim,Sigma,Gamma,odefun,LSize)
k=1;                                                                       %Initializes counter
Caabs=[];
while k < Tmax+1
%%%%%%%PREDICTION FOR Vj%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    vpmean(:,k+1)=mean(vp,2);                                              %Updates vp mean
    Cp=zeros(Statedim,Statedim);                                           %Intialized vp covariance
    Cp=(vp-vpmean(:,k+1))*(vp-vpmean(:,k+1))'/(N-1);                       %Covariance of particles
%%%%%%%ANALYSIS FOR Vj%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    CpHt=Cp*H';                                                            %Covariance times H'
    S=H*CpHt+Gamma^(1/2);                                                  %Innovation Covariance
    KalGain=(CpHt/S);                                                      %Kalman Gain
    tspan=[k,k+1];                                                         %Window for data update
    [Data(:,k+1),Truth(:,k+1)]=Datagen(odefun,tspan,Gamma,Truth(:,k)...
    ,H,Datdim);                                                            %Generates Data for the next step
    perdata=repmat(Data(:,k+1),1,N)+Gamma^(1/2)*randn(1,N);                %Generates Perturbed data
    %va=zeros(Statedim,N);
    va=(eye(Statedim)-KalGain*H)*vp+KalGain*perdata;                       %Generates analysed particles
    vamean(:,k+1)=mean(va,2);                                              %Calculates va mean
    Caabs(k)=norm((va-vamean(:,k+1))*(va-vamean(:,k+1))'/(N-1));           %Covariance of analysed particles    
%%%%%%%PREDICTION FOR Vj+1%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    k=k+1;                                                                 %Increments counter
    if k~=Tmax+1
        tspan=[k,k+1];                                                     %Create time span for next step
        vp=Modelupdate(odefun,tspan,Sigma,N,vp,LSize);                     %Generates first state of Particles    end
    end
end
end