function [ featuresAlpha, featuresBeta , classes , label ] = getFeaturesAllElectrodesFromData( subjectData )

% chargement des données
nbTrials = 80;

numberElectrodes = length(subjectData.info.Label);

featuresAlpha=[];
featuresBeta=[];
label=[];

for i = 1:numberElectrodes
    [featureAlpha,featureBeta] = getFeatures1ElectrodeFromData(subjectData,i);
    featuresAlpha = [featuresAlpha featureAlpha];
    featuresBeta = [featuresBeta featureBeta];
    label = [label;subjectData.info.Label(i)];
end
    
classes = [repmat('L',nbTrials,1) ; repmat('R',nbTrials,1); repmat('B',nbTrials,1)];

end

