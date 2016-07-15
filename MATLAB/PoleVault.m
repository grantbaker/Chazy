function [out,valid,circle] = PoleVault(system, y0, ang, h, th, tol)
%POLEVAULT given an initial angle and initial condition, the function returns the set of points
%vaulting around a singularity of magnitude above 'tol'
%lower tol behaves better

%disp('new polevault at:');
%disp([y0,ang]);

stepAdj = 1;

valid = 0;
y=[];
y(1,:) = y0;
lY = 1;
m = 0;
initAngle = 1i;
while (abs(m*th) < pi)
    m = m+1;
    %disp(m);
    %disp([y0,y0(1)+h*exp(1i*(ang-th*m))]);
    %disp(ChazyEvalDirect(system,y0,y0(1)+h*exp(1i*(ang-th*m)),tol));
    %disp([y0,y0(1)+h*exp(1i*(ang+th*m))]);
    %disp(ChazyEvalDirect(system,y0,y0(1)+h*exp(1i*(ang+th*m)),tol));
    if (max(abs(ChazyEvalDirect(system,y0,y0(1)+h*exp(1i*(ang-th*m)))))<tol)
        %initAngle = ang-th*m;
        initAngle = ang-th*(m+stepAdj);
        break;
    end
    if (max(abs(ChazyEvalDirect(system,y0,y0(1)+h*exp(1i*(ang+th*m)))))<tol)
        %initAngle = ang+th*m;
        initAngle = ang+th*(m+stepAdj);
        th = -th;
        break;
    end
end
%disp(initAngle);
if (initAngle == 1i)
    %disp('polevault terminated prematurely');
    warning('CHAZY:PoleVault:noValidInitialAngle','No valid initial angle to begin pole vaulting.');
    out = y0;
    return;
end

lY = lY+1;
y(lY,:) = ChazyEvalDirect(system,y0,y0+h*exp(1i*initAngle));

%{
%adjustment parameters
alpha = 1;
beta = .01;
numSteps = floor(alpha+beta*(h^-1)*(abs(mod(initAngle,2*pi)-mod(ang,2*pi))));
disp(numSteps);
%}

%while and(lY<1000,or(lY<numSteps,abs(y(lY,1) - y0(1) - abs(y(lY,1)-y0(1))*exp(1i*ang)) > 1*h))
%disp([angle(y(lY,1)-y0(1)),angle(y(lY-1,1)-y0(1)),ang]);
while and(lY<200,or(lY==2,sign(mod(angle(y(lY,1)-y0(1)),2*pi)-mod(ang,2*pi))==sign(mod(angle(y(lY-1,1)-y0(1)),2*pi)-mod(ang,2*pi))));
    %disp(initAngle);
    initAngle=mod(initAngle,2*pi);
    m = 0;
    eval = ChazyEvalDirect(system,y(lY,:),y(lY,1)+h*exp(1i*(initAngle+th*m)));
    found = 0;
    if (max(abs(eval))<tol)
        %valid, need to find closest contour by closing angle
        while (abs(m*th) < 2*pi)
            %eval2 = ChazyEvalDirect(system,y(lY,:),y(lY,1)+h*exp(1i*(initAngle+th*(m+1))));
            eval2 = ChazyEvalDirect(system,y(lY,:),y(lY,1)+h*exp(1i*(initAngle+th*(m+1+stepAdj))));
            %disp(eval2);
            if (max(abs(eval2))>tol)
                lY = lY+1;
                y(lY,:) = eval;
                initAngle = initAngle+th*m;
                found = 1;
                break;
            else
                eval = eval2;
            end
            m = m+1;
        end
        if (found == 0)
            warning('CHAZY:PoleVault:noStepsIntersectTolerance','Valid initial angle, but no subsequent angles intersect with tolerance');
            initAngle = angle(y0(1)+abs(y(lY,1)-y0(1))*exp(1i*ang)-y(lY,1));
            y(lY+1,:) = ChazyEvalDirect(system,y(lY,:),y(lY,1)+h*exp(1i*initAngle));
            lY = lY+1;
            found = 1;
            out = y;
            circle = [0;0;0;0;0;0];
            return;
        end
    else
        %invalid, need to expand angle
        while (abs(m*th) < 2*pi)
            eval = ChazyEvalDirect(system,y(lY,:),y(lY,1)+h*exp(1i*initAngle+th*m));
            %disp(eval);
            if (max(abs(eval))<tol) 
                lY = lY+1;
                %y(lY,:) = eval;
                y(lY,:) = ChazyEvalDirect(system,y(lY-1,:),y(lY-1,1)+h*exp(1i*initAngle+th*(m-stepAdj)));
                initAngle = initAngle+th*m;
                found = 1;
                break;
            end
            m = m-1;
        end
        if (found == 0) 
            warning('CHAZY:PoleVault:allStepsIntersectTolerance','Valid initial angle, but all subsequent angles intersect with tolerance');
            initAngle = angle(y0(1)+abs(y(lY,1)-y0(1))*exp(1i*ang)-y(lY,1));
            y(lY+1,:) = ChazyEvalDirect(system,y(lY,:),y(lY,1)+h*exp(1i*initAngle));
            lY = lY+1;
            found = 1;
            out = y;
            circle = [0,0,0,0,0,0];
            return;
        end
        
    end
    %{
    if (found == 0)
        tol = tol*10;
    end
    %}
    %disp('threshold dist to line:');
    %disp(abs(y(lY,1) - y0(1) - abs(y(lY,1)-y0(1))*exp(1i*ang)));
