
% dst is a index vector for every block that has second large energy of the
% dct block
function [dst]=dct2Image(img,stride)
[rows, cols]=size(img);

  tmp=img*1.0/255;
  dst=zeros(rows/stride, cols/stride);
  
  block=zeros(stride,stride);
  result=zeros(stride,stride);
  zigzagVec=zeros(1,stride*stride);
  for i=1:stride:rows
       for j=1:stride:cols
           % get block
            for m=0:stride-1
                for n=0:stride-1
                    block(m+1,n+1)=img(i+m,j+n);
                end
            end
           result=dct2(block,[stride, stride]);
           zigzagVec=zigzag(result);
           dst((i-1)/stride+1,(j-1)/stride+1)=get_second_large_index(zigzagVec);
       end
  end        
end