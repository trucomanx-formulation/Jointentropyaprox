%
Ps=0.1;
M=45;

[H NCK PL2P]=hm_symmetric(Ps,M);
MM=[0:M];

hf1=figure(1);
plot(MM,H,'-o');
print(hf1,'hm_symmetric_elem1.eps','-deps')

hf2=figure(2);
plot(MM,NCK,'-o');
print(hf2,'hm_symmetric_elem2.eps','-deps')

hf3=figure(3);
plot(MM,PL2P,'-o');
print(hf3,'hm_symmetric_elem3.eps','-deps')
