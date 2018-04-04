function [A B E]=function_calc_values_a_b(RHO)

    MLIST=[2:20];
    h2s=hb_cond_sbceo(RHO,MLIST);
    H1 =hb_func(RHO);


    if ~iscolumn(h2s)
        h2s=h2s';
    end

    if ~iscolumn(MLIST)
        MLIST=MLIST';
    end
 
    X=[0.9; 1.1];
    Y=log2(h2s/H1);
    alpha=0.0001;
    E=norm(Y-func_f(X,MLIST));

    II=1;
    while (E>0.001) && (II<100000)
        %II

        FF=func_f(X,MLIST);
        JJ=func_j(X,MLIST);
        X=X+inv(JJ'*JJ+alpha*eye(2))*(JJ'*(Y-FF));
        X=abs(X);

        E=norm(Y-func_f(X,MLIST));
        II=II+1;
    end

    A=X(1);
    B=X(2);

end

function FF=func_f(X,MLIST)
    if ~iscolumn(MLIST)
        MLIST=MLIST';
    end
    FF=-((MLIST-1).^(X(1)))/X(2);
end

function JJ=func_j(X,MLIST)
    if ~iscolumn(MLIST)
        MLIST=MLIST';
    end
    JJ=[-(log(MLIST-1).*(MLIST-1).^(X(1)))/X(2) (MLIST-1).^(X(1))/(X(2))^2 ];
end
