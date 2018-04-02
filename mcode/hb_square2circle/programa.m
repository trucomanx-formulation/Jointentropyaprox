%
pkg load pdsit

p1=linspace(0,1,32);

M=2;
hb=hb_func(p1);
hb2s=hb_cond_sbceo(p1,M);

hb2a=hb_func(p1)+hb_func(p1)-hb_func(p1+p1-2*p1.*p1);

alpha=0.0;
p2=0.5-alpha*(p1-0.5);
hb2b=hb_func(p1)+hb_func(p2)-hb_func(p1+p2-2*p1.*p2);

plot(p1,p1,'-s',p1,p2,'-o')
xlabel('\rho_1');
ylabel('\rho_2');
legend('Curve 1','Curve 2')
print(gcf,'programa-probs.eps','-deps')


plot(p1,hb,'-p',p1,hb2s,'->',p1,hb2a,'-s',p1,hb2b,'-o')
xlabel('\rho');
ylabel('Conditional Entropy');
legend('h_b(\rho)','h_b(\rho,2)','h_b(\rho_1,\rho_1)','h_b(\rho_1,\rho_2)')
print(gcf,'programa.eps','-deps')



Z = hb_func(X)+hb_func(Y) -hb_func(X+Y-2*X.*Y);
surf(X,Y,Z)
xlabel('\rho_1');
ylabel('\rho_2');
zlabel('Cond Entropy');
print(gcf,'programa-surf-cond.eps','-deps')


graphics_toolkit("fltk")
A=0.5+0.5*(2*X-1.0).*sqrt(1-((2*Y-1).^2)/sqrt(2));
B=0.5+0.5*(2*Y-1.0).*sqrt(1-((2*X-1).^2)/sqrt(2));
surf(A,B,Z)
xlabel('\rho_1');
ylabel('\rho_2');
zlabel('Cond Entropy');
print(gcf,'programa-surf-cond2.eps','-deps')

%graphics_toolkit("qt")


