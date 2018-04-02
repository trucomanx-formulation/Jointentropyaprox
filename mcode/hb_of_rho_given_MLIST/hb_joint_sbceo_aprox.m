% [H A B]=hb_joint_sbceo_aprox(0.1,20)
function  [H A B] = hb_joint_sbceo_aprox(RHO,M)

    HB=hb_func(RHO);
    H2=hb_joint_sbceo(RHO,2)/2;

    [A B]=calc_values(RHO);

    H=(H2-HB)*2.^(-(M-2).^A/B)+HB;

end


function [A B]=calc_values(RHO)

    MLIST=[3:30];
    h2s=hb_joint_sbceo(RHO,MLIST)./MLIST;
    HB=hb_func(RHO);
    H2=hb_joint_sbceo(RHO,2)/2;

    if ~iscolumn(h2s)
        h2s=h2s';
    end

    if ~iscolumn(MLIST)
        MLIST=MLIST';
    end
 
    X=[0.4; 1.1];
    Y=log2((h2s-HB)/(H2-HB));
    alpha=0.01;
    E=norm(Y-func_f(X,MLIST)./Y);

    II=1;
    while (E>1.5) && (II<100)
        %II

        FF=func_f(X,MLIST);
        JJ=func_j(X,MLIST);
        X=X+inv(JJ'*JJ+alpha*eye(2))*(JJ'*(Y-FF));
        X=abs(X);

        E=norm(Y-func_f(X,MLIST)./Y)
        II=II+1;
    end

    A=X(1);
    B=X(2);

end

function FF=func_f(X,MLIST)
    if ~iscolumn(MLIST)
        MLIST=MLIST';
    end
    FF=-((MLIST-2).^(X(1)))/X(2);
end

function JJ=func_j(X,MLIST)
    if ~iscolumn(MLIST)
        MLIST=MLIST';
    end
    JJ=[-(log(MLIST-2).*(MLIST-2).^(X(1)))/X(2) (MLIST-2).^(X(1))/(X(2))^2 ];
end
