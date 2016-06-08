function [ outVector ] = SineSystem( inVector )
    outVector(1) = inVector(2);
    outVector(2) = -(inVector(1));
end

