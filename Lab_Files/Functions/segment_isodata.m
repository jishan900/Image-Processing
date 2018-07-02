function J = segment_isodata(I)
I = double(I);
J = logical(zeros(size(I))); % return matrix
% image histogram
max_pixel = max(I(:));
bins = 0:max_pixel;
H = histc(I(:),bins)';
% zero-phase smoothing of the histogram (so peaks don't shift)
H_smoothed = conv(H,  [ 1 1 1 1 1]./5);
H(2:length(H)) = H_smoothed(5:length(H_smoothed)-1);
% isodata algorithm
nh = length (H);
T_prev = -1;
T = round(max_pixel/2);
if T % guard against the pathological case where 1=0
    kk = 1;
    while (T_prev ~= T) & (kk <= 10)
        % mean (center-of-mass) above T
        sumhi = sum(H(T:nh));
        if sumhi
            mhi = sum(bins(T:nh).*H(T:nh)) ./ sumhi;
        else % handle case where upper portion of hist all zeros
            mhi = T + length(T:nh)/2;
        end
        % mean (center-of-mass) below T
        sumlo = sum(H(1:T-1));
        if sumlo
            mlo = sum(bins(1:T-1).*H(1:T-1)) ./ sumlo;
        else % handle case where lower portion of hist all zeros
            mlo = (T-1)/2;
        end
        T_prev=T;
        T=round((mhi+mlo)/2);
        kk=kk+1;
    end % end (while no convergence)
end % if image isn't entirely all zeros
% segmentation
indices = find(I > T);
J (indices) = true;