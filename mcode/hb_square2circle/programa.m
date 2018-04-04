%
pkg load pdsit

p1=linspace(0,1,32);

M=2;
hb=hb_func(p1);
hb2s=hb_cond_sbceo(p1,M);
hb16s=hb_cond_sbceo(p1,16);

alpha=0.0;
p2=0.5-alpha*(p1-0.5);
hb2b=hb_func(p1)+hb_func(p2)-hb_func(p1+p2-2*p1.*p2);

plot(p1,p1,'-s',p1,p2,'-o')
xlabel('\rho_1');
ylabel('\rho_2');
legend('Curve 1','Curve 2')
print(gcf,'programa-probs.eps','-deps')


plot(p1,hb,'-p',p1,hb2s,'->',p1,hb16s,'-<',p1,hb2b,'-o')
xlabel('\rho');
ylabel('Conditional Entropy');
legend('h_b(\rho)','h_b(\rho,2)','h_b(\rho,16)','h_b(\rho_1,\rho_2)')
print(gcf,'programa.eps','-deps')

[X,Y] = meshgrid(p1,p1);

Z = hb_func(X)+hb_func(Y) -hb_func(X+Y-2*X.*Y);
surf(X,Y,Z)
xlabel('\rho_1');
ylabel('\rho_2');
zlabel('Cond Entropy');
print(gcf,'programa-surf-cond.eps','-deps')


graphics_toolkit("fltk")
[A B]=transform_func(2*X-1, 2*Y-1);
A=0.5+0.5*A;
B=0.5+0.5*B;


surf(A,B,Z)
xlabel('\rho_1');
ylabel('\rho_2');
zlabel('Cond Entropy');
print(gcf,'programa-surf-cond2.eps','-deps')

pcolor(A,B,Z)
colorbar();
xlabel('\rho_1');
ylabel('\rho_2');
zlabel('Cond Entropy');
print(gcf,'programa-surf-cond3.eps','-depsc')
%graphics_toolkit("qt")


