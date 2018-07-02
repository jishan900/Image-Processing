function four_filter = gaussfftb(pic,t)
Fhat = fft2(pic);
siz = size(pic);
m = siz(1);
n = siz(2);
H = low_pass_filter('gaussian', m, n, t);
Hhat = fft2(H);
Fhat_Hhat = Fhat.*Hhat;
four_filter = ifft2(Fhat_Hhat);
showgrey(four_filter)