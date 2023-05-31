clc; clear; close all; font = 18;
I = imread("Figure1.tif"); I = im2double(I);
figure(1);subplot(251);imshow(I);
title("Original image","fontsize",font);
c = 1; g = 0.9:-0.1:0.1;
gamma = g(1);Itr = c*(I.^gamma);subplot(252);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(2);Itr = c*(I.^gamma);subplot(253);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(3);Itr = c*(I.^gamma);subplot(254);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(4);Itr = c*(I.^gamma);subplot(255);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(5);Itr = c*(I.^gamma);subplot(256);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(6);Itr = c*(I.^gamma);subplot(257);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(7);Itr = c*(I.^gamma);subplot(258);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(8);Itr = c*(I.^gamma);subplot(259);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(9);Itr = c*(I.^gamma);subplot(2,5,10);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2);subplot(121);imshow(I);
title("Original image","fontsize",font+3);
c_best = 1; gam_best= 0.3;  %for colorimage1
I_best = c_best*(I.^gam_best); 
subplot(122);imshow(I_best);
title("Transformed image with c = "+c_best+", \gamma = "+gam_best,"fontsize",font+3);

figure(3); subplot(121);imhist(I);grid on;
title("Histogram of original image","fontsize",font+3);
subplot(122);imhist(I_best);grid on;
title("Histogram of transformed image with c="+c_best+" and \gamma="+gam_best,...
    "fontsize",font+3);

