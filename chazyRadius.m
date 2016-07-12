function out=chazyRadius(t0,y10,y20,y30)
    function b=z1(s)
        b=hypergeom([1/12,1/12],1/2,s);
    end
    function b=z2(s)
        b=(s^(1/2))*hypergeom([7/12,7/12],3/2,s);
    end
    function b=t(a1,b1,c1,d1,s)
        b=(c1*z1(s)+d1*z2(s))/(a1*z1(s)+b1*z2(s));
    end
    function b=K(y1,y2,y3)
        b=(y3-y1*y2+(y1^3)/9)/(y2-(y1^2)/6)^(3/2);
    end
    function b=s0(y1,y2,y3)
        b=((3/8)*(K(y1,y2,y3))^2)/(1+(3/8)*(K(y1,y2,y3))^2);
    end
    function b=Z1(y1,y2,y3)
        b=((6^(1/4))/(1-s0(y1,y2,y3))^(1/12))*(y2-(y1^2)/6)^(1/4);
    end
    function b=W(s)
        b=(1/2)*(s^(-1/2))*((1-s)^(-2/3));
    end
    function b=dZ1(y1,y2,y3)
        b=W(s0(y1,y2,y3))*y1/(6*Z1(y1,y2,y3));
    end
    function b=Z2(y1,y2,y3,t)
        b=t*Z1(y1,y2,y3) ;
    end
    function b=dZ2(y1,y2,y3,t)
        b=(W(s0(y1,y2,y3))+Z2(y1,y2,y3,t)*dZ1(y1,y2,y3))/(Z1(y1,y2,y3)) ;
    end
    function b=dz1(s,s2)
        syms s2
        f(s2)=diff(z1(s2),s2);
        b=f(s);
    end
    function b=dz2(s,s2)
        syms s2
        f(s2)=diff(z2(s2),s2);
        b=f(s);
    end
    function b=y(s)
        b=(6*z1(s)/W(s))*dz1(s);
    end
    a=double((1/W(s0(y10,y20,y30)))*(dz2(s0(y10,y20,y30))*Z1(y10,y20,y30)-dZ1(y10,y20,y30)*z2(s0(y10,y20,y30))))
    b=double((1/W(s0(y10,y20,y30)))*(dZ1(y10,y20,y30)*z1(s0(y10,y20,y30))-dz1(s0(y10,y20,y30))*Z1(y10,y20,y30)))
    c=double(a*t0-z2(s0(y10,y20,y30))/Z1(y10,y20,y30))
    d=(1+b*c)/a;
    double(a*dz1(s0(y10,y20,y30))+b*dz2(s0(y10,y20,y30)))
    double(dZ1(y10,y20,y30))
    double(c*dz1(s0(y10,y20,y30))+d*dz2(s0(y10,y20,y30)))
    double(dZ2(y10,y20,y30,t0))
    RT=(gamma(5/12)*gamma(1/12))^2/(8*pi^2);
    cent=c/a;
    rad=RT/abs(a*(a+i*b*RT));
    t(a,b,c,d,s0(y10,y20,y30))
    double(dZ1(1,i,1));
    y10=12*dz1(0)*z1(0);
    y20=(z1(0)^4)/6+(y10^2)/6;
    y30=y10*y20-(y10^3)/9;
    out=[cent,rad];
end