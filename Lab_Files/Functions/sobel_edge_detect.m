function J = sobel_edge_detect(I, T)
%I = double(I);
% compute gradient image
%Gx = filter2([1 0 -1;2 0 -2;1 0 -1], I, 'valid');
%Gy = filter2([-1 -2 -1;0 0 0;1 2 1], I, 'valid');
%G = abs(Gx) + abs(Gy);


dxmask = fspecial('sobel')';
dymask = fspecial('sobel');
%if (nargin < 2)
%shape = 'same';
%end
fourier_filter = gaussfftb(I,1);
%Lx = filter2(dxmask, inpic, shape);
%Ly = filter2(dymask, inpic, shape);
Lx = filter2(dxmask, fourier_filter, 'same');
Ly = filter2(dymask, fourier_filter, 'same');

%lx = gaussfftb(Lx,1);
%ly = gaussfftb(Ly,1);

pixel = Lx.^2 + Ly.^2;
%pixel = abs(Lx)+abs(Ly);

if 1 == nargin % using the histogram, select a good threshold
    J = segment_isodata(pixel);
else % binarize image using user-provided threshold value
    J = logical(zeros(size(pixel))); % return matrix
    indices = find(pixel > T);
    J(indices) = true;
end