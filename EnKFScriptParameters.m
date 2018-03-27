%% Loads the Parameters for the Ensemble Kalman Filter (standard)
init=[ones(1,LSize),.1*ones(1,LSize)]';                                    %Initial Conditions
Tmax=100;                                                                  %Assimilation window max
t=0:1:Tmax;                                                                %Time Vector
odefun='dydt';                                                             %RHS of ODE for signal/model
N=5;                                                                       %Number of Particles
vpmean=init;                                                               %Initialize vp mean
vamean=init;                                                               %Initialize va mean
vp=[];                                                                     %Container for predicted particle
va=[];                                                                     %Container for analysed particle
Sigma=diag([10^(-10)*ones(LSize,1);10^(-10)*ones(LSize,1)]);               %Model Error (Or initial perturbation)
H=[zeros(1,2*LSize-1),1];                                                  %Measurement Operator
Truth=init;
Data(:,1)=H*((1+.5*randn(2*LSize,1)).*init);                               %Initializes data from initial conditions
Datdim=min(size(H));                                                       %Dimension of the Data
Statedim=2*LSize;   
Gamma=10^(-1);
%%%%%%%GENERATES PARTICLES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vp=repmat(init,1,N)+mvnrnd(zeros(N,2*LSize),Sigma)';                       %Generates Initial Particles
%Sigma=zeros(2*LSize,2*LSize);                                             %Model Error (zero for the deterministic dynamics)
tspan=[0,1];                                                               %Updates to t=1     
vp=Modelupdate(odefun,tspan,Sigma,N,vp,LSize);                             %Generates first state of Particles