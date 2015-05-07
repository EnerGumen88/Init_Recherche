function [signalFiltered] = bandpassFilter(signal, lowFreq, highFreq)

%UNTITLED2 Summary of this function goes here

%   Detailed explanation goes here

 

% we use the filter
%[lig, col] = size(signal);
order = 6;

[B,A] = butter(order, [lowFreq/128,highFreq/128]);

signalFiltered = filter(B,A,signal);
%signalFiltered = zeros(lig,1);

%for i=1:lig
%    signalFiltered(i) = filter(B,A,signal(i));
%end
 
mvtValues=[];
matrixLAlpha=[];
matrixLBeta=[];


end