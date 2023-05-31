clc; clear; close all; font = 18;
I = imread("Figure3.tif");
%I = imread("colorimage2.bmp");
figure(1);subplot(121);imshow(I);
title("Original image","fontsize",font);
[pr, r]=imhist(I);pr = pr/sum(pr);
figure(2); subplot(131); stem(r,pr);grid on;
title("Histogram (PMF) of the original image","fontsize",font-3);
cdf = cumsum(pr); L = 256; s = (L-1).*cdf;
figure(2); subplot(132); plot(r,s,"linewidth",1.7); grid on;
xlabel("r_k","fontsize",font); ylabel("s_k","fontsize",font);
title("The transformation function","fontsize",font);
I_tr= uint8(round(s(I+1)));
figure(1);subplot(122);imshow(I_tr);
title("Transformed image (through histogram equalization)",...
    "fontsize",font-3);
[pr_tr, r_tr]=imhist(I_tr);
figure(2); subplot(133); pr_tr = pr_tr/sum(pr_tr); stem(r,pr_tr);grid on;
title("Histogram of the transformed image after equalization",...
    "fontsize",font-5);
