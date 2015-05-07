# Init_Recherche

Importer les données :
    - data = importdata('80_lh_rh_bh.mat');

Récupérer les variations de puissances en Alpha et en Beta pour toutes les électrodes, les mouvements associés et les électrodes utilisés :
    - [Alpha,Beta,classes,electrodes] = getFeaturesAllElectrodesFromData(data);

Récupérer les résultats des différentes méthodes d'apprentissages :
    - myStruct = getAllLDA(data);

Structure retournée :
    .signaux        ==> contient les variations de puissances en Alpha et en Beta de toutes les électrodes
        .alpha
        .beta
    .classes        ==> contient les mouvements associés aux variations de puissance
    .info           ==> contient divers informations
        .label      ==> contient les électrodes utilisées
    .LDA            ==> contient tout les résultats des différentes LDA
        .all            ==> contient les résultats de la LDA sur toutes les électrodes
            .all            ==> contient les résultats pour Alpha et Beta
                .obj            ==> résultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements prédits
            .alpha          ==> contient les résultats pour Alpha
                .obj            ==> résultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements prédits
            .beta           ==> contient les résultats pour Beta
                .obj            ==> résultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements prédits
        .c3c4           ==> contient les résultats de la LDA sur les électrodes C3 et C4
            .all            ==> contient les résultats pour Alpha et Beta
                .obj            ==> résultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements prédits
            .alpha          ==> contient les résultats pour Alpha
                .obj            ==> résultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements prédits
            .beta           ==> contient les résultats pour Beta
                .obj            ==> résultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements prédits
        .deriv          ==> contient les résultats de la LDA pour la méthode de dérivation
            .all            ==> contient les résultats pour Alpha et Beta
                .obj            ==> résultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements prédits
            .alpha          ==> contient les résultats pour Alpha
                .obj            ==> résultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements prédits
            .beta           ==> contient les résultats pour Beta
                .obj            ==> résultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements prédits
        .laplacien      ==> contient les résultats de la LDA pour la méthode de dérivation
            .all            ==> contient les résultats pour Alpha et Beta
                .obj            ==> résultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements prédits
            .alpha          ==> contient les résultats pour Alpha
                .obj            ==> résultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements prédits
            .beta           ==> contient les résultats pour Beta
                .obj            ==> résultat de la classification par MatLab
                .error          ==> pourcentage d'erreur
                .nb_error       ==> nombre d'erreur
                .confusion      ==> matrice de confusion
                .predict        ==> liste des mouvements prédits
    .majorite       ==> contient les résultats de la majorité : choisis le mouvement qui sort le plus parmis toutes les classifications
        .all            ==> contient toutes les prédictions de chaque classification
        .classement     ==> liste des mouvements choisit
        .nb_error       ==> nombre d'erreurs
        .error          ==> pourcentage d'erreur
        .confusion      ==> matrice de confusion

