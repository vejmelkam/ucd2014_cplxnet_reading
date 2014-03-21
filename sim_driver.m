%  Driver for simulation and plotting. 


tmax = 100;
n = 100;
cps = 10;  % conversations per step 

% Connectivity matrix. 
A = randi(2,n) - 1;
A = triu(A,1) + triu(A,1)'; 

% Initial population

P = 3*randn(n,1);
%P = [ -6*ones(10,1); rand(80,1)-.5 ; 6*ones(10,1) ];


%  f and g are commented out now.  They are now inside the function @talk.

%persuasiveness
%f = @(x) -sign(x).*(.5*(tanh((x+3)) - tanh((x-3))) - 1);
%susceptiblity
%g = @(x) 1 ./( 1 + x.^2 );

alpha = 3;

%plot(-5:.1:5,f(-5:.1:5)); hold all;
%plot(-5:.1:5,g(-5:.1:5));

HIST = run_sim( P, A, tmax, cps, @talk, alpha );


%%%%%%%%%%%%%%%%%%%%
%
%    Movies 
%
%%%%%%%%%%%%%%%%%%%%
c=2;

for i = 1:n
	
	if P(i) < 0
		%blue
		if( abs(P(i)) > 6 )
			mycolor(i,:) = [0,0,1];
		else
			mycolor(i,:) = [1-(abs(P(i))+c)/(6+c), 1- (abs(P(i))+c)/(6+c), 1];
		end
	elseif P(i) > 0 
		%blue
		if( abs(P(i)) > 6 )
			mycolor(i,:) = [1,0,0];
		else
			mycolor(i,:) = [1,1-(abs(P(i))+c)/(6+c), 1- (abs(P(i))+c)/(6+c)];
		end
	else
		mycolor(i,:) = [0,1,0];
	end
end



for i = 1:(tmax+1)
	for j = 1:n
		plot( HIST(j,i), f( HIST(j,i) ), '.', 'color', mycolor(j,:)); hold all;
		axis([-6 6 -1 1]);
	end
	M(i) = getframe;
	hold off;
end

movie(M)


BINS = -5:5;
for i = 1:(tmax+1)
	hist( HIST(:,i), BINS );
	axis([-6 6 0, n]);
	M2(i) = getframe;
	hold off;
end

movie(M2)


