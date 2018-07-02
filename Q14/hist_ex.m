function pixels = hist_ex(image, nacc,verbose)
if (nargin < 1)
  error( 'Wrong number of input arguments.')
  return
end
if (nargin <= 1)
  nacc = 256;
end
if (nargin <= 2)
    verbose = 1;
end
h = hist(double(image(:)),0:nacc-1);
map = cumsum(h)/prod(size(image));
mapc = (nacc-1)*map';
pixelss = compose(mapc,image+1);
if (verbose >= 0)
    
   % subplot(2,2,1)
    %showgrey(pixelss)
    %subplot(2,2,2)
    %showgrey(image)
    subplot(1,2,1)
    hist(pixelss(:))
    subplot(1,2,2)
    hist(image(:))
else
    showgrey(pixelss)
end