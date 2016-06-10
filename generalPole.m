function a =generalPole(system,y0,th0,tol,h,th)
    y=[];
    ths=[];
    step=h*exp(i*th0);
    y1(:)=y0(:);
    th1=th0;
   while not(max(abs(y1(:)))>tol)
        y0(:)=y1(:);
        y0(1:2);
        k1 = system(y0(:));
        k2(:) = system(y0(:) + (step/2)*k1(:));
        k3(:) = system(y0(:) + (step/2)*k2(:));
        k4(:) = system(y0(:) + step*k3(:));
        y1=y0 + (step/6)*(k1 + 2*k2 + 2*k3 + k4);
    end
    while and(max(abs(y1))>tol,th1>th0-2*pi)
        th1=th1-th;
        step=h*exp(i*th1);
        k1 = system(y0(:));
        k2(:) = system(y0(:) + (step/2)*k1(:));
        k3(:) = system(y0(:) + (step/2)*k2(:));
        k4(:) = system(y0(:) + step*k3(:));
        y1=y0 + (step/6)*(k1 + 2*k2 + 2*k3 + k4);
        y1(1:2);
    end
    if th1>th0-2*pi
        n=1;
        y(n,:)=y1(:);
        ths(n)=th1;
        while and(ths(n)<ths(1)+2*pi,or(n<10,(not(abs(y(n,1)-y(1,1))<h))))
        step=h*exp(i*ths(n));
        k1 = system(y(n,:));
        k2(:) = system(y(n,:) + (step/2)*transpose(k1(:)));
        k3(:) = system(y(n,:) + (step/2)*transpose(k2(:)));
        k4(:) = system(y(n,:) + step*transpose(k3(:)));
        y2(:)=y(n,:) + (step/6)*(k1 + 2*k2 + 2*k3 + k4);
        test=max(abs(y2));
        if max(abs(y2))>tol
            0;
            abs(y(n,:));
            th2=ths(n);
            while and(max(abs(y2(:)))>tol,th2>ths(n)-2*pi)
                th2=th2-th;
                step=h*exp(i*th2);
                k1 = system(y(n,:));
                k2(:) = system(y(n,:) + (step/2)*transpose(k1(:)));
                k3(:) = system(y(n,:) + (step/2)*transpose(k2(:)));
                k4(:) = system(y(n,:) + step*transpose(k3(:)));
                y2(:)=y(n,:) + (step/6)*(k1 + 2*k2 + 2*k3 + k4);
            end
            ths(n);
            th2;
            y1(:)=y2(:);
            th1=th2;
        else
            th2=ths(n);
            max(abs(y2(:)));
            1;
            while and(not(max(abs(y2))>tol),th2<ths(n)+2*pi)
                y1(:)=y2(:);
                th1=th2;
                th2=th2+th;
                step=h*exp(i*th2);
                k1 = system(y(n,:));
                k2(:) = system(y(n,:) + (step/2)*transpose(k1(:)));
                k3(:) = system(y(n,:) + (step/2)*transpose(k2(:)));
                k4(:) = system(y(n,:) + step*transpose(k3(:)));
                y2(:)=y(n,:) + (step/6)*(k1 + 2*k2 + 2*k3 + k4);
                max(abs(y2));
            end
            th2;
            ths(n);
            max(abs(y2));
        end
        if and(th1<ths(n)+2*pi,th1>ths(n)-2*pi)
        n=n+1;
        y(n,:)=y1(:);
        end
        ths(1);
        th1;
        ths(n)=th1;
        end
    end
    step=(y(1,1)-y(n,1));
    k1 = system(y(n,:));
    k2(:) = system(y(n,:) + (step/2)*transpose(k1(:)));
    k3(:) = system(y(n,:) + (step/2)*transpose(k2(:)));
    k4(:) = system(y(n,:) + step*transpose(k3(:)));    y2(:)=y(n,:) + (step/6)*(k1 + 2*k2 + 2*k3 + k4);
    n=n+1;
    y(n,:)=y2(:);
    a=[y];
      
end
