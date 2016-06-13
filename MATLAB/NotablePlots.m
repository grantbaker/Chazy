%Notable plots that have been stumbled across

%Branch point of the Ramanujan system (P, in q space)???
ComplexPlot(ChazyPointsSimple(@RamanujanQ, [1,1,1i,1], 6, 0.02, 0.01, 10^4), 10^2)
ComplexPlot(ChazyPointsSimple(@RamanujanQ, ChazyEvalSimple(@RamanujanQ, [1,1,1i,1], -1-1i, 0.001, 10^4), 6, 0.02, 0.01, 10^4), 10^2)
ComplexPlot(ChazyPointsSimple(@RamanujanQ, ChazyEvalSimple(@RamanujanQ, ChazyEvalSimple(@RamanujanQ, [1,1,1i,1], -1-1i, 0.001, 10^4), -1+1i, 0.001, 10^4), 6, 0.02, 0.01, 10^4), 10^2)
ComplexPlot(ChazyPointsSimple(@RamanujanQ, ChazyEvalSimple(@RamanujanQ, ChazyEvalSimple(@RamanujanQ, ChazyEvalSimple(@RamanujanQ, [1,1,1i,1], -1-1i, 0.001, 10^4), -1+1i, 0.001, 10^4), 1, 0.001, 10^4), 6, 0.02, 0.01, 10^4), 10^2)

ComplexPlot(ChazyPointsSimple(@RamanujanTau, [1i,1i,1i,0], 15, 0.05, 0.01, 10^10), 10^2)
ComplexPlot(ChazyPointsSimple(@RamanujanTau, ChazyEvalSimple(@RamanujanTau, [1i,1i,1i,0],8i,0.0002,10^10), 15, 0.05, 0.01, 10^10),10^2)
ComplexPlot(ChazyPointsSimple(@RamanujanTau, ChazyEvalSimple(@RamanujanTau, [1i,1i,1i,0],10,0.0002,10^10), 50, 0.1,0.05,10^10),10^2)
 
ComplexPlot(PoleVault(@ChazyEq, [0.500000000000000,11.9999985019477,23.9999840858083,95.9998080304397], 0, 0.1, 0.1, 10^3),10^2)