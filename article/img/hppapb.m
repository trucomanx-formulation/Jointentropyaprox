r=100;
pc=[1:r:20*r+1]/(20*r+2);			h0=hb(pc);

p1=0.1;	pc1=p1+pc-2*p1*pc;	h1=hb(pc1);
p2=0.2;	pc2=p2+pc-2*p2*pc;	h2=hb(pc2);
p3=0.3;	pc3=p3+pc-2*p3*pc;	h3=hb(pc3);
p4=0.4;	pc4=p4+pc-2*p4*pc;	h4=hb(pc4);
p5=0.5;	pc5=p5+pc-2*p5*pc;	h5=hb(pc5);
p6=0.6;	pc6=p6+pc-2*p6*pc;	h6=hb(pc6);
p7=0.7;	pc7=p7+pc-2*p7*pc;	h7=hb(pc7);
p8=0.8;	pc8=p8+pc-2*p8*pc;	h8=hb(pc8);
p9=0.9;	pc9=p9+pc-2*p9*pc;	h9=hb(pc9);

FONTSIZE=36;
MZ=22;
set(gca,'fontsize',FONTSIZE,'GridLineStyle','--'); % sets font of numbers on axes


plot(	 pc,h0,'--','markersize',MZ
	,pc,h1,'x-','markersize',MZ
	,pc,h2,'s-','markersize',MZ
	,pc,h3,'p-','markersize',MZ
	,pc,h4,'<-','markersize',MZ
	,pc,h5,'o-','markersize',MZ
	); grid on;
xlabel('p_c','fontsize',FONTSIZE);
ylabel('h_b(p_c || p_a)','fontsize',FONTSIZE);

legend('h_b(p_c)','h_b(p_c || 0.1)','h_b(p_c || 0.2)','h_b(p_c || 0.3)','h_b(p_c || 0.4)','h_b(p_c || 0.5)',3);legend('boxon');

print('hppapb.eps','-deps','-portrait','-F:32');





