clc; clear; close all; font = 18;
I = imread("Figure6.tif");
figure(1);subplot(121);imshow(I);
title("Original image","fontsize",font);
[pr, r]=imhist(I);pr = pr/sum(pr);
figure(2); subplot(221); stem(r,pr);grid on;
title("Histogram (PMF) of the original image","fontsize",font);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);
cdf = cumsum(pr); L = 256; s = (L-1).*cdf;
figure(2); subplot(222); plot(r,s,"linewidth",1.7); grid on;
xlabel("r_k","fontsize",font); ylabel("s_k","fontsize",font);
title("The transformation function","fontsize",font);
I_tr= uint8(round(s(I+1)));
figure(1);subplot(122);imshow(I_tr);
title("Transformed image (through histogram equalization)",...
    "fontsize",font-3);
[pr_tr, r_tr]=imhist(I_tr);

z = [0 8 16 187 198 255];
s2 = (10^4)*[0 7 .75 0 .6 0];
zi = 0:255;
s2i = interp1(z,s2,zi,'linear');
s2i=s2i/sum(s2i);
figure(2); subplot(223);stem(zi,s2i); grid on;
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);
title("Specified histogram","fontsize",font);

cdf2 = cumsum(s2i); s22 = (L-1).*cdf2;
figure(2); subplot(224); plot(zi,s22,"linewidth",1.7); grid on;
xlabel("z_q","fontsize",font); ylabel("s_k","fontsize",font);
title("The 2nd transformation function","fontsize",font);

figure(3);subplot(121);imshow(I);
title("Original image","fontsize",font);
Itemp = s(I+1);
siz = size(I);
for i = 1:siz(1)
    for j = 1:siz(2)
        [minval, argmin] = min(abs(Itemp(i,j)-s22));
        Itr2(i,j) = uint8(zi(argmin));
    end
end

figure(3);subplot(122);imshow(Itr2);
title("Transformed image (through histogram specification)",...
    "fontsize",font-3);

[pr2, r2]=imhist(Itr2);pr2 = pr2/sum(pr2);
figure(4); stem(r,pr2);grid on;
title("Histogram (PMF) of the transformed image (after histogram specification)","fontsize",font-3);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);

% figure(5); stem(r,pr);grid on;
% title("Histogram (PMF) of the original image","fontsize",font);
% xlabel("Intensity values","fontsize",font-5);
% ylabel("Number of pixels","fontsize",font-5);
% 
% figure(6);stem(zi,s2i); grid on;
% xlabel("Intensity values","fontsize",font-5);
% ylabel("Number of pixels","fontsize",font-5);
% title("Specified histogram","fontsize",font);

