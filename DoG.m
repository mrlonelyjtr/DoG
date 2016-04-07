function keyPoint = DoG(k,layer,sigma,threshold,imTest)
	keyPoint = [];

	%gaussian
	for i = 1:layer
		g(:,:,i) = fspecial('gaussian',80,k*sigma^i);
	end

	%difference of gaussian
	for i = 1:layer-1
		d(:,:,i) = imfilter(imTest,g(:,:,i+1)-g(:,:,i));
	end

	%compare with other 26 neighbors
	for i = layer-2:-1:2
		for m = 2:size(imTest,1)-1
			for n = 2:size(imTest,2)-1
				neighbor = d(m-1:m+1,n-1:n+1,i-1:i+1);
				neighbor(14) = [];

				if (d(m,n,i)-max(neighbor) > threshold || d(m,n,i)-min(neighbor) < -threshold)
					keyPoint = [keyPoint;[m,n,1.5*k*sigma^i]];
				end
			end
		end
	end
end