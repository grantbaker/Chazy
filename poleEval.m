function a =poleEval(Z)
    sum=0;
    for n=1:length(Z(1,:))-1
        sum=sum+(((Z(3,n)/Z(2,n))+(Z(3,n+1)/Z(2,n+1)))/2)*(Z(1,n+1)-Z(1,n));
    end
    al=sum/(2*pi*i);
    sum=0;
    for n=1:length(Z(1,:))
        sum=sum+Z(1,n)-(al*Z(2,n)/Z(3,n));
    end
    z0=sum/length(Z(1,:));
    sum=0;
    for n=1:length(Z(1,:))
        sum=sum+(Z(2,n)*(Z(1,n)-z0)^-al)
    end
    b=sum/length(Z(1,:));
    a=[al,z0,b];
end