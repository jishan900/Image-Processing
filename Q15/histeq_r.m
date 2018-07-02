function pixels = histeq_r(image, nacc,verbose)

if (nargin < 1)
  error( 'Wrong number of input arguments.')
  return
end
if (nargin <= 1)
  nacc = 256;
end
if (nargin <= 2)
    verbose = -1;
end

h = hist(double(image(:)),0:nacc-1);
map = cumsum(h)/prod(size(image));
eqtransf = (nacc-1)*map';
pixels = compose(eqtransf,image+1);

if (verbose >= 0)
    
    subplot(2,2,1)
    showgrey(image)
    subplot(2,2,2)
    hist(image(:))
    subplot(2,2,3)
    showgrey(pixels)
    subplot(2,2,4)
    hist(pixels(:))
    
else
    showgrey(pixels)
end