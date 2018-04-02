function [H NCK PL2P]=hm_symmetric(Ps,M)
	if(~isnumeric(Ps))
		error('Ps only can be a value.');
	end

	if(~isnumeric(M))
		error('M only can be a value.');
	end

	H=zeros(M+1,1);
    PL2P=zeros(M+1,1);
    NCK=zeros(M+1,1);
	for K=0:M
		ProbK=0.5*( (Ps^K)*(1-Ps)^(M-K) + ((1-Ps)^(K))*Ps^(M-K) );
        if(ProbK~=0)
            PL2P(K+1)=ProbK*log2(ProbK);
            NCK(K+1)=nchoosek(M,K);
		    H(K+1)= -NCK(K+1)*PL2P(K+1);
        end
	end

end
