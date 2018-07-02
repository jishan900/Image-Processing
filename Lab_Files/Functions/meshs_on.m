function [x,y] = meshs_on(m, n)
if mod(m,2) == 0
    i = -m/2 + 1;
    j = m/2;
else
    i = -floor(m/2);
    j = floor(m/2);
end
if mod(n,2) == 0
    i = -n/2 + 1;
    j = n/2;
else
    i = -floor(n/2);
    j = floor(n/2);
end
[x,y] = meshgrid(i:j,i:j); %range