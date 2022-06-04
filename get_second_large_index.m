function [index]=get_second_large_index(data)

[rows,length]=size(data);
%% get the first data large data and set it to zeros;
data1=abs(data);
tmp=0;
index=0;
for i=1:length
    if data1(i)>tmp
        tmp=data1(i);
        index=i;
    end
end

% set data[index]= 0;
data1(index)=0;
tmp=0; 
index=0;
for i=1:length
    if data1(i)>tmp
        tmp=data1(i);
        index=i;
    end
end        

end



