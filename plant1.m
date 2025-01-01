function [sys,x0,str,ts,simStateCompliance] = plant1(t,x,u,flag)

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

sizes.NumContStates  = 24;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 32;
sizes.NumInputs      = 16;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;  
sys = simsizes(sizes);



% x0  = [-10 0 0.15 0 0 0 -5 5 0.15 0 0 0 -9 -5 -0.1 0 0 0 -5 10 0 0 0 0];

% x0  = [-5 0 0 0 0 0 -5 5 0.15 0 0 0 -4 -5 -0.1 0 0 0 -5 10 0 0 0 0];

x0  = [-5 -3 0 0 0 0 -5 2 0.15 0 0 0 -4 -8 -0.1 0 0 0 -5 4 0 0 0 0];

% x0  = [-2 -2 0 0 0 0 -2 2 0 0 0 0 -2 -4 0 0 0 0 -2 4 0 0 0 0];


str = [];


ts  = [0 0];


simStateCompliance = 'UnknownSimState';


function sys=mdlDerivatives(t,x,u)

taou1=u(1); taor1=u(2);
taou2=u(3); taor2=u(4);
taou3=u(5); taor3=u(6);
taou4=u(7); taor4=u(8);

m11=25.8;
m22=33.8;
m23=1.0948;
m32=1.0948;
m33=2.76;

fai1=x(3);
u1=x(4);
v1=x(5);
r1=x(6);
fai2=x(9);
u2=x(10);
v2=x(11);
r2=x(12);
fai3=x(15);
u3=x(16);
v3=x(17);
r3=x(18);
fai4=x(21);
u4=x(22);
v4=x(23);
r4=x(24);



d111=5.8664*u1^2+1.3274*abs(u1)+0.7225;
d221=0.805*abs(r1)+36.2823*abs(v1)+0.8612;
d231=0.845*abs(v1)+3.45*abs(r1)-0.1079;
d321=-5.0437*abs(v1)-0.13*abs(r1)-0.1052;
d331=0.75*abs(r1)-0.08*abs(v1)+1.9;

d112=5.8664*u2^2+1.3274*abs(u2)+0.7225;
d222=0.805*abs(r2)+36.2823*abs(v2)+0.8612;
d232=0.845*abs(v2)+3.45*abs(r2)-0.1079;
d322=-5.0437*abs(v2)-0.13*abs(r2)-0.1052;
d332=0.75*abs(r2)-0.08*abs(v2)+1.9;

d113=5.8664*u3^2+1.3274*abs(u3)+0.7225;
d223=0.805*abs(r3)+36.2823*abs(v3)+0.8612;
d233=0.845*abs(v3)+3.45*abs(r3)-0.1079;
d323=-5.0437*abs(v3)-0.13*abs(r3)-0.1052;
d333=0.75*abs(r3)-0.08*abs(v3)+1.9;

d114=5.8664*u4^2+1.3274*abs(u4)+0.7225;
d224=0.805*abs(r4)+36.2823*abs(v4)+0.8612;
d234=0.845*abs(v4)+3.45*abs(r4)-0.1079;
d324=-5.0437*abs(v4)-0.13*abs(r4)-0.1052;
d334=0.75*abs(r4)-0.08*abs(v4)+1.9;
%% 扰动
taowu=-10+4*sin(0.5*t)*cos(0.5*t)-6*cos(t)*cos(0.5*t);
taowv=5*sin(0.1*t);
taowr=8*cos(0.3*t)*sin(1.1*t);
% taowu=0;
% taowv=0;
% taowr=0;

%%

dx1=cos(fai1)*u1-sin(fai1)*v1;
dy1=sin(fai1)*u1+cos(fai1)*v1;
dfai1=r1;
du1=(m22*v1*r1+m23*r1^2-d111*u1+taowu+taou1)/m11;
dv1=(-m23/(m22*m33-m23*m32))*(m11*u1*v1-m22*u1*v1-m23*u1*r1-d321*v1-d331*r1+taowr+taor1)-(m33/(m22*m33-m23*m32))*(m11*u1*r1+d221*v1+d231*r1-taowv);
dr1=(m22/(m22*m33-m23*m32))*(m11*u1*v1-m22*u1*v1-m23*u1*r1-d321*v1-d331*r1+taowr+taor1)+(m32/(m22*m33-m23*m32))*(m11*u1*r1+d221*v1+d231*r1-taowv);

