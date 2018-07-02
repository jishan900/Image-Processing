sigma = .5;
%i = imread(fpath);
h = fspecial('gaussian',[10,10],sigma);
%subplot(1,2,1)
figure(1),showgrey(h)
figure(2),surfc(h);
%o = imfilter(i,h,'same','conv')