%% pkg install pdsit-pkg.tar.gz
pkg load pdsit

N=32;
p1=linspace(0.00,1.00,N);

h1=hb_func(p1);

h2s=hb_joint_sbceo(p1,2)/2;
h4s=hb_joint_sbceo(p1,4)/4;
h8s=hb_joint_sbceo(p1,8)/8;
h16s=hb_joint_sbceo(p1,16)/16;
hf1=figure(1);
plot(p1,h1,'--',p1,h2s,'-s',p1,h4s,'-o',p1,h8s,'->',p1,h16s,'->')
xlabel('Probability \rho')
ylabel('Entropy')
legend('h_b(\rho)','h_b(\rho,2)/2','h_b(\rho,4)/4','h_b(\rho,8)/8','h_b(\rho,16)/16')
print(hf1,'hb_rho_m.eps','-deps')


rho=0.1;
M=[2:2:30];
B=1.6508;
A=0.53479;
hs1=hb_joint_sbceo(rho,M)./M;
hb=hb_func(rho)*ones(size(M));
he1=hb_func(rho)+(hb_joint_sbceo(rho,2)/2-hb_func(rho))*2.^(-(M-2).^A/B);

hf2=figure(2);

plot(M,hb,'--',M,hs1,'-o',M,he1,'-s')
xlabel('M')
ylabel('Quantization steps')
legend('h_b(\rho )\leftarrow \rho=0.1','h_b(\rho,M)/M \leftarrow \rho=0.1','h_b+(h_2-h_b)2^{-(M-2)^A/B)}')
title('APROXIMACION ERRONEA')
print(hf2,'hb_rho_m_2.eps','-deps')
