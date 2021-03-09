clear all;
mapping=getmapping(8,'u2');
Bin=20;
img_hight=32;
img_width=32;
virtical_windsize=32;
horizental_windowsize=32;
% numofwinds=numOfWinds(img_width,img_hight,virtical_windsize,horizental_windowsize);



img=imread('writer601_pass02_digit9.bmp');
img = imcomplement(img);
img=imresize(img,[img_hight img_width]);
img=double(img);
[CSLMP,CSLBP,CSLTP,LBP_,U2LBP]=windsLBP(img,virtical_windsize,horizental_windowsize,Bin,mapping);
CSLMP(isnan(CSLMP)) = 0;
CSLBP(isnan(CSLBP)) = 0;
CSLTP(isnan(CSLTP)) = 0;
LBP_(isnan(LBP_)) = 0;
U2LBPs(isnan(U2LBPs)) = 0;


