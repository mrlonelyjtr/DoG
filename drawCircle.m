function drawCircle(keyPoint)
	alpha = 0:pi/20:2*pi;

	for i = 1:size(keyPoint,1)
    	R = keyPoint(i,3);
    	X = R*cos(alpha)+keyPoint(i,2); 
    	Y = R*sin(alpha)+keyPoint(i,1); 
    	plot(X,Y,'-r') 
	end
end