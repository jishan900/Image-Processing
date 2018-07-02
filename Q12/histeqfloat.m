function nim = histeqfloat(im, nbins)
    
    if ~exist('nbins', 'var'), nbins = 256; end
    
    im = normalise(im);  % Adjust image range 0-1
    
    % Compute histogram bin centres and form histogram
    centres = [1/nbins/2 : 1/nbins : 1-1/nbins/2];
    n = hist(im(:), centres);

    n = cumsum(n/sum(n));  % Cumulative sum of normalised histogram
    
    % Use 1D spline interpolation on the cumulative histogram to map image
    % values to their new ones, then reshape the image back to its original
    % size.
    nim = reshape(interp1(centres, n, im(:), 'spline'), size(im));
    %showgrey(nim)