function a =polevault(t0,y10,y20,y30,th0,tol,h,th)
    function b=f1(tx, y1x, y2x, y3x)
        b=y2x;
    end
    function b=f2(tx, y1x, y2x, y3x)
        b= y3x;
    end
    function b=f3(tx, y1x, y2x, y3x)
        b= 2*y1x*y3x - 3*y2x^2;
    end
    t=[];
    y1=[];
    y2=[];
    y3=[];
    ths=[];
    step=h*exp(i*th0);
    t1=t0;
    y11=y10;
    y21=y20;
    y31=y30;
    th1=th0;
    while not(abs(y11)>tol|abs(y21)>tol|abs(y31)>tol)
        t0=t1;
        y10=y11;
        y20=y21;
        y30=y31;
        k11 = f1(t0, y10, y20, y30);
        k21 = f2(t0, y10, y20, y30);
        k31 = f3(t0, y10, y20, y30);
        k12 = f1(t0 + step/2, y10 + (step/2)*k11, y20 + (step/2)*k21, y30 + (step/2)*k31);
        k22 = f2(t0 + step/2, y10 + (step/2)*k11, y20 + (step/2)*k21, y30 + (step/2)*k31);
        k32 = f3(t0 + step/2, y10 + (step/2)*k11, y20 + (step/2)*k21, y30 + (step/2)*k31);
        k13 = f1(t0 + step/2, y10 + (step/2)*k12, y20 + (step/2)*k22, y30+ (step/2)*k32);
        k23 = f2(t0 + step/2, y10 + (step/2)*k12, y20 + (step/2)*k22, y30+ (step/2)*k32);
        k33 = f3(t0 + step/2, y10 + (step/2)*k12, y20 + (step/2)*k22, y30+ (step/2)*k32);
        k14 = f1(t0 + step, y10+ step*k13,y20 + step*k23, y30 + step*k33);
        k24 = f2(t0 + step, y10+ step*k13,y20 + step*k23, y30 + step*k33);
        k34 = f3(t0 + step, y10+ step*k13,y20 + step*k23, y30 + step*k33);
        t1=t0+step;
        y11=y10 + (step/6)*(k11 + 2*k12 + 2*k13 + k14);
        y21=y20 + (step/6)*(k21 + 2*k22 + 2*k23 + k24);
        y31=y30 + (step/6)*(k31 + 2*k32 + 2*k33 + k34);
    end
    while and(abs(y11)>tol|abs(y21)>tol|abs(y31)>tol,th1>th0-2*pi)
        th1=th1-th
        step=h*exp(i*th1);
        k11 = f1(t0, y10, y20, y30);
        k21 = f2(t0, y10, y20, y30);
        k31 = f3(t0, y10, y20, y30);
        k12 = f1(t0 + step/2, y10 + (step/2)*k11, y20 + (step/2)*k21, y30 + (step/2)*k31);
        k22 = f2(t0 + step/2, y10 + (step/2)*k11, y20 + (step/2)*k21, y30 + (step/2)*k31);
        k32 = f3(t0 + step/2, y10 + (step/2)*k11, y20 + (step/2)*k21, y30 + (step/2)*k31);
        k13 = f1(t0 + step/2, y10 + (step/2)*k12, y20 + (step/2)*k22, y30+ (step/2)*k32);
        k23 = f2(t0 + step/2, y10 + (step/2)*k12, y20 + (step/2)*k22, y30+ (step/2)*k32);
        k33 = f3(t0 + step/2, y10 + (step/2)*k12, y20 + (step/2)*k22, y30+ (step/2)*k32);
        k14 = f1(t0 + step, y10+ step*k13,y20 + step*k23, y30 + step*k33);
        k24 = f2(t0 + step, y10+ step*k13,y20 + step*k23, y30 + step*k33);
        k34 = f3(t0 + step, y10+ step*k13,y20 + step*k23, y30 + step*k33);
        t1=t0+step;
        y11=y10 + (step/6)*(k11 + 2*k12 + 2*k13 + k14);
        y21=y20 + (step/6)*(k21 + 2*k22 + 2*k23 + k24);
        y31=y30 + (step/6)*(k31 + 2*k32 + 2*k33 + k34);
        abs(y31)
    end
    if th1>th0-2*pi
        t(1)=t1;
        y1(1)=y11;
        y2(1)=y21;
        y3(1)=y31;
        ths(1)=th1;
        th2=th1;
        n=1;
        y12=y1(n);
        y22=y2(n);
        y32=y3(n);
        t2=t(n);
        while n<10%<th1+2*pi
            y12=y1(n);
            y22=y2(n);
            y32=y3(n);
            t2=t(n);
            th2=ths(n)-th
            n
            while and(not(abs(y12)>tol|abs(y22)>tol|abs(y32)>tol),th2<th1+2*pi)
                y11=y12;
                y21=y22;
                y31=y32;
                t1=t2;
                th2=th2+th
                step=h*exp(i*th2);
                k11 = f1(t(n), y1(n), y2(n), y3(n));
                k21 = f2(t(n), y1(n), y2(n), y3(n));
                k31 = f3(t(n), y1(n), y2(n), y3(n));
                k12 = f1(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
                k22 = f2(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
                k32 = f3(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
                k13 = f1(t(n) + step/2, y1(n)+ (step/2)*k12, y2(n)+ (step/2)*k22, y3(n)+ (step/2)*k32);
                k23 = f2(t(n) + step/2, y1(n)+ (step/2)*k12, y2(n)+ (step/2)*k22, y3(n)+ (step/2)*k32);
                k33 = f3(t(n) + step/2, y1(n)+ (step/2)*k12, y2(n)+ (step/2)*k22, y3(n)+ (step/2)*k32);
                k14 = f1(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
                k24 = f2(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
                k34 = f3(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
                t2=t(n)+step;
                y12=y1(n) + (step/6)*(k11 + 2*k12 + 2*k13 + k14);
                y22=y2(n) + (step/6)*(k21 + 2*k22 + 2*k23 + k24);
                y32=y3(n) + (step/6)*(k31 + 2*k32 + 2*k33 + k34);
                [y12,y22,y32]
            end
            n=n+1;
            t(n)=t1;
            y11;
            y21;
            y31;
            y1(n)=y11;
            y2(n)=y21;
            y3(n)=y31;
            ths(n)=th2-th;
       end
    end
    [t1,th1];
    a=[t];
      
end
