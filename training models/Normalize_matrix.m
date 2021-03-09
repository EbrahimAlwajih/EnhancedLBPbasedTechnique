function [out,max_a,min_a]=Normalize_matrix(a)
max_a = max(a,[],1);
min_a = min(a,[],1);
[row,col] = size(a);
count=0;
for i=1:size(a,2)
    if (max_a(i)==min_a(i))
    out(:,i)=a(:,i);
    count=count+1
    else
        out(:,i)=(max_a(i)-a(:,i))./(max_a(i)-min_a(:,i));
        
    end
end
% out=((repmat(max_a,row,1)-a)./repmat(max_a-min_a,row,1));
end