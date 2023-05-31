clc; clear; close all; font = 18;
I1 = imread("colortone1.jpg");
I2= imread("colortone2.jpg");
figure(1);subplot(121);imshow(I1);
title("Image with color tone 1","fontsize",font);
subplot(122);imshow(I2);title("Image with color tone 2","fontsize",font);
[pr11, r11]=imhist(I1(:,:,1));pr11 = pr11/sum(pr11);
[pr12, r12]=imhist(I1(:,:,2));pr12 = pr12/sum(pr12);
[pr13, r13]=imhist(I1(:,:,3));pr13 = pr13/sum(pr13);
[pr21, r21]=imhist(I2(:,:,1));pr21 = pr21/sum(pr21);
[pr22, r22]=imhist(I2(:,:,2));pr22 = pr22/sum(pr22);
[pr23, r23]=imhist(I2(:,:,3));pr23 = pr23/sum(pr23);

figure(2); subplot(231); stem(r11,pr11);grid on;
title("Image with color tone 1 (channel 1)","fontsize",font-3);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);
subplot(232); stem(r12,pr12);grid on;
title("Image with color tone 1 (channel 2)","fontsize",font-3);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);
subplot(233); stem(r13,pr13);grid on;
title("Image with color tone 1 (channel 3)","fontsize",font-3);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);
subplot(234); stem(r21,pr21);grid on;
title("Image with color tone 2 (channel 1)","fontsize",font-3);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);
subplot(235); stem(r22,pr22);grid on;
title("Image with color tone 2 (channel 2)","fontsize",font-3);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);
subplot(236); stem(r23,pr23);grid on;
title("Image with color tone 2 (channel 3)","fontsize",font-3);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);


L = 256;
cdf11 = cumsum(pr11);  s11 = (L-1).*cdf11;
cdf12 = cumsum(pr12);  s12 = (L-1).*cdf12;
cdf13 = cumsum(pr13);  s13 = (L-1).*cdf13;
cdf21 = cumsum(pr21);  s21 = (L-1).*cdf21;
cdf22 = cumsum(pr22);  s22 = (L-1).*cdf22;
cdf23 = cumsum(pr23);  s23 = (L-1).*cdf23;

%transferring color tone 2 to 1
siz1 = size(I1);
Itemp11 = s11(I1(:,:,1)+1);
for i = 1:siz1(1)
    for j = 1:siz1(2)
        [minval, argmin] = min(abs(Itemp11(i,j)-s21));
        Itr2to1_1(i,j) = uint8(r21(argmin));
    end
end
Itemp12 = s12(I1(:,:,2)+1);
for i = 1:siz1(1)
    for j = 1:siz1(2)
        [minval, argmin] = min(abs(Itemp12(i,j)-s22));
        Itr2to1_2(i,j) = uint8(r22(argmin));
    end
end
Itemp13 = s13(I1(:,:,3)+1);
for i = 1:siz1(1)
    for j = 1:siz1(2)
        [minval, argmin] = min(abs(Itemp13(i,j)-s23));
        Itr2to1_3(i,j) = uint8(r23(argmin));
    end
end
Itr2to1(:,:,1) = Itr2to1_1(:,:);
Itr2to1(:,:,2) = Itr2to1_2(:,:);
Itr2to1(:,:,3) = Itr2to1_3(:,:);

%transferring color tone 1 to 2
siz2 = size(I2);
Itemp21 = s21(I2(:,:,1)+1);
for i = 1:siz2(1)
    for j = 1:siz2(2)
        [minval, argmin] = min(abs(Itemp21(i,j)-s11));
        Itr1to2_1(i,j) = uint8(r11(argmin));
    end
end
Itemp22 = s22(I2(:,:,2)+1);
for i = 1:siz2(1)
    for j = 1:siz2(2)
        [minval, argmin] = min(abs(Itemp22(i,j)-s12));
        Itr1to2_2(i,j) = uint8(r12(argmin));
    end
end
Itemp23 = s23(I2(:,:,3)+1);
for i = 1:siz2(1)
    for j = 1:siz2(2)
        [minval, argmin] = min(abs(Itemp23(i,j)-s13));
        Itr1to2_3(i,j) = uint8(r13(argmin));
    end
end
Itr1to2(:,:,1)=Itr1to2_1(:,:);Itr1to2(:,:,2)=Itr1to2_2(:,:);Itr1to2(:,:,3)=Itr1to2_3(:,:);
figure(3);subplot(121);imshow(Itr2to1);
title("Transformed image (color tone swapped from 2 to 1)","fontsize",font-3);
subplot(122);imshow(Itr1to2);
title("Transformed image (color tone swapped from 1 to 2)","fontsize",font-3);


[pr11, r11]=imhist(Itr2to1(:,:,1));pr11 = pr11/sum(pr11);
[pr12, r12]=imhist(Itr2to1(:,:,2));pr12 = pr12/sum(pr12);
[pr13, r13]=imhist(Itr2to1(:,:,3));pr13 = pr13/sum(pr13);
[pr21, r21]=imhist(Itr1to2(:,:,1));pr21 = pr21/sum(pr21);
[pr22, r22]=imhist(Itr1to2(:,:,2));pr22 = pr22/sum(pr22);
[pr23, r23]=imhist(Itr1to2(:,:,3));pr23 = pr23/sum(pr23);

figure(4); subplot(231); stem(r11,pr11);grid on;
title("First image with color tone swapped from 2 to 1 (channel 1)","fontsize",font-5);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);
subplot(232); stem(r12,pr12);grid on;
title("First image with color tone swapped from 2 to 1 (channel 2)","fontsize",font-5);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);
subplot(233); stem(r13,pr13);grid on;
title("First image with color tone swapped from 2 to 1 (channel 3)","fontsize",font-5);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);
subplot(234); stem(r21,pr21);grid on;
title("Second image with color tone swapped from 1 to 2 (channel 1)","fontsize",font-5);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);
subplot(235); stem(r22,pr22);grid on;
title("Second image with color tone swapped from 1 to 2 (channel 2)","fontsize",font-5);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);
subplot(236); stem(r23,pr23);grid on;
title("Second image with color tone swapped from 1 to 2 (channel 3)","fontsize",font-5);
xlabel("Intensity values","fontsize",font-5);
ylabel("Number of pixels","fontsize",font-5);

