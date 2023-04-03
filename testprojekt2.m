
ima(A)


for i=1:7291
    A = trainDigits(:,:,i);
 [V,D]=eig(A);
    B = trainAns(i);
    

    A = reshape(A,256,1);

    C = reshape(A,256,1);
   

    nor
end