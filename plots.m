%% 轨迹
clc
figure(1)
plot(Position(:,1),Position(:,2),'r',Position(:,7),Position(:,8),'m',Position(:,13),Position(:,14),'g', ...
    Position(:,19),Position(:,20),'c',Position1(:,1),Position1(:,2),'k','LineWidth',1)
hold on
%
a=800;
plot(Position(a,1),Position(a,2),'o',Position(a,7),Position(a,8),'o', ...
    Position(a,13),Position(a,14),'o',Position(a,19),Position(a,20),'o', ...
    Position1(a,1),Position1(a,2),'o',markersize=3,MarkerEdgeColor=[0,0,0],MarkerFaceColor=[0,0,0])

line([Position(a,19),Position1(a,1)],[(Position(a,20)),Position1(a,2)],'LineWidth',1);
line([Position(a,13),Position1(a,1)],[Position(a,14),Position1(a,2)],'LineWidth',1);
line([Position(a,19),Position(a,7)],[Position(a,20),Position(a,8)],'LineWidth',1);
line([Position(a,7),Position(a,1)],[Position(a,8),Position(a,2)],'LineWidth',1);
line([Position(a,13),Position(a,1)],[Position(a,14),Position(a,2)],'LineWidth',1);
hold on
%
a=1500;
plot(Position(a,1),Position(a,2),'o',Position(a,7),Position(a,8),'o', ...
    Position(a,13),Position(a,14),'o',Position(a,19),Position(a,20),'o', ...
    Position1(a,1),Position1(a,2),'o',markersize=3,MarkerEdgeColor=[0,0,0],MarkerFaceColor=[0,0,0])

line([Position(a,19),Position1(a,1)],[(Position(a,20)),Position1(a,2)],'LineWidth',1);
line([Position(a,13),Position1(a,1)],[Position(a,14),Position1(a,2)],'LineWidth',1);
line([Position(a,19),Position(a,7)],[Position(a,20),Position(a,8)],'LineWidth',1);
line([Position(a,7),Position(a,1)],[Position(a,8),Position(a,2)],'LineWidth',1);
line([Position(a,13),Position(a,1)],[Position(a,14),Position(a,2)],'LineWidth',1);

a=2200;
plot(Position(a,1),Position(a,2),'o',Position(a,7),Position(a,8),'o', ...
    Position(a,13),Position(a,14),'o',Position(a,19),Position(a,20),'o', ...
    Position1(a,1),Position1(a,2),'o',markersize=3,MarkerEdgeColor=[0,0,0],MarkerFaceColor=[0,0,0])

line([Position(a,19),Position1(a,1)],[(Position(a,20)),Position1(a,2)],'LineWidth',1);
line([Position(a,13),Position1(a,1)],[Position(a,14),Position1(a,2)],'LineWidth',1);
line([Position(a,19),Position(a,7)],[Position(a,20),Position(a,8)],'LineWidth',1);
line([Position(a,7),Position(a,1)],[Position(a,8),Position(a,2)],'LineWidth',1);
line([Position(a,13),Position(a,1)],[Position(a,14),Position(a,2)],'LineWidth',1);
%
a=2900;
plot(Position(a,1),Position(a,2),'o',Position(a,7),Position(a,8),'o', ...
    Position(a,13),Position(a,14),'o',Position(a,19),Position(a,20),'o', ...
    Position1(a,1),Position1(a,2),'o',markersize=3,MarkerEdgeColor=[0,0,0],MarkerFaceColor=[0,0,0])

line([Position(a,19),Position1(a,1)],[(Position(a,20)),Position1(a,2)],'LineWidth',1);
line([Position(a,13),Position1(a,1)],[Position(a,14),Position1(a,2)],'LineWidth',1);
line([Position(a,19),Position(a,7)],[Position(a,20),Position(a,8)],'LineWidth',1);
line([Position(a,7),Position(a,1)],[Position(a,8),Position(a,2)],'LineWidth',1);
line([Position(a,13),Position(a,1)],[Position(a,14),Position(a,2)],'LineWidth',1);

% 方形
a=3600;
plot(Position(a,1),Position(a,2),'o',Position(a,7),Position(a,8),'o', ...
    Position(a,13),Position(a,14),'o',Position(a,19),Position(a,20),'o', ...
    Position1(a,1),Position1(a,2),'o',markersize=3,MarkerEdgeColor=[0,0,0],MarkerFaceColor=[0,0,0])

line([Position(a,1),Position(a,7)],[(Position(a,2)),Position(a,8)],'LineWidth',1);
line([Position(a,1),Position(a,13)],[Position(a,2),Position(a,14)],'LineWidth',1);
line([Position(a,13),Position(a,19)],[Position(a,14),Position(a,20)],'LineWidth',1);
line([Position(a,19),Position(a,7)],[Position(a,20),Position(a,8)],'LineWidth',1);
%
a=4900;
plot(Position(a,1),Position(a,2),'o',Position(a,7),Position(a,8),'o', ...
    Position(a,13),Position(a,14),'o',Position(a,19),Position(a,20),'o', ...
    Position1(a,1),Position1(a,2),'o',markersize=3,MarkerEdgeColor=[0,0,0],MarkerFaceColor=[0,0,0])

