function myStruct = getAllLDA( data )


%Récupération des signaux
[alla,allb,classes,label] = getFeaturesAllElectrodesFromData(data);
C3=[alla(:,13),allb(:,13)];
C4=[alla(:,17),allb(:,17)];
C34=[C3,C4];
C34a=[alla(:,13),alla(:,17)];
C34b=[allb(:,13),allb(:,17)];
deriv3=[alla(:,6)-alla(:,20),allb(:,6)-allb(:,20)];
deriv4 = [alla(:,10)-alla(:,24),allb(:,10)-allb(:,24)];
deriv34=[deriv3,deriv4];
deriv34a=[deriv3(:,1),deriv4(:,1)];
deriv34b=[deriv3(:,2),deriv4(:,2)];
laplacien3=[4*alla(:,13)-alla(:,12)-alla(:,14)-alla(:,6)-alla(:,20),4*allb(:,13)-allb(:,12)-allb(:,14)-allb(:,6)-allb(:,20)];
laplacien4=[4*alla(:,17)-alla(:,16)-alla(:,10)-alla(:,18)-alla(:,24),4*allb(:,17)-allb(:,16)-allb(:,10)-allb(:,18)-allb(:,24)];
laplacien34=[laplacien3,laplacien4];
laplacien34a=[laplacien3(:,1),laplacien4(:,1)];
laplacien34b=[laplacien3(:,2),laplacien4(:,2)];

myStruct.signaux.alpha=alla;
myStruct.signaux.beta=allb;
myStruct.classes=classes;
myStruct.info.label=label;

%% Toutes les électrodes
% Alpha et Beta
myStruct.LDA.all.all.obj=fitcdiscr([myStruct.signaux.alpha,myStruct.signaux.beta],myStruct.classes);
myStruct.LDA.all.all.error=resubLoss(myStruct.LDA.all.all.obj);
myStruct.LDA.all.all.nb_error=myStruct.LDA.all.all.error * myStruct.LDA.all.all.obj.NumObservations;
myStruct.LDA.all.all.confusion=confusionmat(myStruct.LDA.all.all.obj.Y,resubPredict(myStruct.LDA.all.all.obj));
myStruct.LDA.all.all.predict= resubPredict(myStruct.LDA.all.all.obj);

% Alpha
myStruct.LDA.all.alpha.obj=fitcdiscr(myStruct.signaux.alpha,myStruct.classes);
myStruct.LDA.all.alpha.error=resubLoss(myStruct.LDA.all.alpha.obj);
myStruct.LDA.all.alpha.nb_error=myStruct.LDA.all.alpha.error * myStruct.LDA.all.alpha.obj.NumObservations;
myStruct.LDA.all.alpha.confusion=confusionmat(myStruct.LDA.all.alpha.obj.Y,resubPredict(myStruct.LDA.all.alpha.obj));
myStruct.LDA.all.alpha.predict= resubPredict(myStruct.LDA.all.alpha.obj);

% Beta
myStruct.LDA.all.beta.obj=fitcdiscr(myStruct.signaux.beta,myStruct.classes);
myStruct.LDA.all.beta.error=resubLoss(myStruct.LDA.all.beta.obj);
myStruct.LDA.all.beta.nb_error=myStruct.LDA.all.beta.error * myStruct.LDA.all.beta.obj.NumObservations;
myStruct.LDA.all.beta.confusion=confusionmat(myStruct.LDA.all.beta.obj.Y,resubPredict(myStruct.LDA.all.beta.obj));
myStruct.LDA.all.beta.predict= resubPredict(myStruct.LDA.all.beta.obj);


%% C3 et C4
% Alpha et beta
myStruct.LDA.c3c4.all.obj=fitcdiscr(C34,myStruct.classes);
myStruct.LDA.c3c4.all.error=resubLoss(myStruct.LDA.c3c4.all.obj);
myStruct.LDA.c3c4.all.nb_error=myStruct.LDA.c3c4.all.error * myStruct.LDA.c3c4.all.obj.NumObservations;
myStruct.LDA.c3c4.all.confusion=confusionmat(myStruct.LDA.c3c4.all.obj.Y,resubPredict(myStruct.LDA.c3c4.all.obj));
myStruct.LDA.c3c4.all.predict= resubPredict(myStruct.LDA.c3c4.all.obj);

