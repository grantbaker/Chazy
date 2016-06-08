function [w] = BilinearT(x,w1,w2,w3,x1,x2,x3)
w=(((((x1-x)*(x3-x2)/((x1-x2)*(x3-x)))*((w1-w2)/(w3-w2)))*w3)-w1)/((((x1-x)*(x3-x2)/((x1-x2)*(x3-x)))*((w1-w2)/(w3-w2)))-1)
end