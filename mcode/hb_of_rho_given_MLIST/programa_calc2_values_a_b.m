% programa_calc2_values_a_b
pkg load pdsit
N=20;
RHO_init=0.01;
RHO_end=0.4999;
%d=(RHO_end/RHO_init)^(1/(N-1));
%RHO=zeros(1,N);
%for II=1:N
%    RHO(N-II+1)=RHO_end^(II);
%end
RHO=linspace(RHO_init,RHO_end,N);
POLY=zeros(N,2);
M=[1:45];
Y=zeros(N,length(M));

for II=1:N
    hs1=hb_cond_sbceo(RHO(II),M);
    hb1=hb_func(RHO(II));
    Y(II,:)=log(hs1)/log(hb1);
    [p1,S] = polyfit(M,Y(II,:),1);
    POLY(II,:)=p1;
end


hf1=figure(1);
plot(   M,Y(1,:),'-o',M,M*POLY(1,1)+POLY(1,2),'-.', ...
        M,Y(7,:),'-o',M,M*POLY(7,1)+POLY(7,2),'-.', ...
        M,Y(13,:),'-o',M,M*POLY(13,1)+POLY(13,2),'-.', ...
        M,Y(end,:),'-s')
%xlim([0 4])
%ylim([0 4])
print(hf1,'programa_calc2_hb_expo_rectas.eps','-deps')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h1=hb_func(RHO);

h2s=hb_cond_sbceo(RHO,2);
h4s=hb_cond_sbceo(RHO,4);
h8s=hb_cond_sbceo(RHO,8);
h16s=hb_cond_sbceo(RHO,16);

hf2=figure(2);
plot  ( RHO,h1,'--', ... 
        RHO,h2s,'-o' ,RHO,h1.^(POLY(:,1)'*2 +POLY(:,2)'),'-p', ...
        RHO,h4s,'-v' ,RHO,h1.^(POLY(:,1)'*4 +POLY(:,2)'),'-.', ...
        RHO,h8s,'-*' ,RHO,h1.^(POLY(:,1)'*8 +POLY(:,2)'),'-<', ...
        RHO,h16s,'-s',RHO,h1.^(POLY(:,1)'*16+POLY(:,2)'),'->')
xlabel('Probability \rho')
ylabel('Entropy Cond')
legend( 'h_b(\rho)',...
        'h_b(\rho,2)','pow(h_b(\rho),k_1(\rho) 2+ k_2(\rho))',...
        'h_b(\rho,4)','pow(h_b(\rho),k_1(\rho) 4+ k_2(\rho))',...
        'h_b(\rho,8)','pow(h_b(\rho),k_1(\rho) 8+ k_2(\rho))',...
        'h_b(\rho,16)','pow(h_b(\rho),k_1(\rho) 16+ k_2(\rho))')
print(hf2,'programa_calc2_hb_rho_m_aproximacion2.eps','-deps')

%p1 =   0.83174   0.89540
%p2 =   0.95356   0.33787