% Alpha
myStruct.LDA.c3c4.alpha.obj=fitcdiscr(C34a,myStruct.classes);
myStruct.LDA.c3c4.alpha.error=resubLoss(myStruct.LDA.c3c4.alpha.obj);
myStruct.LDA.c3c4.alpha.nb_error=myStruct.LDA.c3c4.alpha.error * myStruct.LDA.c3c4.alpha.obj.NumObservations;
myStruct.LDA.c3c4.alpha.confusion=confusionmat(myStruct.LDA.c3c4.alpha.obj.Y,resubPredict(myStruct.LDA.c3c4.alpha.obj));
myStruct.LDA.c3c4.alpha.predict= resubPredict(myStruct.LDA.c3c4.alpha.obj);

% Beta
myStruct.LDA.c3c4.beta.obj=fitcdiscr(C34b,myStruct.classes);
myStruct.LDA.c3c4.beta.error=resubLoss(myStruct.LDA.c3c4.beta.obj);
myStruct.LDA.c3c4.beta.nb_error=myStruct.LDA.c3c4.beta.error * myStruct.LDA.c3c4.beta.obj.NumObservations;
myStruct.LDA.c3c4.beta.confusion=confusionmat(myStruct.LDA.c3c4.beta.obj.Y,resubPredict(myStruct.LDA.c3c4.beta.obj));
myStruct.LDA.c3c4.beta.predict= resubPredict(myStruct.LDA.c3c4.beta.obj);

%% Derivation
% Alpha et Beta
myStruct.LDA.deriv.all.obj=fitcdiscr(deriv34,myStruct.classes);
myStruct.LDA.deriv.all.error=resubLoss(myStruct.LDA.deriv.all.obj);
myStruct.LDA.deriv.all.nb_error=myStruct.LDA.deriv.all.error * myStruct.LDA.deriv.all.obj.NumObservations;
myStruct.LDA.deriv.all.confusion=confusionmat(myStruct.LDA.deriv.all.obj.Y,resubPredict(myStruct.LDA.deriv.all.obj));
myStruct.LDA.deriv.all.predict= resubPredict(myStruct.LDA.deriv.all.obj);

% Alpha
myStruct.LDA.deriv.alpha.obj=fitcdiscr(deriv34a,myStruct.classes);
myStruct.LDA.deriv.alpha.error=resubLoss(myStruct.LDA.deriv.alpha.obj);
myStruct.LDA.deriv.alpha.nb_error=myStruct.LDA.deriv.alpha.error * myStruct.LDA.deriv.alpha.obj.NumObservations;
myStruct.LDA.deriv.alpha.confusion=confusionmat(myStruct.LDA.deriv.alpha.obj.Y,resubPredict(myStruct.LDA.deriv.alpha.obj));
myStruct.LDA.deriv.alpha.predict= resubPredict(myStruct.LDA.deriv.alpha.obj);

% Beta
myStruct.LDA.deriv.beta.obj=fitcdiscr(deriv34b,myStruct.classes);
myStruct.LDA.deriv.beta.error=resubLoss(myStruct.LDA.deriv.beta.obj);
myStruct.LDA.deriv.beta.nb_error=myStruct.LDA.deriv.beta.error * myStruct.LDA.deriv.beta.obj.NumObservations;
myStruct.LDA.deriv.beta.confusion=confusionmat(myStruct.LDA.deriv.beta.obj.Y,resubPredict(myStruct.LDA.deriv.beta.obj));
myStruct.LDA.deriv.beta.predict= resubPredict(myStruct.LDA.deriv.beta.obj);

