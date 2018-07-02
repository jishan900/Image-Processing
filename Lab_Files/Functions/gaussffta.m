function spat_filter = gaussffta(pic,t)

Fhat = fft2(pic);

siz = size(pic);
m = siz(1);
n = siz(2);
gauss = l_p_filter_sp(m, n, t);


Hhat = fft2(gauss);
%Hhats = fftshift(Hhat);

Fhat_Hhat = Hhat.*Fhat;
%Fhat_Hhat = Hhat.*Fhat;
spat_filter = ifft2(Fhat_Hhat);
showgrey(spat_filter)
showgrey(fftshift(spat_filter))
%showfs(spat_filter)