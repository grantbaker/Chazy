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
    step=h*exp(1i*th0);
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
        th1=th1-th;
        step=h*exp(1i*th1);
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
        abs(y31);
    end
    if th1>th0-2*pi
        n=1;
        t(n)=t1;
        y1(n)=y11;
        y2(n)=y21;
        y3(n)=y31;
        ths(n)=th1;
        while ths(n)<ths(1)+2*pi
        step=h*exp(1i*ths(n));
        k11 = f1(t(n), y1(n), y2(n), y3(n));
        k21 = f2(t(n), y1(n), y2(n), y3(n));
        k31 = f3(t(n), y1(n), y2(n), y3(n));
        k12 = f1(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
        k22 = f2(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
        k32 = f3(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
        k13 = f1(t(n) + step/2, y1(n) + (step/2)*k12, y2(n) + (step/2)*k22, y3(n)+ (step/2)*k32);
        k23 = f2(t(n) + step/2, y1(n) + (step/2)*k12, y2(n) + (step/2)*k22, y3(n)+ (step/2)*k32);
        k33 = f3(t(n) + step/2, y1(n) + (step/2)*k12, y2(n) + (step/2)*k22, y3(n)+ (step/2)*k32);
        k14 = f1(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
        k24 = f2(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
        k34 = f3(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
        t2=t(n)+step;
        y12=y1(n) + (step/6)*(k11 + 2*k12 + 2*k13 + k14);
        y22=y2(n) + (step/6)*(k21 + 2*k22 + 2*k23 + k24);
        y32=y3(n) + (step/6)*(k31 + 2*k32 + 2*k33 + k34);
        abs(y3);
        if abs(y12)>tol||abs(y22)>tol||abs(y32)>tol
            th2=ths(n);
            while and(abs(y12)>tol|abs(y22)>tol|abs(y32)>tol,th2>ths(n)-2*pi)
                th2=th2-th;
                step=h*exp(1i*th2);
                k11 = f1(t(n), y1(n), y2(n), y3(n));
                k21 = f2(t(n), y1(n), y2(n), y3(n));
                k31 = f3(t(n), y1(n), y2(n), y3(n));
                k12 = f1(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
                k22 = f2(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
                k32 = f3(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
                k13 = f1(t(n) + step/2, y1(n) + (step/2)*k12, y2(n) + (step/2)*k22, y3(n)+ (step/2)*k32);
                k23 = f2(t(n) + step/2, y1(n) + (step/2)*k12, y2(n) + (step/2)*k22, y3(n)+ (step/2)*k32);
                k33 = f3(t(n) + step/2, y1(n) + (step/2)*k12, y2(n) + (step/2)*k22, y3(n)+ (step/2)*k32);
                k14 = f1(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
                k24 = f2(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
                k34 = f3(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
                t2=t(n)+step;
                y12=y1(n) + (step/6)*(k11 + 2*k12 + 2*k13 + k14);
                y22=y2(n) + (step/6)*(k21 + 2*k22 + 2*k23 + k24);
                y32=y3(n) + (step/6)*(k31 + 2*k32 + 2*k33 + k34);
            end
            t1=t2;
            y11=y12;
            y21=y22;
            y31=y32;
            th1=th2;
        else
            th2=ths(n);
            while and(not(abs(y12)>tol|abs(y22)>tol|abs(y32)>tol),th2<ths(n)+2*pi)
                t1=t2;
                y11=y12;
                y21=y22;
                y31=y32;
                th1=th2;
                th2=th2+th;
                step=h*exp(1i*th2);
                k11 = f1(t(n), y1(n), y2(n), y3(n));
                k21 = f2(t(n), y1(n), y2(n), y3(n));
                k31 = f3(t(n), y1(n), y2(n), y3(n));
                k12 = f1(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
                k22 = f2(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
                k32 = f3(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
                k13 = f1(t(n) + step/2, y1(n) + (step/2)*k12, y2(n) + (step/2)*k22, y3(n)+ (step/2)*k32);
                k23 = f2(t(n) + step/2, y1(n) + (step/2)*k12, y2(n) + (step/2)*k22, y3(n)+ (step/2)*k32);
                k33 = f3(t(n) + step/2, y1(n) + (step/2)*k12, y2(n) + (step/2)*k22, y3(n)+ (step/2)*k32);
                k14 = f1(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
                k24 = f2(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
                k34 = f3(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
                t2=t(n)+step;
                y12=y1(n) + (step/6)*(k11 + 2*k12 + 2*k13 + k14);
                y22=y2(n) + (step/6)*(k21 + 2*k22 + 2*k23 + k24);
                y32=y3(n) + (step/6)*(k31 + 2*k32 + 2*k33 + k34);
            end
        end
        n=n+1;
        t(n)=t1;
        y1(n)=y11;
        y2(n)=y21;
        y3(n)=y31;
        ths(n)=th1;
        end
    end
    step=t(1)-t(n);
    k11 = f1(t(n), y1(n), y2(n), y3(n));
    k21 = f2(t(n), y1(n), y2(n), y3(n));
    k31 = f3(t(n), y1(n), y2(n), y3(n));
    k12 = f1(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
    k22 = f2(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
    k32 = f3(t(n) + step/2, y1(n) + (step/2)*k11, y2(n) + (step/2)*k21, y3(n) + (step/2)*k31);
    k13 = f1(t(n) + step/2, y1(n) + (step/2)*k12, y2(n) + (step/2)*k22, y3(n)+ (step/2)*k32);
    k23 = f2(t(n) + step/2, y1(n) + (step/2)*k12, y2(n) + (step/2)*k22, y3(n)+ (step/2)*k32);
    k33 = f3(t(n) + step/2, y1(n) + (step/2)*k12, y2(n) + (step/2)*k22, y3(n)+ (step/2)*k32);
    k14 = f1(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
    k24 = f2(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
    k34 = f3(t(n) + step, y1(n)+ step*k13,y2(n) + step*k23, y3(n) + step*k33);
    t2=t(n)+step;
    y12=y1(n) + (step/6)*(k11 + 2*k12 + 2*k13 + k14);
    y22=y2(n) + (step/6)*(k21 + 2*k22 + 2*k23 + k24);
    y32=y3(n) + (step/6)*(k31 + 2*k32 + 2*k33 + k34);
    t(n)=t2;
    y1(n)=y12;
    y2(n)=y22;
    y3(n)=y32;
    [t1,th1];
    a=[t;y1;y2;y3];
      
end