end
%disp('polevault completed at:');
%disp(y(lY,:));
valid = 1;
out = y;

circ = y;
lC = lY;

%while and(lY<1000,or((lC-lY)<numSteps,abs(circ(lC,1) - y0(1) - abs(circ(lC,1)-y0(1))*exp(1i*ang)) > 1*h))
%while and(lC<1000,(angle(circ(lC,1)-y(lY,1))-mod(ang+pi,2*pi))*(angle(circ(lC-1,1)-y(lY,1))-mod(ang+pi,2*pi))>0);
while and(lC<200,abs(circ(lC,1)-y0(1))>1*h)
    %disp(initAngle);
    initAngle=mod(initAngle,2*pi);
    m = 0;
    eval = ChazyEvalDirect(system,circ(lC,:),circ(lC,1)+h*exp(1i*(initAngle+th*m)));
    found = 0;
    if (max(abs(eval))<tol)
        %valid, need to find closest contour by closing angle
        while (abs(m*th) < 2*pi)
            eval2 = ChazyEvalDirect(system,circ(lC,:),circ(lC,1)+h*exp(1i*(initAngle+th*(m+1+stepAdj))));
            if (max(abs(eval2))>tol)
                lC = lC+1;
                circ(lC,:) = eval;
                initAngle = initAngle+th*m;
                found = 1;
                break;
            else
                eval = eval2;
            end
            m = m+1;
        end
        if (found == 0)
            warning('CHAZY:PoleVault:noStepsIntersectTolerance','Valid initial angle, but no subsequent angles intersect with tolerance');
            initAngle = angle(y(lY,1)+abs(circ(lC,1)-y(lY,1))*exp(1i*ang)-circ(lC,1));
            circ(lC+1,:) = ChazyEvalDirect(system,y(lY,:),y(lY,1)+h*exp(1i*initAngle));
            lC = lC+1;
            found = 1;
            circle = [0,0,0,0,0,0];
            return;
        end
    else
        %invalid, need to expand angle
        while (abs(m*th) < 2*pi)
            eval = ChazyEvalDirect(system,circ(lC,:),circ(lC,1)+h*exp(1i*initAngle+th*m));
            %disp(eval);
            if (max(abs(eval))<tol) 
                lC = lC+1;
                circ(lC,:) = ChazyEvalDirect(system,circ(lC-1,:),circ(lC-1,1)+h*exp(1i*initAngle+th*(m-stepAdj)));
                initAngle = initAngle+th*m;
                found = 1;
                break;
            end
            m = m-1;
        end
        if (found == 0) 
            warning('CHAZY:PoleVault:allStepsIntersectTolerance','Valid initial angle, but all subsequent angles intersect with tolerance');
            initAngle = angle(y(lY,1)+abs(circ(lC,1)-y(lY,1))*exp(1i*ang)-circ(lC,1));
            circ(lC+1,:) = ChazyEvalDirect(system,circ(lC,:),circ(lC,1)+h*exp(1i*initAngle));
            lC = lC+1;
            found = 1;
            circle = [0,0,0,0,0,0];
            return;
        end
        
    end
    
end

lC = lC+1;
circ(lC,:) = ChazyEvalDirect(system,circ(lC-1,:),y0(1));

circle = PoleEval(circ);
if (th<0)
    circle(2) = -circle(2);
end
end