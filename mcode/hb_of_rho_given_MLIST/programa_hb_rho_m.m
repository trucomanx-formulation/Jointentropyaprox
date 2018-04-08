%% pkg install pdsit-pkg.tar.gz
pkg load pdsit

N=63;
p1=linspace(0.00,1.00,N);

h1=hb_func(p1);
P=4
A =  0.95234
B =  0.98013

h2s=hb_cond_sbceo(p1,2);
h8s=hb_cond_sbceo(p1,8);
h16s=hb_cond_sbceo(p1,16);
h32s=hb_cond_sbceo(p1,32);
h45s=hb_cond_sbceo(p1,45);
hf1=figure(1);
plot  ( p1,h1,'--',p1,h2s,'-s',p1,h1.^1.75,'-.',p1,h8s,'->',p1,h1.^7,'-.', ...
        p1,h16s,'-<',p1,h1.^14,'-.',p1,h32s,'-v',p1,h1.^28,'-.',p1,h45s,'-v',p1,h1.^39.375,'-.', ...
        p1,h1.^((P-1)^A/B+1),'-*')
xlabel('Probability \rho')
ylabel('Entropy Cond')
legend( 'h_b(\rho)','h_b(\rho,2)','h_b(\rho)^{1.75}','h_b(\rho,8)','h_b(\rho)^{7}', ...
        'h_b(\rho,16)','h_b(\rho)^{14}','h_b(\rho,32)','h_b(\rho)^{28}','h_b(\rho,45)','h_b(\rho)^{39.375}', ...
        'pow(h_b(\rho),(P-1)^{0.96039}/0.97455)')
print(hf1,'hb_rho_m.eps','-deps')


