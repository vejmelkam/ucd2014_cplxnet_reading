function [x,y] = talk( x, y, alpha )

	% y talks to x. 
	% This function updates both the talker and the listener. 

	if nargin < 3
		alpha = 3;
	end

	%persuasiveness
	f = @(x) -sign(x).*(.5*(tanh((x+3)) - tanh((x-3))) - 1);
	%susceptiblity
	g = @(x) 1 ./( 1 + x.^2 );

	x = x +  alpha*f( y ) * g( x );
	y = y +  alpha*f( x ) * g( y );
	
end
