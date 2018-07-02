function hist_equalization(image, nacc,verbose)
%function pixels = hist_ex(image, nacc,verbose)
%I = rgb2gray(imread('Unequalized_Hawkes_Bay_NZ.jpg'));
%h = hist(double(nallo(:)),0:255);
if (nargin < 1)
  error( 'Wrong number of input arguments.')
  return
end
if (nargin <= 1)
  nacc = 255;
end
if (nargin <= 2)
    verbose = -1;
end
h = hist(image(:),0:nacc);
map1 = cumsum(h)/prod(size(image));
%eqtransf = 255*map(nallo+1);
%J = compose(map,nallo+1);
mapc = nacc*map1';
%eqtransf1 = compose(mapc,image+1);
pixelss = compose(mapc,image+1);
[h x]=hist(double(pixelss(:)),0:255);
map = cumsum(h)/prod(size(pixelss));
if (verbose<1)
    
    figure(1)
    hold on
    bar(x, h, 'r');
    plot(x, 30000*map, 'k')
    xlim([0 256]);
    ylim([0 31000]);
    title(sprintf('Equalized Histogram'))
    display('Equalized Histogram.svg')
    %if (verbose >= 0)
    
%    subplot(2,2,1)
 %   showgrey(pixelss)
  %  subplot(2,2,2)
   % showgrey(image)
%    subplot(2,2,3)
 %   hist(pixelss(:))
  %  subplot(2,2,4)
  %  hist(image(:))
%else
 %   showgrey(pixelss)
%end
else
    showgrey(pixelss)
end