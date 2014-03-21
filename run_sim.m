function HIST = run_sim( P, A, tmax, cps, FUN, alpha )
%
%	INPUTS::
%
%	P is the initial state of the population.
%		-- x0 should be a column vector.
%		-- length(x0) = n
%		-- n is population size. 
%
%	A is a connectivity matrix.    
%		-- [n,n] = size(A);
%		-- If A(i,j) = 1, then person i is connected to person j.
%		-- Else A(i,j) = 0. 
%		-- A is symmetric with zeros on the diagonal.  
%
%	tmax is the number of steps in the simulation.
%
%	cps is the number of conversations per step.
%	
%	FUN is a function handle.
%		--  [x,y] = FUN(x,y,alpha)
%		--  y talks to x. 
%		--  Describes how to update x and y.   
%
%	alpha is a parameter for input to FUN to scale the updated.
%
%
%
%	OUTPUT::
%
%	HIST is an array that records teh population history.
%		-- [n,tmax+1] = size( HIST )
%		-- First column is the initial population (x0). 
%
	if nargin < 7
		alpha = 3;
	end

	n = length(P);

	HIST = zeros(n, tmax+1);
	
	HIST(:,1) = P;

	for t=1:tmax
	
		a = randi(n,cps,1);  %people that are talking
		for j = 1:cps
			b = find( A(a(j),:) == 1 );   % people with connection to a(j).
			k = randi(length(b),1);
			%  a(j) talks to b(k).
			[P( b(k) ), P( a(j) )] = FUN( P( b(k) ), P( a(j) ), alpha );	
		end
	
		HIST(:,t+1) = P; 
		
	end



end % function end.
