% programa_calc1_values_a_b
pkg load pdsit


rho=0.35;
M=[1:1:45];

hs1=hb_cond_sbceo(rho,M);
hb=hb_func(rho)*ones(size(M));

[A B E]=function_calc1_values_a_b(rho)
he1= hs1(1).^(((M-1).^A)/B + 1);

hf2=figure(2);

plot(M,hb,'--',M,hs1,'-o',M,he1,'-s')
xlim([0 M(end)])
ylim([0 1])
xlabel('M')
ylabel('Entropy')
legend(['h_b(\rho )\leftarrow \rho=' num2str(rho)],['h_b(\rho,M) \leftarrow \rho=' num2str(rho)],'h_b^{(M-1)^A/B+1)}','Location','southwest')
title('APROXIMACION ERRONEA')
print(hf2,'hb_rho_m_2.eps','-deps')

