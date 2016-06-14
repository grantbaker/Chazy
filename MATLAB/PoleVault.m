function [ out ] = PoleVault(system, y0, ang, h, th, tol)
%POLEVAULT given an initial angle and initial condition, the function returns the set of points
%vaulting around a singularity of magnitude above 'tol'

y=[];
y(1,:) = y0;
lY = 1;
m = 0;
initAngle = 1i;
while (abs(m*th) < pi)
    m = m+1;
    disp(m);
    disp([y0,y0(1)+h*exp(1i*(ang-th*m))]);
    disp(ChazyEvalDirect(system,y0,y0(1)+h*exp(1i*(ang-th*m)),tol));
    disp([y0,y0(1)+h*exp(1i*(ang+th*m))]);
    disp(ChazyEvalDirect(system,y0,y0(1)+h*exp(1i*(ang+th*m)),tol));
    if (size(ChazyEvalDirect(system,y0,y0(1)+h*exp(1i*(ang-th*m)),tol),1) ~= 0)
        initAngle = ang-th*m;
        break;
    end
    if (size(ChazyEvalDirect(system,y0,y0(1)+h*exp(1i*(ang+th*m)),tol),1) ~= 0)
        initAngle = ang+th*m;
        th = -th;
        break;
    end
end
disp(initAngle);
if (initAngle == 1i)
    out = [];
    return;
end

lY = lY+1;
y(lY,:) = ChazyEvalDirect(system,y0,y0+h*exp(1i*initAngle),tol);

while or(lY < 10,abs(y(lY,1) - y0(1) - abs(y(lY,1)-y0(1))*exp(1i*ang)) > 1*h)
    disp(initAngle);
    m = 0;
    eval = ChazyEvalDirect(system,y(lY,:),y(lY,1)+h*exp(1i*(initAngle+th*m)),tol);
    if (size(eval,1) ~= 0)
        while (abs(m*th) < 2*pi)
            eval2 = ChazyEvalDirect(system,y(lY,:),y(lY,1)+h*exp(1i*(initAngle+th*(m+1))),tol);
            if (size(eval2,1) == 0)
                lY = lY+1;
                y(lY,:) = eval;
                initAngle = initAngle+th*m;
                break;
            else
                eval = eval2;
            end
            m = m+1;
        end
    else
        while (abs(m*th) < 2*pi)
            eval = ChazyEvalDirect(system,y(lY,:),y(lY,1)+h*exp(1i*initAngle+th*m),tol);
            if (size(eval,1) ~= 0) 
                lY = lY+1;
                y(lY,:) = eval;
                initAngle = initAngle+th*m;
            end
            m = m-1;
        end
    end
    
end

out = y;

end

