function [featuresAlpha , featuresBeta] = getFeatures1ElectrodeFromData( subjectData, chanel )


% chargement des données
data = subjectData.signal;
event = subjectData.info.EVENT;
position = event.POS;
type = event.TYP;
durationOfMvt = 1024; %4s at 256 Hz
nbTrials = 80;


LHcode = 1089;
RHcode = 1090;
BHcode = 1104;

% Get signal from one electrod
signal = data(:,chanel);

% we use the filter
signalfilteredAlpha = bandpassFilter(signal,8,12); % frequencies in alpha : between 8 and 12
signalfilteredBeta = bandpassFilter(signal,15,30); % frequencies in beta : between 15 and 30

%% LEFT HAND
% we compare all the values of type with 1089 (number type for the left hand)
 matrixLAlpha11 = [];
 matrixLBeta21 = [];


for i = find(type' == LHcode)        
        positionOfMvt = position(i); %0.5s = 0.5s*256Hz=128 samples
                
        mvtValuesAlpha1 = signalfilteredAlpha(positionOfMvt:durationOfMvt+positionOfMvt,1);
        mvtValuesBeta2 = signalfilteredBeta(positionOfMvt:durationOfMvt+positionOfMvt,1);
        matrixLAlpha11 = [matrixLAlpha11;mvtValuesAlpha1];
        matrixLBeta21 = [matrixLBeta21;mvtValuesBeta2];
end

% we reshape the matrix into 3 dimensions
matrixLAlpha1 = reshape(matrixLAlpha11,durationOfMvt+1,nbTrials);
matrixLBeta2 = reshape(matrixLBeta21,durationOfMvt+1,nbTrials);

% we apply variance
F1L = log2(1+mean(matrixLAlpha1.*matrixLAlpha1));
F2L = log2(1+mean(matrixLBeta2.*matrixLBeta2));



%% RIGHT HAND
% we compare all the values of type with 1090 (number type for the right hand)
 matrixRAlpha1 = [];
 matrixRBeta2 = [];

for i = find(type' == RHcode)
        positionOfMvt = position(i);
        
        mvtValuesAlpha1 = signalfilteredAlpha(positionOfMvt:durationOfMvt+positionOfMvt,1);
        mvtValuesBeta2 = signalfilteredBeta(positionOfMvt:durationOfMvt+positionOfMvt,1);
        matrixRAlpha1 = [matrixRAlpha1;mvtValuesAlpha1];
        matrixRBeta2 = [matrixRBeta2;mvtValuesBeta2];

end
% we reshape the matrix into 3 dimensions
matrixRAlpha1 = reshape(matrixRAlpha1,durationOfMvt+1,nbTrials);
matrixRBeta2 = reshape(matrixRBeta2,durationOfMvt+1,nbTrials);

% we apply variance
F1R = log2(1+mean(matrixRAlpha1.*matrixRAlpha1));
F2R = log2(1+mean(matrixRBeta2.*matrixRBeta2));



%% BOTH HANDS
% we compare all the values of type with 1090 (number type for the right hand)
 matrixBAlpha1 = [];
 matrixBBeta2 = [];

for i = find(type' == BHcode)
        positionOfMvt = position(i);
        
        mvtValuesAlpha1 = signalfilteredAlpha(positionOfMvt:durationOfMvt+positionOfMvt,1);
        mvtValuesBeta2 = signalfilteredBeta(positionOfMvt:durationOfMvt+positionOfMvt,1);
        matrixBAlpha1 = [matrixBAlpha1;mvtValuesAlpha1];
        matrixBBeta2 = [matrixBBeta2;mvtValuesBeta2];

end
% we reshape the matrix into 3 dimensions
matrixBAlpha1 = reshape(matrixBAlpha1,durationOfMvt+1,nbTrials);
matrixBBeta2 = reshape(matrixBBeta2,durationOfMvt+1,nbTrials);

% we apply variance
F1B = log2(1+mean(matrixBAlpha1.*matrixBAlpha1));
F2B = log2(1+mean(matrixBBeta2.*matrixBBeta2));


%% creation of features
featuresAlpha = [F1L' ; F1R'; F1B'];
featuresBeta = [F2L' ; F2R'; F2B'];
end