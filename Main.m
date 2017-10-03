% Applying 10 binarization algorithms for Test.bmp image

close all; clear all;
TestImage = imread('Test.bmp');
GrayTestImage = rgb2gray(TestImage);

figure(1);
subplot(3,1,1); imshow(TestImage); title(sprintf('Original Image'));
fprintf('Size of current image is %d x %d \n', size(GrayTestImage));
    
%1 Binarization by using Otsu`s method   
subplot(3,1,2); imshow(imbinarize(GrayTestImage, graythresh(GrayTestImage)));  
title(sprintf('Binarised by Otsu`s method'));

%2 Binarization by using Sauvola method
subplot(3,1,3); imshow(sauvola(GrayTestImage, [150 150]));   
title(sprintf('Binarised using Sauvola method'));

figure(2);
%3 Binarization by using Wolf method
subplot(3,1,1); imshow(wolf(GrayTestImage, [100 100]));
title(sprintf('Binarised using Wolf method'));

%4 Binarization by using Bernsen method
subplot(3,1,2); imshow(bernsen(GrayTestImage, [3 3], 128));
title(sprintf('Binarised using Bernsen method'));

%5 Binarization by using Kittler method
[Trashh, Minn] = kittler(GrayTestImage); 
subplot(3,1,3); imshow(imbinarize(GrayTestImage, Trashh / 255)); 
title(sprintf('Binarised using Kittler method'));

figure(3);
%6 Binarized by using Niblack method
subplot(3,1,1); imshow(niblack(GrayTestImage, [151 151], -0.2, 25));
title(sprintf('Binarised using Niblack method'));

%7 Binarization by using Bradley method
subplot(3,1,2); imshow(bradley(GrayTestImage, [25 25]));
title(sprintf('Binarised using Bradley method'));

%8 Binarization by using Gatos method
[BinarizedByGatos, Background_Gatos] = BinarizationGatos(GrayTestImage);
subplot(3,1,3); imshow(BinarizedByGatos);
title(sprintf('Binarised using Gatos method'));

figure(4);
%9  Binarization by using adaptive image threshold 
subplot(3,1,1); imshow(imbinarize(GrayTestImage, adaptthresh(GrayTestImage,...
   'ForegroundPolarity', 'dark')));
title(sprintf('Binarised using adaptive image threshold'));

%10 Binarization by using Feng method
subplot(3,1,2); imshow(feng(GrayTestImage, [11 11], [20 40]));
title(sprintf('Binarised using Feng method'));