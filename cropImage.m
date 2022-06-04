function imageDst= cropImage(data,num)
[rows,cols]=size(data);
rowsCrop=(floor(rows/num)+1)*num
colsCrop=(floor(cols/num)+1)*num
imageDst=zeros(rowsCrop,colsCrop);

for i=1:rows
    for j=1 :cols
        imageDst(i,j)=data(i,j);
    end
end
for i=1:rows
    for j =cols+1:colsCrop
        imageDst(i,j)=data(i,cols);
    end
end
for i=rows+1:rowsCrop
    for j=1:colsCrop
        imageDst(i,j)=imageDst(rows,j);
    end
end

end