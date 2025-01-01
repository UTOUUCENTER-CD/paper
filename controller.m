function [sys,x0,str,ts,simStateCompliance] = controller(t,x,u,flag)

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

sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 16;
sizes.NumInputs      = 72;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   

sys = simsizes(sizes);


x0  = [];


str = [];


ts  = [-1 0];


simStateCompliance = 'UnknownSimState';

function sys=mdlDerivatives(t,x,u)

sys=[];

function sys=mdlOutputs(t,x,u)

u1=u(4);v1=u(5);r1=u(6);
u2=u(10);v2=u(11);r2=u(12);
u3=u(16);v3=u(17);r3=u(18);
u4=u(22);v4=u(23);r4=u(24);
Ee1=u(25);Ee2=u(26);Ee3=u(27);Ee4=u(28);
faid1=u(29);faid2=u(30);faid3=u(31);faid4=u(32);
faie1=u(33);faie2=u(34);faie3=u(35);faie4=u(36);
vbar1=u(45);vbar2=u(46);vbar3=u(47);vbar4=u(48);

dalphaubar1=u(57); dalpharbar1=u(58);
dalphaubar2=u(59); dalpharbar2=u(60);
dalphaubar3=u(61); dalpharbar3=u(62);
dalphaubar4=u(63); dalpharbar4=u(64);

ue1=u(65); re1=u(66);
ue2=u(67); re2=u(68);
ue3=u(69); re3=u(70);
ue4=u(71); re4=u(72);

%% 模型参数

m11=25.8;
m22=33.8;
m23=1.0948;
m32=1.0948;
m33=2.76;

l=m23/m22;

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


sigamu=1/m11;
sigamr=m22/(m22*m33-m23*m32);

f11=sigamu*(m22*(vbar1-l*r1)*r1+m23*r1^2-d111*u1);
f12=sigamu*(m22*(vbar2-l*r2)*r2+m23*r2^2-d112*u2);
f13=sigamu*(m22*(vbar3-l*r3)*r3+m23*r3^2-d113*u3);
f14=sigamu*(m22*(vbar4-l*r4)*r4+m23*r4^2-d114*u4);

delta2=m22*m33-m23*m32;

f31=((m11*m22-m22^2)*u1*(vbar1-l*r1)+(m11*m32-m23*m22)*u1*r1- ...
    (d331*r1+d321*(vbar1-l*r1))*m22+(d231*r1+d221*(vbar1-l*r1))*m23)/delta2;
f32=((m11*m22-m22^2)*u2*(vbar2-l*r2)+(m11*m32-m23*m22)*u2*r2- ...
    (d332*r2+d322*(vbar2-l*r2))*m22+(d232*r2+d222*(vbar2-l*r2))*m23)/delta2;
f33=((m11*m22-m22^2)*u3*(vbar3-l*r3)+(m11*m32-m23*m22)*u3*r3- ...
    (d333*r3+d323*(vbar3-l*r3))*m22+(d233*r3+d223*(vbar3-l*r3))*m23)/delta2;
f34=((m11*m22-m22^2)*u4*(vbar4-l*r4)+(m11*m32-m23*m22)*u4*r4- ...
    (d334*r4+d324*(vbar4-l*r4))*m22+(d234*r4+d224*(vbar4-l*r4))*m23)/delta2;
%%
%% 扰动
taowu=-10+4*sin(0.5*t)*cos(0.5*t)-6*cos(t)*cos(0.5*t);
taowv=5*sin(0.1*t);
taowr=8*cos(0.3*t)*sin(1.1*t);
% taowu=0;
% taowv=0;
% taowr=0;
%%

du=sigamu*taowu;
dr=sigamr*(taowr-l*taowv);


K11=10; K12=10;%10
K21=10; K22=10;
K31=10; K32=10;
K41=10; K42=10;

%控制输入

taou1=1/sigamu*(dalphaubar1-f11-du+Ee1*cos(faie1)+K11*ue1);

taor1=1/sigamr*(dalpharbar1-f31-dr+faie1+K12*re1);

taou2=1/sigamu*(dalphaubar2-f12-du+Ee2*cos(faie2)+K21*ue2);

taor2=1/sigamr*(dalpharbar2-f32-dr+faie2+K22*re2);

taou3=1/sigamu*(dalphaubar3-f13-du+Ee3*cos(faie3)+K31*ue3);

taor3=1/sigamr*(dalpharbar3-f33-dr+faie3+K32*re3);

taou4=1/sigamu*(dalphaubar4-f14-du+Ee4*cos(faie4)+K41*ue4);

taor4=1/sigamr*(dalpharbar4-f34-dr+faie4+K42*re4);

% % 拟合的扰动

F11=f11+du;
F12=f31+dr;

F21=f12+du;
F22=f32+dr;

F31=f13+du;
F32=f33+dr;

F41=f14+du;
F42=f34+dr;
%%

sys(1)=taou1; 
sys(2)=taor1;
sys(3)=taou2;
sys(4)=taor2;
sys(5)=taou3;
sys(6)=taor3;
sys(7)=taou4;
sys(8)=taor4;
sys(9)=F11;
sys(10)=F12;
sys(11)=F21;
sys(12)=F22;
sys(13)=F31;
sys(14)=F32;
sys(15)=F41;
sys(16)=F42;
