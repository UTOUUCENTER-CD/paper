function [sys,x0,str,ts,simStateCompliance] = errors(t,x,u,flag)

switch flag

  
  case 0
    [sys,x0,str,ts,simStateCompliance]=mdlInitializeSizes;

%   case 1
%     sys=mdlDerivatives(t,x,u);
    
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
sizes.NumOutputs     = 56;
sizes.NumInputs      = 52;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   

sys = simsizes(sizes);


x0  = [];


str = [];


ts  = [0 0];


simStateCompliance = 'UnknownSimState';

% function sys=mdlDerivatives(t,x,u)
% 
% 
% sys=[];

function sys=mdlOutputs(t,x,u)

x1=u(1);y1=u(2);fai1=u(3);u1=u(4);v1=u(5);r1=u(6);
x2=u(7);y2=u(8);fai2=u(9);u2=u(10);v2=u(11);r2=u(12);
x3=u(13);y3=u(14);fai3=u(15);u3=u(16);v3=u(17);r3=u(18);
x4=u(19);y4=u(20);fai4=u(21);u4=u(22);v4=u(23);r4=u(24);
dx1=u(25);dy1=u(26);
dx2=u(27);dy2=u(28);
dx3=u(29);dy3=u(30);
dx4=u(31);dy4=u(32);
x0=u(33);y0=u(34);
xhat01=u(37);xhat02=u(38);xhat03=u(39);xhat04=u(40);
yhat01=u(41);yhat02=u(42);yhat03=u(43);yhat04=u(44);
dxhat01=u(45);dxhat02=u(46);dxhat03=u(47);dxhat04=u(48);
dyhat01=u(49);dyhat02=u(50);dyhat03=u(51);dyhat04=u(52);

m22=33.8;
m23=1.0948;
l=m23/m22;

x1bar=x1+l*cos(fai1);
x2bar=x2+l*cos(fai2);
x3bar=x3+l*cos(fai3);
x4bar=x4+l*cos(fai4);

y1bar=y1+l*sin(fai1);
y2bar=y2+l*sin(fai2);
y3bar=y3+l*sin(fai3);
y4bar=y4+l*sin(fai4);

v1bar=v1+l*r1;
v2bar=v2+l*r2;
v3bar=v3+l*r3;
v4bar=v4+l*r4;

%% 平滑过渡队形

%变换后位置
deltxe21=3;deltxe22=3;deltxe23=-3;deltxe24=-3;
deltye21=-3;deltye22=3;deltye23=-3;deltye24=3;

   xe1=xhat01-x1bar+deltxe21;  
   xe2=xhat02-x2bar+deltxe22; 
   xe3=xhat03-x3bar+deltxe23;
   xe4=xhat04-x4bar+deltxe24;

   ye1=yhat01-y1bar+deltye21;  
   ye2=yhat02-y2bar+deltye22; 
   ye3=yhat03-y3bar+deltye23; 
   ye4=yhat04-y4bar+deltye24;



Ee1=sqrt(xe1^2+ye1^2);  Ee2=sqrt(xe2^2+ye2^2);  Ee3=sqrt(xe3^2+ye3^2);  Ee4=sqrt(xe4^2+ye4^2);


faid1=atan2(ye1,xe1);  faid2=atan2(ye2,xe2);  faid3=atan2(ye3,xe3); faid4=atan2(ye4,xe4);

faie1=faid1-fai1; faie2=faid2-fai2; faie3=faid3-fai3; faie4=faid4-fai4;
 
%%
sys(1)=x1;sys(2)=y1;sys(3)=fai1;sys(4)=u1;sys(5)=v1;sys(6)=r1;
sys(7)=x2;sys(8)=y2;sys(9)=fai2;sys(10)=u2;sys(11)=v2;sys(12)=r2;
sys(13)=x3;sys(14)=y3;sys(15)=fai3;sys(16)=u3;sys(17)=v3;sys(18)=r3;
sys(19)=x4;sys(20)=y4;sys(21)=fai4;sys(22)=u4;sys(23)=v4;sys(24)=r4;
sys(25)=Ee1;sys(26)=Ee2;sys(27)=Ee3;sys(28)=Ee4;
sys(29)=faid1;sys(30)=faid2;sys(31)=faid3;sys(32)=faid4;
sys(33)=faie1;sys(34)=faie2;sys(35)=faie3;sys(36)=faie4;
sys(37)=dxhat01;sys(38)=dyhat01;
sys(39)=dxhat02;sys(40)=dyhat02;
sys(41)=dxhat03;sys(42)=dyhat03;
sys(43)=dxhat04;sys(44)=dyhat04;
sys(45)=v1bar;sys(46)=v2bar;sys(47)=v3bar;sys(48)=v4bar;
sys(49)=x0-xhat01;sys(50)=x0-xhat02;sys(51)=x0-xhat03;sys(52)=x0-xhat04;
sys(53)=y0-yhat01;sys(54)=y0-yhat02;sys(55)=y0-yhat03;sys(56)=y0-yhat04;

