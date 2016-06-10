function a =poleEval(Z)
    sum=0;
    for n=1:length(Z(:,1))-1
        sum=sum+(((Z(n,3)/Z(n,2))+(Z(n+1,3)/Z(n+1,2)))/2)*(Z(n+1,1)-Z(n,1));
    end
    c=Z(1,2)-Z(length(Z(:,1)),2);
    al=sum/(2*pi*i)
    branch=1;
    if c/Z(1,2)<.05
        al=round(al)
        branch=0;
    end
    sum=0;
    for n=1:length(Z(:,1))
        sum=sum+Z(n,1)-(al*Z(n,2)/Z(n,3)); 
    end
    z0=sum/length(Z(:,1))
    sum=0;
    for n=1:length(Z(:,1))
        sum=sum+(Z(n,2)*(Z(n,1)-z0)^-al);
    end
    b=sum/length(Z(:,1))
    a=[branch,al,z0,b];
end