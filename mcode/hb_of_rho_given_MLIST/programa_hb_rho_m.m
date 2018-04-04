%% pkg install pdsit-pkg.tar.gz
pkg load pdsit

N=32;
p1=linspace(0.00,1.00,N);

h1=hb_func(p1);

h2s=hb_cond_sbceo(p1,2);
h4s=hb_cond_sbceo(p1,4);
h8s=hb_cond_sbceo(p1,8);
h16s=hb_cond_sbceo(p1,16);
hf1=figure(1);
plot(p1,h1,'--',p1,h2s,'-s',p1,h4s,'-o',p1,h8s,'->',p1,h16s,'->')
xlabel('Probability \rho')
ylabel('Entropy Cond')
legend('h_b(\rho)','h_b(\rho,2)','h_b(\rho,4)','h_b(\rho,8)','h_b(\rho,16)')
print(hf1,'hb_rho_m.eps','-deps')


rho=0.48;
M=[1:2:45];

hs1=hb_cond_sbceo(rho,M);
hb=hb_func(rho)*ones(size(M));

[A B E]=function_calc_values_a_b(rho)
he1=hs1(1)*2.^(-((M-1).^A)/B);

hf2=figure(2);

plot(M,hb,'--',M,hs1,'-o',M,he1,'-s')
xlim([0 M(end)])
ylim([0 1])
xlabel('M')
ylabel('Entropy')
legend(['h_b(\rho )\leftarrow \rho=' num2str(rho)],['h_b(\rho,M) \leftarrow \rho=' num2str(rho)],'h_b2^{-(M-1)^A/B)}','Location','southwest')
title('APROXIMACION ERRONEA')
print(hf2,'hb_rho_m_2.eps','-deps')
