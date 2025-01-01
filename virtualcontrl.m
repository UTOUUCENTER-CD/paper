function [sys,x0,str,ts,simStateCompliance] = virtualcontrl(t,x,u,flag)

switch flag

  
  case 0
    [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes;

  case 3
    sys=mdlOutputs(t,x,u);

   case {1,2,9,4}
    
    sys=[];
 
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));

end


function [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes


sizes = simsizes;

sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 16;
sizes.NumInputs      = 56;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   

sys = simsizes(sizes);


x0  = [];


str = [];


ts  = [0 0];


simStateCompliance = 'UnknownSimState';


function sys=mdlOutputs(t,x,u)

x1=u(1);y1=u(2);fai1=u(3);u1=u(4);v1=u(5);r1=u(6);
x2=u(7);y2=u(8);fai2=u(9);u2=u(10);v2=u(11);r2=u(12);
x3=u(13);y3=u(14);fai3=u(15);u3=u(16);v3=u(17);r3=u(18);
x4=u(19);y4=u(20);fai4=u(21);u4=u(22);v4=u(23);r4=u(24);
Ee1=u(25);Ee2=u(26);Ee3=u(27);Ee4=u(28);
faid1=u(29);faid2=u(30);faid3=u(31);faid4=u(32);
faie1=u(33);faie2=u(34);faie3=u(35);faie4=u(36);
dxhat01=u(37);dyhat01=u(38);
dxhat02=u(39);dyhat02=u(40);
dxhat03=u(41);dyhat03=u(42);
dxhat04=u(43);dyhat04=u(44);
v1bar=u(45);v2bar=u(46);v3bar=u(47);v4bar=u(48);


k11=0.1; k12=50; 
k21=0.1; k22=50; 
k31=0.1; k32=50; 
k41=0.1; k42=50; 

alphau1=(1/cos(faie1))*(dxhat01*cos(faid1)+dyhat01*sin(faid1)-v1bar*sin(faie1)+k11*Ee1);

alphar1=1/Ee1*(-dxhat01*sin(faid1)+dyhat01*cos(faid1)+u1*sin(faie1)-v1bar*cos(faie1))+k12*faie1;

alphau2=(1/cos(faie2))*(dxhat02*cos(faid2)+dyhat02*sin(faid2)-v2bar*sin(faie2)+k21*Ee2);

alphar2=1/Ee2*(-dxhat02*sin(faid2)+dyhat02*cos(faid2)+u2*sin(faie2)-v2bar*cos(faie2))+k22*faie2;

alphau3=(1/cos(faie3))*(dxhat03*cos(faid3)+dyhat03*sin(faid3)-v3bar*sin(faie3)+k31*Ee3);

alphar3=1/Ee3*(-dxhat03*sin(faid3)+dyhat03*cos(faid3)+u3*sin(faie3)-v3bar*cos(faie3))+k32*faie3;

alphau4=(1/cos(faie4))*(dxhat04*cos(faid4)+dyhat04*sin(faid4)-v4bar*sin(faie4)+k41*Ee4);

alphar4=1/Ee4*(-dxhat04*sin(faid4)+dyhat04*cos(faid4)+u4*sin(faie4)-v4bar*cos(faie4))+k42*faie4;


sys(1)=u1;
sys(2)=r1;
sys(3)=u2;
sys(4)=r2;
sys(5)=u3;
sys(6)=r3;
sys(7)=u4;
sys(8)=r4;
sys(9)=alphau1;
sys(10)=alphar1;
sys(11)=alphau2;
sys(12)=alphar2;
sys(13)=alphau3;
sys(14)=alphar3;
sys(15)=alphau4;
sys(16)=alphar4;



