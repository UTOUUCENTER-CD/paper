function [sys,x0,str,ts,simStateCompliance] = DOB(t,x,u,flag)

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
sizes.NumOutputs     = 16;
sizes.NumInputs      = 36;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;   

sys = simsizes(sizes);


x0  = 0;


str = [];


ts  = [0 0];


simStateCompliance = 'UnknownSimState';

function sys=mdlDerivatives(t,x,u)

x0=u(33);
y0=u(34);
u0=u(35);
v0=u(36);

kp=40*[1 1 1 1];%45
ka=0.001*[1 1 1 1]; % 小 0.01
kw=0.001*[1 1 1 1];% 0-1
kv=40*[1 1 1 1];%45


for i=1:4
    xhat0(i)=x(i);
    yhat0(i)=x(i+4);
    uhat0(i)=x(i+8);
    vhat0(i)=x(i+12);
    ahatpx(i)=x(i+16);
    ahatpy(i)=x(i+20);
end


    a=[0 1 1 0;
       1 0 0 1;
       1 0 0 1;
       0 1 1 0;];



   b=[1 1 0 0];


    Mpex=zeros(4,1);
    Mpey=zeros(4,1);
    Mue=zeros(4,1);
    Mve=zeros(4,1);

    for i=1:4
        for j=1:4
            Mpex(i)=Mpex(i)+a(i,j)*(xhat0(j)-xhat0(i));
            Mpey(i)=Mpey(i)+a(i,j)*(yhat0(j)-yhat0(i));
            Mue(i)=Mue(i)+a(i,j)*(uhat0(j)-uhat0(i));
            Mve(i)=Mve(i)+a(i,j)*(vhat0(j)-vhat0(i));
        end
    end

    for i=1:4
        pex(i)=Mpex(i)+b(i)*(x0-xhat0(i));
        pey(i)=Mpey(i)+b(i)*(y0-yhat0(i));
        wex(i)=Mue(i)+b(i)*(u0-uhat0(i));
        wey(i)=Mve(i)+b(i)*(v0-vhat0(i));
    end

for i=1:4
    dxhat0(i)=uhat0(i)+kp(i)*ahatpx(i)*pex(i);
    dyhat0(i)=vhat0(i)+kp(i)*ahatpy(i)*pey(i);
    duhat0(i)=kv(i)*ahatpx(i)*wex(i)+kw(i)*sign(wex(i));
    dvhat0(i)=kv(i)*ahatpy(i)*wey(i)+kw(i)*sign(wey(i));
    dahatpx(i)=kp(i)*pex(i)'*pex(i)+kv(i)*wex(i)'*wex(i)-ka(i)*ahatpx(i);
    dahatpy(i)=kp(i)*pey(i)'*pey(i)+kv(i)*wey(i)'*wey(i)-ka(i)*ahatpy(i);
end

for i=1:4
    sys(i)=dxhat0(i);
    sys(i+4)=dyhat0(i);
    sys(i+8)=duhat0(i);
    sys(i+12)=dvhat0(i);
    sys(i+16)=dahatpx(i);
    sys(i+20)=dahatpy(i);
end
    
 
function sys=mdlOutputs(t,x,u)

x0=u(33);
y0=u(34);
u0=u(35);
v0=u(36);

kp=40*[1 1 1 1];%45
ka=0.001*[1 1 1 1]; % 小 0.01
kw=0.001*[1 1 1 1];% 0-1
kv=40*[1 1 1 1];%45

for i=1:4
    xhat0(i)=x(i);
    yhat0(i)=x(i+4);
    uhat0(i)=x(i+8);
    vhat0(i)=x(i+12);
    ahatpx(i)=x(i+16);
    ahatpy(i)=x(i+20);
end


   a=[0 1 1 0;
       1 0 0 1;
       1 0 0 1;
       0 1 1 0;];



   b=[1 1 0 0];

 

    Mpex=zeros(4,1);
    Mpey=zeros(4,1);
    Mue=zeros(4,1);
    Mve=zeros(4,1);

    for i=1:4
        for j=1:4
            Mpex(i)=Mpex(i)+a(i,j)*(xhat0(j)-xhat0(i));
            Mpey(i)=Mpey(i)+a(i,j)*(yhat0(j)-yhat0(i));
            Mue(i)=Mue(i)+a(i,j)*(uhat0(j)-uhat0(i));
            Mve(i)=Mve(i)+a(i,j)*(vhat0(j)-vhat0(i));
        end
    end

    for i=1:4
        pex(i)=Mpex(i)+b(i)*(x0-xhat0(i));
        pey(i)=Mpey(i)+b(i)*(y0-yhat0(i));
        wex(i)=Mue(i)+b(i)*(u0-uhat0(i));
        wey(i)=Mve(i)+b(i)*(v0-vhat0(i));
    end

for i=1:4
    dxhat0(i)=uhat0(i)+kp(i)*ahatpx(i)*pex(i);
    dyhat0(i)=vhat0(i)+kp(i)*ahatpy(i)*pey(i);
    duhat0(i)=kv(i)*ahatpx(i)*wex(i)+kw(i)*sign(wex(i));
    dvhat0(i)=kv(i)*ahatpy(i)*wey(i)+kw(i)*sign(wey(i));
    dahatpx(i)=kp(i)*pex(i)'*pex(i)+kv(i)*wex(i)'*wex(i)-ka(i)*ahatpx(i);
    dahatpy(i)=kp(i)*pey(i)'*pey(i)+kv(i)*wey(i)'*wey(i)-ka(i)*ahatpy(i);
end


for i=1:4
    sys(i)=x(i);
    sys(i+4)=x(i+4);
    sys(i+8)=dxhat0(i);
    sys(i+12)=dyhat0(i);
end


