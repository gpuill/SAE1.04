CREATE TABLE _groupe_artiste (
    Id_Groupe_Artiste       VARCHAR(10)     NOT NULL,
    nom_groupe_artiste      VARCHAR(30)     NOT NULL,
    pays_dorigine           VARCHAR(30)     NOT NULL,
    annee_debut             NUMERIC(4,0)    NOT NULL,
    sortie_discographique   NUMERIC(4,0)    NOT NULL,
    site_web                VARCHAR(60)     NOT NULL,
    CONSTRAINT _groupe_artiste_pk PRIMARY KEY (Id_Groupe_Artiste),
    CONSTRAINT _groupe_artiste_fk_pays FOREIGN KEY (pays_dorigine) references _pays(nom_p),
    CONSTRAINT _groupe_artiste_fk_annee_debut FOREIGN KEY (annee_debut) references _annee(an),
    CONSTRAINT _groupe_artiste_fk_annee_sortie_discographique FOREIGN KEY (sortie_discographique) references _annee(an)
);

CREATE TABLE _representation (
    numero_representation   VARCHAR(10)     NOT NULL,
    Id_Groupe_Artiste       VARCHAR(10)     NOT NULL,
    id_lieu                 VARCHAR(10)     NOT NULL,
    heure                   VARCHAR(8)      NOT NULL,
    date_representation     date            NOT NULL,
    CONSTRAINT _representation_pk PRIMARY KEY (numero_representation),
    CONSTRAINT _representation_fk_groupe_artiste foreign key(Id_Groupe_Artiste) references _groupe_artiste(Id_Groupe_Artiste),
    CONSTRAINT _representation_fk_lieu foreign key(id_lieu) references _lieu(id_lieu)
);

CREATE TABLE _lieu (
    id_lieu                 VARCHAR(10)     NOT NULL,
    nom_lieu                VARCHAR(60)     NOT NULL,
    nom_v                   VARCHAR(30)     NOT NULL,
    accesPMR                BOOLEAN         NOT NULL,
    capacite_max            INTEGER         NOT NULL,
    type_lieu               VARCHAR(20)     NOT NULL,
    CONSTRAINT _lieu_pk PRIMARY KEY(id_lieu),
    CONSTRAINT _lieu_fk_ville foreign key(nom_v) references _ville(nom_v)
);

CREATE TABLE _ville (
    nom_v                   VARCHAR(30)     NOT NULL,
    nom_p                   VARCHAR(30)     NOT NULL,
    CONSTRAINT _ville_pk PRIMARY KEY (nom_v),
    CONSTRAINT _ville_fk_pays FOREIGN KEY(nom_p) references _pays(nom_p)
);

CREATE TABLE _pays (
    nom_p                   VARCHAR(30)     NOT NULL,
    CONSTRAINT _pays_pk PRIMARY KEY(nom_p)
);

CREATE TABLE _annee (
    an                      NUMERIC(4,0)    NOT NULL,
    CONSTRAINT _annee_pk PRIMARY KEY(an)
);
