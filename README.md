# Init_Recherche

Importer les donn�es :
    - data = importdata('80_lh_rh_bh.mat');

R�cup�rer les variations de puissances en Alpha et en Beta pour toutes les �lectrodes, les mouvements associ�s et les �lectrodes utilis�s :
    - [Alpha,Beta,classes,electrodes] = getFeaturesAllElectrodesFromData(data);

R�cup�rer les r�sultats des diff�rentes m�thodes d'apprentissages :
    - myStruct = getAllLDA(data);

Structure retourn�e :
    .signaux        ==> contient les variations de puissances en Alpha et en Beta de toutes les �lectrodes
        .alpha
        .beta
    .classes        ==> contient les mouvements associ�s aux variations de puissance
    .info           ==> contient divers informations
        .label      ==> contient les �lectrodes utilis�es
    .LDA            ==> contient tout les r�sultats des diff�rentes LDA
        .all            ==> contient les r�sultats de la LDA sur toutes les �lectrodes
            .all            ==> contient les r�sultats pour Alpha et Beta
                .obj            ==> r�sultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements pr�dits
            .alpha          ==> contient les r�sultats pour Alpha
                .obj            ==> r�sultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements pr�dits
            .beta           ==> contient les r�sultats pour Beta
                .obj            ==> r�sultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements pr�dits
        .c3c4           ==> contient les r�sultats de la LDA sur les �lectrodes C3 et C4
            .all            ==> contient les r�sultats pour Alpha et Beta
                .obj            ==> r�sultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements pr�dits
            .alpha          ==> contient les r�sultats pour Alpha
                .obj            ==> r�sultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements pr�dits
            .beta           ==> contient les r�sultats pour Beta
                .obj            ==> r�sultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements pr�dits
        .deriv          ==> contient les r�sultats de la LDA pour la m�thode de d�rivation
            .all            ==> contient les r�sultats pour Alpha et Beta
                .obj            ==> r�sultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements pr�dits
            .alpha          ==> contient les r�sultats pour Alpha
                .obj            ==> r�sultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements pr�dits
            .beta           ==> contient les r�sultats pour Beta
                .obj            ==> r�sultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements pr�dits
        .laplacien      ==> contient les r�sultats de la LDA pour la m�thode de d�rivation
            .all            ==> contient les r�sultats pour Alpha et Beta
                .obj            ==> r�sultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements pr�dits
            .alpha          ==> contient les r�sultats pour Alpha
                .obj            ==> r�sultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements pr�dits
            .beta           ==> contient les r�sultats pour Beta
                .obj            ==> r�sultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements pr�dits
    .majorite       ==> contient les r�sultats de la majorit� : choisis le mouvement qui sort le plus parmis toutes les classifications
        .all            ==> contient toutes les pr�dictions de chaque classification
        .classement     ==> liste des mouvements choisit
        .nb_error       ==> nombre d'erreurs
        .error          ==> pourcentage d'erreur
        .confusion      ==> matrice de confusion

