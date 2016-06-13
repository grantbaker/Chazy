function [ out ] = PoleVault(system, y0, ang, h, th, tol)
%POLEVAULT given an initial angle and initial condition, the function returns the set of points
%vaulting around a singularity of magnitude above 'tol'

if (ChazyEvalSimple(system, y0, y0 + h*exp(1i*ang), h, tol) == y0

end

