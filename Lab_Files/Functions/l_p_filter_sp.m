function gauss = l_p_filter_sp(m, n, sigma)
[x,y] = meshs_on(m,n); %range
%sigma = 0.5;
gauss = 1/(2*pi*sigma^2)*exp(-(x.^2+y.^2)/(2*sigma^2));
gauss = gauss./sum(gauss(:));%normalization
%showgrey(gauss)
%figure,surfc(gauss)