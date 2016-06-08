function a =rk4(h,th,tol,t0,y10,y20,y30,r,th0)
    function b=f1(tx, y1x, y2x, y3x)
        b=y2x;
    end
    function b=f2(tx, y1x, y2x, y3x)
        b= y3x;
    end
    function b=f3(tx, y1x, y2x, y3x)
        b= 2*y1x*y3x - 3*y2x^2;
    end
    c=1;
    t=[];
    y1=[];
    y2=[];
    y3=[];
    t(1)=t0;
    y1(1)=y10;
    y2(1)=y20;
    y3(1)=y30;
    for m = (th0/th):(th0+2*pi)/th
        tint=[t(1)];
        y1int=[y1(1)];
        y2int=[y2(1)];
        y3int=[y3(1)];
        for n=1:r/h
            step=h*exp(1i*(m*th+th0));
            if abs(y1int(n) + step*f1(tint(n), y1int(n), y2int(n), y3int(n)))>tol|abs(y2int(n) + step*f2(tint(n), y1int(n), y2int(n), y3int(n)))>tol|abs(y3int(n) + step*f3(tint(n), y1int(n), y2int(n), y3int(n)))>tol
                break
            else
                k11 = f1(tint(n), y1int(n), y2int(n), y3int(n));
                k21 = f2(tint(n), y1int(n), y2int(n), y3int(n));
                k31 = f3(tint(n), y1int(n), y2int(n), y3int(n));
                k12 = f1(tint(n) + step/2, y1int(n) + (step/2)*k11, y2int(n) + (step/2)*k21, y3int(n) + (step/2)*k31);
                k22 = f2(tint(n) + step/2, y1int(n) + (step/2)*k11, y2int(n) + (step/2)*k21, y3int(n) + (step/2)*k31);
                k32 = f3(tint(n) + step/2, y1int(n) + (step/2)*k11, y2int(n) + (step/2)*k21, y3int(n) + (step/2)*k31);
                k13 = f1(tint(n) + step/2, y1int(n) + (step/2)*k12, y2int(n) + (step/2)*k22, y3int(n)+ (step/2)*k32);
                k23 = f2(tint(n) + step/2, y1int(n) + (step/2)*k12, y2int(n) + (step/2)*k22, y3int(n)+ (step/2)*k32);
                k33 = f3(tint(n) + step/2, y1int(n) + (step/2)*k12, y2int(n) + (step/2)*k22, y3int(n)+ (step/2)*k32);
                k14 = f1(tint(n) + step, y1int(n) + step*k13,y2int(n) + step*k23, y3int(n) + step*k33);
                k24 = f2(tint(n) + step, y1int(n) + step*k13,y2int(n) + step*k23, y3int(n) + step*k33);
                k34 = f3(tint(n) + step, y1int(n) + step*k13,y2int(n) + step*k23, y3int(n) + step*k33);
                c=c+1;
                tint(length(tint)+1)=tint(n)+step;
                y1int(length(y1int)+1)=y1int(n) + (step/6)*(k11 + 2*k12 + 2*k13 + k14);
                y2int(length(y2int)+1)=y2int(n) + (step/6)*(k21 + 2*k22 + 2*k23 + k24);
                y3int(length(y3int)+1)=y3int(n) + (step/6)*(k31 + 2*k32 + 2*k33 + k34);
            end    
        end
        t=cat(2,t,tint);
        y1=cat(2,y1,y1int);
        y2=cat(2,y2,y2int);
        y3=cat(2,y3,y3int);
    end
    a=[t;y1;y2;y3]
    
end