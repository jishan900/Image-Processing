function hist_ex1 = histeq_float(imag_, acc)
if ~exist('nbins', 'var'), nbins = 256; end
if ~isa(imag_,'double'), imag_ = double(imag_); end
nimag = imag_ - min(imag_(:));
nimag = nimag/max(nimag(:));
    
%    im = normalise(im);  % Adjust image range 0-1
    
    % Compute histogram bin centres and form histogram
    
centres = [1/acc/2 : 1/acc : 1-1/acc/2];
n = hist(nimag(:), centres);
n = cumsum(n/sum(n));  % Cumulative sum of normalised histogram
    
    % Use 1D spline interpolation on the cumulative histogram to map image
    % values to their new ones, then reshape the image back to its original
    % size.
hist_ex1 = reshape(interp1(centres, n, nimag(:), 'spline'), size(nimag));
showgrey(hist_ex1)