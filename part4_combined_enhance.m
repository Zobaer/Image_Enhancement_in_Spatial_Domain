clc; clear; close all; font = 11;
a = imread("Figure7.tif");
a = im2double(a);
figure(1);subplot(241);imshow(a);
title("(a) Original Image","fontsize",font);
laplace = [1 1 1; 1 -8 1; 1 1 1]; %Lapacian filter
b = convn(a,laplace,'same'); subplot(242);imshow(b);
title("(b) After Applying Laplacian Filter","fontsize",font);
c = a-b;c(find(c<0))=0;
subplot(243);imshow(c);
title("(c) Sharpened Image ((a)-(b))","fontsize",font);
sobelx = [-1 -2 -1; 0 0 0; 1 2 1];
sobely = [-1 0 1; -2 0 2; -1 0 1];
dx = convn(a,sobelx,'same');
dy = convn(a,sobely,'same');
d = abs(dx) + abs(dy); subplot(244);imshow(d);
title("(d) After Applying Sobel Operator","fontsize",font);
mf = (1/25)*ones(5,5); %moving average filter
e = convn(d,mf,'same'); subplot(245);imshow(e);
title("(e) Sobel Image After 5\times5 Moving Avg. Filtering",...
    "fontsize",font);
f = c.*e; subplot(246);imshow(f);
title("(f) Mask Image ((c)\times(e))","fontsize",font);
g = a+f; subplot(247);imshow(g);
title("(g) Sharpened Image ((a)+(f))","fontsize",font);
cc = 1; gamma = .44;
h = cc*(g.^gamma);
subplot(248);imshow(h);
title("(h) Final Image After Power-law Trans. (c ="+cc+...
    " and \gamma ="+gamma+")","fontsize",font);



%Compare with the final result
figure(2);subplot(121);imshow(a);
title("Original image","fontsize",font+7);
subplot(122);imshow(h);
title("After Combined Spatial Enhancement","fontsize",font+7);

font = 18;
%All results separately
figure(3);imshow(a);title("(a) Original Image","fontsize",font);
figure(4);imshow(b);title("(b) After Applying Laplacian Filter","fontsize",font);
figure(5);imshow(c);title("(c) Sharpened Image ((a)-(b))","fontsize",font);
figure(6);imshow(d);title("(d) After Applying Sobel Operator","fontsize",font);
figure(7);imshow(e);title("(e) Sobel Image After 5\times5 Moving Avg. Filtering","fontsize",font);
figure(8);imshow(f);title("(f) Mask Image ((c)\times(e))","fontsize",font);
figure(9);imshow(g);title("(g) Sharpened Image ((a)+(f))","fontsize",font);
figure(10);imshow(h);title("(h) Final Image After Power-law Trans. (c ="+cc+ " and \gamma ="+gamma+")","fontsize",font);