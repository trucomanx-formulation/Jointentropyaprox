clear
hold off
%p1=0 p2=0 p3=0.5
%H=load('salidaH.dat');
H321=2;
H32 =1;
H31 =1;
H3  =1;
H21 =1;
H2  =0;
H1  =0;

set(gca,'fontsize',20); % sets font of numbers on axes

delta=0.05;

deltax=delta;
xmax=2;
deltay=delta;
ymax=2;
deltaz=delta;
zmax=2;

[x1,y1]=meshgrid(0.0:deltax:xmax,0.0:deltay:ymax);
z1=H3+0*x1;

[x2,z2]=meshgrid(0.0:deltax:xmax,0.0:deltaz:zmax);
y2=H2+0*x2;

[z3,y3]=meshgrid(0.0:deltaz:zmax,0.0:deltay:ymax);
x3=H1+0*z3;

[x4,y4]=meshgrid(0.0:deltax:xmax,0.0:deltay:ymax);
z4=H31-x4;

[x5,z5]=meshgrid(0.0:deltax:xmax,0.0:deltaz:zmax);
y5=H21-x5;

[x6,z6]=meshgrid(0.0:deltaz:zmax,0.0:deltay:ymax);
y6=H32-z6;

[x7,y7]=meshgrid(0.0:deltax:xmax,0.0:deltay:ymax);
z7=H321-x7-y7;

%%plot3(x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4,x5,y5,z5,x6,y6,z6,x7,y7,z7),grid
hold on
surf(x1,y1,z1),grid
surf(x2,y2,z2),grid
surf(x3,y3,z3),grid
surf(x4,y4,z4),grid
surf(x5,y5,z5),grid
surf(x6,y6,z6),grid
surf(x7,y7,z7),grid
hold off
axis([0 xmax 0 ymax 0 zmax]);
az = 135;
el = 45;
view(az, el);
xlabel('R_1');ylabel('R_2');zlabel('R_3');

print('slepianwolf3d1.eps','-deps','-color');

