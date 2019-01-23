function p = im_psnr(x,y)
	x = double(x);
	y = double(y);
	mse = mean((x(:)-y(:)).^2);
	p = 10*log10(255^2/mse);
end

