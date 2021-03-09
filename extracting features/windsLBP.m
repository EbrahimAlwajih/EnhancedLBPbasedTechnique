function [CSLMP,CSLBP,CSLTP,LBP_,U2LBP]=windsLBP(x, virtical_windsize,horizental_windowsize,Bin,mapping)
overlaping=0.5;
img_width=size(x,1);
img_hight=size(x,2);
numOfHwinds=(img_width/(horizental_windowsize*overlaping)-1);
numOfVwinds=(img_hight/(virtical_windsize*overlaping)-1);
for i=1:numOfHwinds
    HstratPoint=(i-1)*horizental_windowsize*overlaping+1;
    HendPoint=HstratPoint+2*horizental_windowsize*overlaping-1;
    for j=1:numOfVwinds
        VstratPoint=(j-1)*virtical_windsize*overlaping+1;
        VendPoint=VstratPoint+2*virtical_windsize*overlaping-1;
        temp=x(HstratPoint:HendPoint, VstratPoint:VendPoint);
        %Edge Diriction Histogram
        LBPFeature=lbp(temp);
        LBPFeatureVector(i,j,:)=LBPFeature(:);
       
        % U2LBP
        ulbp=lbp(temp,1,8,mapping,'h');
        ulbpFeatureVector(i,j,:)=ulbp(:);
        
        %Local Descriptor
        [cslbpDescriptors, cslbpHistogram] = cslbpoperator(temp);
        cslbpHistograms(i,j,:)=cslbpHistogram(:);
        %Shape Features : 8 features.
        [cslmpDescriptors, cslmpHistogram] = cslmpoperator(temp);
        cslmpHistograms(i,j,:)  = cslmpHistogram(:);
        % Texture Features: 7 features.
        [csltpDescriptors, csltpHistogram] = csltpoperator(temp);
        csltpHistograms(i,j,:)  = csltpHistogram(:);
    end
end
U2LBP=reshape(ulbpFeatureVector, [1 size(ulbpFeatureVector,1)*size(ulbpFeatureVector,2)*size(ulbpFeatureVector,3)]);%,reshape(ystd, [1 N*N])];%,reshape(yskw, [1 N*N])];
LBP_=reshape(LBPFeatureVector, [1 size(LBPFeatureVector,1)*size(LBPFeatureVector,2)*size(LBPFeatureVector,3)]);%,reshape(ystd, [1 N*N])];%,reshape(yskw, [1 N*N])];
CSLBP=reshape(cslbpHistograms, [1 size(cslbpHistograms,1)*size(cslbpHistograms,2)*size(cslbpHistograms,3)]);%,reshape(ystd, [1 N*N])];%,reshape(yskw, [1 N*N])];
CSLMP=reshape(cslmpHistograms, [1 size(cslmpHistograms,1)*size(cslmpHistograms,2)*size(cslmpHistograms,3)]);
CSLTP=reshape(csltpHistograms, [1 size(csltpHistograms,1)*size(csltpHistograms,2)*size(csltpHistograms,3)]);

end