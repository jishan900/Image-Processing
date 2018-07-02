load canoe256
neg1=-Canoe;
showgrey(neg1);
neg2=255-Canoe;
showgrey(neg2);
nallo=nallo256;
showgrey(nallo.^(1/3));
showgrey(cos(nallo/10));
hist(neg1(:))
hist(neg2(:))