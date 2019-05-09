clear;clc;
%��ȡͼ��
test1=imread('test1.tif');test1=test1(:,:,1);
test2=imread('test2.png');test3=imread('test3.jpg');
test4=imread('test4.bmp');test5=imread('test5.png');
test6=imread('test6.jpg');
%Sobel��Ե��⼰Houghֱ�߼��
figure('NumberTitle','off','Name','Sobel');
subplot(3,4,1);imshow(edge(test1,'sobel'));title('test1\_Sobel edge');
subplot(3,4,2);linedetect(test1,'sobel');title('test1\_linedetect');
subplot(3,4,3);imshow(edge(test2,'sobel'));title('test2\_Sobel edge');
subplot(3,4,4);linedetect(test2,'sobel');title('test2\_linedetect');
subplot(3,4,5);imshow(edge(test3,'sobel'));title('test3\_Sobel edge');
subplot(3,4,6);linedetect(test3,'sobel');title('test3\_linedetect');
subplot(3,4,7);imshow(edge(test4,'sobel'));title('test4\_Sobel edge');
subplot(3,4,8);linedetect(test4,'sobel');title('test4\_linedetect');
subplot(3,4,9);imshow(edge(test5,'sobel'));title('test5\_Sobel edge');
subplot(3,4,10);linedetect(test5,'sobel');title('test5\_linedetect');
subplot(3,4,11);imshow(edge(test6,'sobel'));title('test6\_Sobel edge');
subplot(3,4,12);linedetect(test6,'sobel');title('test6\_linedetect');
%Laplace��Ե��⼰Houghֱ�߼��
figure('NumberTitle','off','Name','Laplace');
subplot(3,4,1);imshow(edge(test1,'log'));title('test1\_log edge');
subplot(3,4,2);linedetect(test1,'log');title('test1\_linedetect');
subplot(3,4,3);imshow(edge(test2,'log'));title('test2\_log edge');
subplot(3,4,4);linedetect(test2,'log');title('test2\_linedetect');
subplot(3,4,5);imshow(edge(test3,'log'));title('test3\_log edge');
subplot(3,4,6);linedetect(test3,'log');title('test3\_linedetect');
subplot(3,4,7);imshow(edge(test4,'log'));title('test4\_log edge');
subplot(3,4,8);linedetect(test4,'log');title('test4\_linedetect');
subplot(3,4,9);imshow(edge(test5,'log'));title('test5\_log edge');
subplot(3,4,10);linedetect(test5,'log');title('test5\_linedetect');
subplot(3,4,11);imshow(edge(test6,'log'));title('test6\_log edge');
subplot(3,4,12);linedetect(test6,'log');title('test6\_linedetect');
%Canny��Ե��⼰Houghֱ�߼��
figure('NumberTitle','off','Name','Canny');
subplot(3,4,1);imshow(edge(test1,'canny'));title('test1\_canny edge');
subplot(3,4,2);linedetect(test1,'canny');title('test1\_linedetect');
subplot(3,4,3);imshow(edge(test2,'canny'));title('test2\_canny edge');
subplot(3,4,4);linedetect(test2,'canny');title('test2\_linedetect');
subplot(3,4,5);imshow(edge(test3,'canny'));title('test3\_canny edge');
subplot(3,4,6);linedetect(test3,'canny');title('test3\_linedetect');
subplot(3,4,7);imshow(edge(test4,'canny'));title('test4\_canny edge');
subplot(3,4,8);linedetect(test4,'canny');title('test4\_linedetect');
subplot(3,4,9);imshow(edge(test5,'canny'));title('test5\_canny edge');
subplot(3,4,10);linedetect(test5,'canny');title('test5\_linedetect');
subplot(3,4,11);imshow(edge(test6,'canny'));title('test6\_canny edge');
subplot(3,4,12);linedetect(test6,'canny');title('test6\_linedetect');


function linedetect(Img,method)
Img_edge=edge(Img,method);%Canny������ȡͼ��߽磬���ض�ֵͼ��(�߽�1,����0)
[H,T,R]=hough(Img_edge);%�����ֵͼ��ı�׼����任��HΪ����任����I,RΪ�������任�ĽǶȺͰ뾶ֵ
P=houghpeaks(H,3);%��ȡ3����ֵ��
lines=houghlines(Img_edge,T,R,P);%��ȡ�߶�
imshow(Img), hold on;
for k = 1:length(lines)
xy = [lines(k).point1; lines(k).point2];
 plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');%�����߶�
plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');%���
plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');%�յ�
end
end