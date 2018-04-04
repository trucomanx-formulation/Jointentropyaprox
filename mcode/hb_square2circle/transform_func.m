%
function [A B]=transform_func(X,Y)

    A=X.*sqrt( 1-(Y.^2)/2 );
    B=Y.*sqrt( 1-(X.^2)/2 );

end
