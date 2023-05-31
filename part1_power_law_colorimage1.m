clc; clear; close all; font = 18;
I = imread("colorimage1.bmp"); I = im2double(I);
figure(1);subplot(241);imshow(I);
title("Original image","fontsize",font);
c = 3; g=[1.4 1.6 2 2.4 2.7 3 3.4 3.7];

gamma = g(1);Itr = c*(I.^gamma);subplot(242);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(2);Itr = c*(I.^gamma);subplot(243);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(3);Itr = c*(I.^gamma);subplot(244);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(4);Itr = c*(I.^gamma);subplot(245);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(5);Itr = c*(I.^gamma);subplot(246);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(6);Itr = c*(I.^gamma);subplot(247);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);
gamma = g(7);Itr = c*(I.^gamma);subplot(248);imshow(Itr);
title("c = "+c+", \gamma = "+gamma,"fontsize",font);

figure(2);subplot(121);imshow(I);
title("Original image","fontsize",font+3);
c_best = 3; gam_best= 2.7;  %for colorimage1
I_best = c_best*(I.^gam_best); 
subplot(122);imshow(I_best);
title("c = "+c_best+", \gamma = "+gam_best,"fontsize",font+3);

figure(3); subplot(121);imhist(I);grid on;
title("Histogram of original image","fontsize",font+3);
subplot(122);imhist(I_best);grid on;
title("Histogram of transformed image with c="+c_best+" and \gamma="+gam_best,...
    "fontsize",font+3);
