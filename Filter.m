function [sys,x0,str,ts,simStateCompliance] = Filter(t,x,u,flag)

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

sizes.NumContStates  = 8;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 16;
sizes.NumInputs      = 16;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   

sys = simsizes(sizes);


% x0=[5.0248 -0.9359 17.3736 -0.7685 -2.1102 -0.1765 -9.3743 -1.6217];

x0=[0 0 0 0 0 0 0 0];

str = [];


ts  = [0 0];


simStateCompliance = 'UnknownSimState';


function sys=mdlDerivatives(t,x,u)



%% Ò»½×ÂË²¨Æ÷

    g11=0.01; g12=0.01;
    g21=0.01; g22=0.01;
    g31=0.01; g32=0.01;
    g41=0.01; g42=0.01;

    alphau1=u(9); alphar1=u(10);
    alphau2=u(11); alphar2=u(12);
    alphau3=u(13); alphar3=u(14);
    alphau4=u(15); alphar4=u(16);

    dalphabau1=(alphau1-x(1))/g11;
    dalphabar1=(alphar1-x(2))/g12;
    dalphabau2=(alphau2-x(3))/g21;
    dalphabar2=(alphar2-x(4))/g22;
    dalphabau3=(alphau3-x(5))/g31;
    dalphabar3=(alphar3-x(6))/g32;
    dalphabau4=(alphau4-x(7))/g41;
    dalphabar4=(alphar4-x(8))/g42;

    sys(1)=dalphabau1;
    sys(2)=dalphabar1;
    sys(3)=dalphabau2;
    sys(4)=dalphabar2;
    sys(5)=dalphabau3;
    sys(6)=dalphabar3;
    sys(7)=dalphabau4;
    sys(8)=dalphabar4;




function sys=mdlOutputs(t,x,u)


%% Ò»½×ÂË²¨Æ÷

    u1=u(1); r1=u(2);
    u2=u(3); r2=u(4);
    u3=u(5); r3=u(6);
    u4=u(7); r4=u(8);
    alphau1=u(9); alphar1=u(10);
    alphau2=u(11); alphar2=u(12);
    alphau3=u(13); alphar3=u(14);
    alphau4=u(15); alphar4=u(16);

    g11=0.01; g12=0.01;
    g21=0.01; g22=0.01;
    g31=0.01; g32=0.01;
    g41=0.01; g42=0.01;

    dalphabau1=(alphau1-x(1))/g11;
    dalphabar1=(alphar1-x(2))/g12;
    dalphabau2=(alphau2-x(3))/g21;
    dalphabar2=(alphar2-x(4))/g22;
    dalphabau3=(alphau3-x(5))/g31;
    dalphabar3=(alphar3-x(6))/g32;
    dalphabau4=(alphau4-x(7))/g41;
    dalphabar4=(alphar4-x(8))/g42;

%% 
%% ËÙ¶ÈÎó²îÓëÂË²¨Îó²î

    ue1=x(1)-u1; re1=x(2)-r1;
    ue2=x(3)-u2; re2=x(4)-r2;
    ue3=x(5)-u3; re3=x(6)-r3;
    ue4=x(7)-u4; re4=x(8)-r4;
   
    sys(1)=dalphabau1; sys(2)=dalphabar1;
    sys(3)=dalphabau2; sys(4)=dalphabar2;
    sys(5)=dalphabau3; sys(6)=dalphabar3;
    sys(7)=dalphabau4; sys(8)=dalphabar4;
    
    sys(9)=ue1; sys(10)=re1;
    sys(11)=ue2;sys(12)=re2;
    sys(13)=ue3;sys(14)=re3;
    sys(15)=ue4;sys(16)=re4;
    





