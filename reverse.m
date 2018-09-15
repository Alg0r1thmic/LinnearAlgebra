function x = reverse(array)
    size=length(array);
    for i=1:size;
        x(i)=array(size-i+1);
end