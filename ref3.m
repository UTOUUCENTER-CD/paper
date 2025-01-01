function [sys,x0,str,ts,simStateCompliance] = ref3(t,x,u,flag)
switch flag
  case 0
    [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes;
  case 1
    sys=mdlDerivatives(t,x,u);
  case 3
    sys=mdlOutputs(t,x,u);
  case {2,9,4}
    sys=[];
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));
end


function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 3;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 4;
sizes.NumInputs      = 0;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;  
sys = simsizes(sizes);

x0  = [0 0 0];
str = [];
ts  = [0 0];
simStateCompliance = 'UnknownSimState';


function sys=mdlDerivatives(t,x,u)
x0=x(1);
y0=x(2);
psi0=x(3);
ES0=[x0 y0 psi0]';

J0=[cos(psi0) -sin(psi0) 0;sin(psi0) cos(psi0) 0;0 0 1]; 


r0=0.04;



%%
U0=1.5;
v0=0;
V0=[U0 v0 r0]';
dES0=J0*V0;

sys(1)=dES0(1); 
sys(2)=dES0(2);
sys(3)=dES0(3);

function sys=mdlOutputs(t,x,u)


x0=x(1);
y0=x(2);
psi0=x(3);
ESd=[x0 y0 psi0]';

J0=[cos(psi0) -sin(psi0) 0;sin(psi0) cos(psi0) 0;0 0 1]; 


r0=0.04;


U0=1.5;
v0=0;
V0=[U0 v0 r0]';
dES0=J0*V0;

dx0=dES0(1);
dy0=dES0(2);


sys(1) = x0;
sys(2) = y0;
sys(3) = dx0;
sys(4) = dy0;