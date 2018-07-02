function histeq(imageFileName)
im = imread(imageFileName);
img = rgb2gray(im);
for i=1:1:256
specPDF(i) = log(i/256); %Log Transform
% specPDF(i) = power(i/256,3); %Power Function
end
specPDF = specPDF-min(specPDF);
figure,plot(specPDF),title('Specified CDF...');
sum = specPDF(1);
for i=256:-1:2
specPDF(i)= specPDF(i)-specPDF(i-1);
end
figure, plot(specPDF), title('Specified PDF...');
figure, imshow(img), title('Original Image');
[imEq, transEq] = histeq(img);
figure, imshow(imEq), title('Equalized Image');
% figure, plot(transEq), title(’Equalization Function’);
[imSpec, transSpec] = histeq(img, specPDF);
figure, imshow(imSpec), title('Matched Image');
% figure, plot(transSpec), title(’Specification transform’);
[imSpecEq, transfSpecEq] = histeq(imSpec);
figure, plot(transfSpecEq), title('Specified Image Histogram...');