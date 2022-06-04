%% input, SourceImage;
% groundTruthImage;
% mu0 sigma0 p(u)=N(u0,sigma0);
% algorithm: get class prior; P(u|D) get u n, sigma n; get P(x|D)=N(un,
% sigma+sigman )
% than parse all the image and get the accuracy rate;

function accuracy_rate=GetBaysianAccuracy(SourceImage, groundTruth,muForeGround,sigmaForeGround,muBackGround,sigmaBackGround,foreGround, backGround)

[rowsFore,cols_Fore]=size(foreGround);
[rowsBack,cols_Back]=size(backGround);

forePrior=rowsFore*1.0/(rowsFore+rowsBack);
backPrior=1-forePrior;

sigmaDataFore=cov(foreGround);
sigmaDataBack=cov(backGround);

sampleMeanForeGround=mean(foreGround);
sampleMeanBackGround=mean(backGround);

DataMuN_foreGround=sigmaForeGround*inv(sigmaForeGround+1.0/rowsFore*sigmaDataFore)*sampleMeanForeGround'+...
                    1.0/rowsFore*sigmaDataFore*inv(sigmaForeGround+1.0/rowsFore*sigmaDataFore)*muForeGround';
 
DataMuN_backGround=sigmaBackGround*inv(sigmaBackGround+1.0/rowsBack*sigmaDataBack)*sampleMeanBackGround'+...
                    1.0/rowsBack*sigmaDataBack*inv(sigmaBackGround+1.0/rowsBack*sigmaDataBack)*muBackGround';

DataSigmaN_ForeGround=sigmaForeGround*inv(sigmaForeGround+1.0/rowsFore*sigmaDataFore)*1.0/rowsFore*sigmaDataFore;
DataSigmaN_BackGround=sigmaBackGround*inv(sigmaBackGround+1.0/rowsBack*sigmaDataBack)*1.0/rowsBack*sigmaDataBack;

SigmaPostirorFore=sigmaDataFore+DataSigmaN_ForeGround;
SigmaPostirorBack=sigmaDataBack+DataSigmaN_BackGround;


%% get inv, det for cheetah and grass;
det_fore_full=det(SigmaPostirorFore);
det_back_full=det(SigmaPostirorBack);

inv_fore_full=inv(SigmaPostirorFore);
inv_back_full=inv(SigmaPostirorBack);

%% get prob
[rows_img,cols_img]=size(SourceImage);
img=padImage(SourceImage);

dst_full=zeros(rows_img, cols_img);
tmp=zeros(8,8);
dsttmp=zeros(8,8);
tmpVec=zeros(1,64);

for i=1:rows_img
    for j=1:cols_img
        tmp=img(i:i+7,j:j+7)/255.0;
        dsttmp=dct2(tmp);
        tmpVec=zigzag(dsttmp);
        p1=getGaussianProb(DataMuN_foreGround',SigmaPostirorFore,tmpVec,det_fore_full,inv_fore_full)*forePrior;
        p2=getGaussianProb(DataMuN_backGround',SigmaPostirorBack,tmpVec,det_back_full,inv_back_full)*backPrior;
        if p1>p2
            dst_full(i,j)=1;
        end
    end
end

figure(1);
imshow(uint8(dst_full*255));


seg1=uint8(dst_full)*255;

tmp=0;
for i=1: rows_img
    for j= 1:cols_img
        if seg1(i,j)==groundTruth(i,j)
            tmp=tmp+1;
        end
    end
end

accuracy_rate=tmp*1.0/(rows_img*cols_img);

end