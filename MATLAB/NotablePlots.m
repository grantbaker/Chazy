%Notable plots that have been stumbled across

%Branch point of the Ramanujan system (P, in q space)???
ComplexPlot(ChazyPointsSimple(@RamanujanQ, [1,1,1i,1], 6, 0.02, 0.01, 10^4), 10^2)
ComplexPlot(ChazyPointsSimple(@RamanujanQ, ChazyEvalSimple(@RamanujanQ, [1,1,1i,1], -1-1i, 0.001, 10^4), 6, 0.02, 0.01, 10^4), 10^2)
ComplexPlot(ChazyPointsSimple(@RamanujanQ, ChazyEvalSimple(@RamanujanQ, ChazyEvalSimple(@RamanujanQ, [1,1,1i,1], -1-1i, 0.001, 10^4), -1+1i, 0.001, 10^4), 6, 0.02, 0.01, 10^4), 10^2)
ComplexPlot(ChazyPointsSimple(@RamanujanQ, ChazyEvalSimple(@RamanujanQ, ChazyEvalSimple(@RamanujanQ, ChazyEvalSimple(@RamanujanQ, [1,1,1i,1], -1-1i, 0.001, 10^4), -1+1i, 0.001, 10^4), 1, 0.001, 10^4), 6, 0.02, 0.01, 10^4), 10^2)