line([Position(a,1),Position(a,7)],[(Position(a,2)),Position(a,8)],'LineWidth',1);
line([Position(a,1),Position(a,13)],[Position(a,2),Position(a,14)],'LineWidth',1);
line([Position(a,13),Position(a,19)],[Position(a,14),Position(a,20)],'LineWidth',1);
line([Position(a,19),Position(a,7)],[Position(a,20),Position(a,8)],'LineWidth',1);
%
a=6000;
plot(Position(a,1),Position(a,2),'o',Position(a,7),Position(a,8),'o', ...
    Position(a,13),Position(a,14),'o',Position(a,19),Position(a,20),'o', ...
    Position1(a,1),Position1(a,2),'o',markersize=3,MarkerEdgeColor=[0,0,0],MarkerFaceColor=[0,0,0])

line([Position(a,1),Position(a,7)],[(Position(a,2)),Position(a,8)],'LineWidth',1);
line([Position(a,1),Position(a,13)],[Position(a,2),Position(a,14)],'LineWidth',1);
line([Position(a,13),Position(a,19)],[Position(a,14),Position(a,20)],'LineWidth',1);
line([Position(a,19),Position(a,7)],[Position(a,20),Position(a,8)],'LineWidth',1);
%
a=8000;
plot(Position(a,1),Position(a,2),'o',Position(a,7),Position(a,8),'o', ...
    Position(a,13),Position(a,14),'o',Position(a,19),Position(a,20),'o', ...
    Position1(a,1),Position1(a,2),'o',markersize=3,MarkerEdgeColor=[0,0,0],MarkerFaceColor=[0,0,0])

line([Position(a,1),Position(a,7)],[(Position(a,2)),Position(a,8)],'LineWidth',1);
line([Position(a,1),Position(a,13)],[Position(a,2),Position(a,14)],'LineWidth',1);
line([Position(a,13),Position(a,19)],[Position(a,14),Position(a,20)],'LineWidth',1);
line([Position(a,19),Position(a,7)],[Position(a,20),Position(a,8)],'LineWidth',1);
%
a=10000;
plot(Position(a,1),Position(a,2),'o',Position(a,7),Position(a,8),'o', ...
    Position(a,13),Position(a,14),'o',Position(a,19),Position(a,20),'o', ...
    Position1(a,1),Position1(a,2),'o',markersize=3,MarkerEdgeColor=[0,0,0],MarkerFaceColor=[0,0,0])

line([Position(a,1),Position(a,7)],[(Position(a,2)),Position(a,8)],'LineWidth',1);
line([Position(a,1),Position(a,13)],[Position(a,2),Position(a,14)],'LineWidth',1);
line([Position(a,13),Position(a,19)],[Position(a,14),Position(a,20)],'LineWidth',1);
line([Position(a,19),Position(a,7)],[Position(a,20),Position(a,8)],'LineWidth',1);
%
a=12000;
plot(Position(a,1),Position(a,2),'o',Position(a,7),Position(a,8),'o', ...
    Position(a,13),Position(a,14),'o',Position(a,19),Position(a,20),'o', ...
    Position1(a,1),Position1(a,2),'o',markersize=3,MarkerEdgeColor=[0,0,0],MarkerFaceColor=[0,0,0])

line([Position(a,1),Position(a,7)],[(Position(a,2)),Position(a,8)],'LineWidth',1);
line([Position(a,1),Position(a,13)],[Position(a,2),Position(a,14)],'LineWidth',1);
line([Position(a,13),Position(a,19)],[Position(a,14),Position(a,20)],'LineWidth',1);
line([Position(a,19),Position(a,7)],[Position(a,20),Position(a,8)],'LineWidth',1);
%
a=14000;
plot(Position(a,1),Position(a,2),'o',Position(a,7),Position(a,8),'o', ...
    Position(a,13),Position(a,14),'o',Position(a,19),Position(a,20),'o', ...
    Position1(a,1),Position1(a,2),'o',markersize=3,MarkerEdgeColor=[0,0,0],MarkerFaceColor=[0,0,0])

line([Position(a,1),Position(a,7)],[(Position(a,2)),Position(a,8)],'LineWidth',1);
line([Position(a,1),Position(a,13)],[Position(a,2),Position(a,14)],'LineWidth',1);
line([Position(a,13),Position(a,19)],[Position(a,14),Position(a,20)],'LineWidth',1);
line([Position(a,19),Position(a,7)],[Position(a,20),Position(a,8)],'LineWidth',1);
%
a=16000;
plot(Position(a,1),Position(a,2),'o',Position(a,7),Position(a,8),'o', ...
    Position(a,13),Position(a,14),'o',Position(a,19),Position(a,20),'o', ...
    Position1(a,1),Position1(a,2),'o',markersize=3,MarkerEdgeColor=[0,0,0],MarkerFaceColor=[0,0,0])

line([Position(a,1),Position(a,7)],[(Position(a,2)),Position(a,8)],'LineWidth',1);
line([Position(a,1),Position(a,13)],[Position(a,2),Position(a,14)],'LineWidth',1);
line([Position(a,13),Position(a,19)],[Position(a,14),Position(a,20)],'LineWidth',1);
line([Position(a,19),Position(a,7)],[Position(a,20),Position(a,8)],'LineWidth',1);