%% Laplacien
% Alpha et Beta
myStruct.LDA.laplacien.all.obj=fitcdiscr(laplacien34,myStruct.classes);
myStruct.LDA.laplacien.all.error=resubLoss(myStruct.LDA.laplacien.all.obj);
myStruct.LDA.laplacien.all.nb_error=myStruct.LDA.laplacien.all.error * myStruct.LDA.laplacien.all.obj.NumObservations;
myStruct.LDA.laplacien.all.confusion=confusionmat(myStruct.LDA.laplacien.all.obj.Y,resubPredict(myStruct.LDA.laplacien.all.obj));
myStruct.LDA.laplacien.all.predict= resubPredict(myStruct.LDA.laplacien.all.obj);

% Alpha
myStruct.LDA.laplacien.alpha.obj=fitcdiscr(laplacien34a,myStruct.classes);
myStruct.LDA.laplacien.alpha.error=resubLoss(myStruct.LDA.laplacien.alpha.obj);
myStruct.LDA.laplacien.alpha.nb_error=myStruct.LDA.laplacien.alpha.error * myStruct.LDA.laplacien.alpha.obj.NumObservations;
myStruct.LDA.laplacien.alpha.confusion=confusionmat(myStruct.LDA.laplacien.alpha.obj.Y,resubPredict(myStruct.LDA.laplacien.alpha.obj));
myStruct.LDA.laplacien.alpha.predict= resubPredict(myStruct.LDA.laplacien.alpha.obj);

% Beta
myStruct.LDA.laplacien.beta.obj=fitcdiscr(laplacien34b,myStruct.classes);
myStruct.LDA.laplacien.beta.error=resubLoss(myStruct.LDA.laplacien.beta.obj);
myStruct.LDA.laplacien.beta.nb_error=myStruct.LDA.laplacien.beta.error * myStruct.LDA.laplacien.beta.obj.NumObservations;
myStruct.LDA.laplacien.beta.confusion=confusionmat(myStruct.LDA.laplacien.beta.obj.Y,resubPredict(myStruct.LDA.laplacien.beta.obj));
myStruct.LDA.laplacien.beta.predict= resubPredict(myStruct.LDA.laplacien.beta.obj);


%% Majorité
%Récupération de tout les résultats
myStruct.majorite.all=[myStruct.LDA.all.all.predict,myStruct.LDA.all.alpha.predict,myStruct.LDA.all.beta.predict,myStruct.LDA.c3c4.all.predict,myStruct.LDA.c3c4.alpha.predict,myStruct.LDA.c3c4.beta.predict,myStruct.LDA.deriv.all.predict,myStruct.LDA.deriv.alpha.predict,myStruct.LDA.deriv.beta.predict,myStruct.LDA.laplacien.all.predict,myStruct.LDA.laplacien.alpha.predict,myStruct.LDA.laplacien.beta.predict];

%Choisi le mouvement qui est tombé le plus de fois
for i = 1:240
    nbL = length(find(myStruct.majorite.all(i,:)=='L'));
    nbR = length(find(myStruct.majorite.all(i,:)=='R'));
    nbB = length(find(myStruct.majorite.all(i,:)=='B'));
    
    if nbL>nbR
        if nbL>nbB
            myStruct.majorite.classement(i,1)='L';
        elseif nbL==nbB
            myStruct.majorite.classement(i,1)=myStruct.majorite.all(i,1); 
        else
            myStruct.majorite.classement(i,1)='B';
        end
    elseif nbL==nbR
        if nbL>=nbB
            myStruct.majorite.classement(i,1)=myStruct.majorite.all(i,1);
        else
            myStruct.majorite.classement(i,1)='B';
        end
    else
        if nbR>nbB
            myStruct.majorite.classement(i,1)='R';
        elseif nbR==nbB
            myStruct.majorite.classement(i,1)=myStruct.majorite.all(i,1);
        else
            myStruct.majorite.classement(i,1)='B'; 
        end
    end    
end

%Récupération du nombre d'erreur
myStruct.majorite.nb_error=0;
for i=1:240
    if myStruct.majorite.classement(i,1)~=myStruct.classes(i,1)
        myStruct.majorite.nb_error = myStruct.majorite.nb_error + 1;
    end
end
myStruct.majorite.error = myStruct.majorite.nb_error / 240;
myStruct.majorite.confusion=confusionmat(myStruct.classes,myStruct.majorite.classement);
end