dx2=cos(fai2)*u2-sin(fai2)*v2;
dy2=sin(fai2)*u2+cos(fai2)*v2;
dfai2=r2;
du2=(m22*v2*r2+m23*r2^2-d112*u2+taowu+taou2)/m11;
dv2=(-m23/(m22*m33-m23*m32))*(m11*u2*v2-m22*u2*v2-m23*u2*r2-d322*v2-d332*r2+taowr+taor2)-(m33/(m22*m33-m23*m32))*(m11*u2*r2+d222*v2+d232*r2-taowv);
dr2=(m22/(m22*m33-m23*m32))*(m11*u2*v2-m22*u2*v2-m23*u2*r2-d322*v2-d332*r2+taowr+taor2)+(m32/(m22*m33-m23*m32))*(m11*u2*r2+d222*v2+d232*r2-taowv);

dx3=cos(fai3)*u3-sin(fai3)*v3;
dy3=sin(fai3)*u3+cos(fai3)*v3;
dfai3=r3;
du3=(m22*v3*r3+m23*r3^2-d113*u3+taowu+taou3)/m11;
dv3=(-m23/(m22*m33-m23*m32))*(m11*u3*v3-m22*u3*v3-m23*u3*r3-d323*v3-d333*r3+taowr+taor3)-(m33/(m22*m33-m23*m32))*(m11*u3*r3+d223*v3+d233*r3-taowv);
dr3=(m22/(m22*m33-m23*m32))*(m11*u3*v3-m22*u3*v3-m23*u3*r3-d323*v3-d333*r3+taowr+taor3)+(m32/(m22*m33-m23*m32))*(m11*u3*r3+d223*v3+d233*r3-taowv);

dx4=cos(fai4)*u4-sin(fai4)*v4;
dy4=sin(fai4)*u4+cos(fai4)*v4;
dfai4=r4;
du4=(m22*v4*r4+m23*r4^2-d114*u4+taowu+taou4)/m11;
dv4=(-m23/(m22*m33-m23*m32))*(m11*u4*v4-m22*u4*v4-m23*u4*r4-d324*v4-d334*r4+taowr+taor4)-(m33/(m22*m33-m23*m32))*(m11*u4*r4+d224*v4+d234*r4-taowv);
dr4=(m22/(m22*m33-m23*m32))*(m11*u4*v4-m22*u4*v4-m23*u4*r4-d324*v4-d334*r4+taowr+taor4)+(m32/(m22*m33-m23*m32))*(m11*u4*r4+d224*v4+d234*r4-taowv);


sys(1)=dx1;
sys(2)=dy1;
sys(3)=dfai1;
sys(4)=du1;
sys(5)=dv1;
sys(6)=dr1;
sys(7)=dx2;
sys(8)=dy2;
sys(9)=dfai2;
sys(10)=du2;
sys(11)=dv2;
sys(12)=dr2;
sys(13)=dx3;
sys(14)=dy3;
sys(15)=dfai3;
sys(16)=du3;
sys(17)=dv3;
sys(18)=dr3;
sys(19)=dx4;
sys(20)=dy4;
sys(21)=dfai4;
sys(22)=du4;
sys(23)=dv4;
sys(24)=dr4;

function sys=mdlOutputs(t,x,u)


fai1=x(3);
u1=x(4);
v1=x(5);
r1=x(6);
fai2=x(9);
u2=x(10);
v2=x(11);
r2=x(12);
fai3=x(15);
u3=x(16);
v3=x(17);
r3=x(18);
fai4=x(21);
u4=x(22);
v4=x(23);
r4=x(24);

dx1=cos(fai1)*u1-sin(fai1)*v1;
dy1=sin(fai1)*u1+cos(fai1)*v1;

dx2=cos(fai2)*u2-sin(fai2)*v2;
dy2=sin(fai2)*u2+cos(fai2)*v2;

dx3=cos(fai3)*u3-sin(fai3)*v3;
dy3=sin(fai3)*u3+cos(fai3)*v3;

dx4=cos(fai4)*u4-sin(fai4)*v4;
dy4=sin(fai4)*u4+cos(fai4)*v4;



sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);
sys(4)=x(4);
sys(5)=x(5);
sys(6)=x(6);
sys(7)=x(7);
sys(8)=x(8);
sys(9)=x(9);
sys(10)=x(10);
sys(11)=x(11);
sys(12)=x(12);
sys(13)=x(13);
sys(14)=x(14);
sys(15)=x(15);
sys(16)=x(16);
sys(17)=x(17);
sys(18)=x(18);
sys(19)=x(19);
sys(20)=x(20);
sys(21)=x(21);
sys(22)=x(22);
sys(23)=x(23);
sys(24)=x(24);
sys(25)=dx1;
sys(26)=dy1;
sys(27)=dx2;
sys(28)=dy2;
sys(29)=dx3;
sys(30)=dy3;
sys(31)=dx4;
sys(32)=dy4;






