CREATE TABLE _formation (
  libelle_formation character varying(20),
  CONSTRAINT Formation_pk PRIMARY KEY(libelle_formation)
  );

CREATE TABLE _type_musique (
  type_m character varying(20),
  CONSTRAINT Type_musique_pk PRIMARY KEY(type_m)
  );
 CREATE TABLE _annee (
   an NUMERIC(4,0) NOT NULL,
   CONSTRAINT _annee_pk PRIMARY KEY(an)
);

CREATE TABLE _pays (
    nom_p VARCHAR(30) NOT NULL,
    CONSTRAINT _pays_pk PRIMARY KEY(nom_p)
);

CREATE TABLE _a_pour(
  id_groupe_artiste_f character varying(20),
  libelle_formation_g character varying(20),
  CONSTRAINT a_pour_pk PRIMARY KEY(id_groupe_artiste_f,libelle_formation_g)  
  );

CREATE TABLE _type_ponctuel(
  id_groupe_artiste_m character varying(20),
  type_m_m character varying(20),
  CONSTRAINT type_ponctuel_pk PRIMARY KEY(id_groupe_artiste_m,type_m_m)  
  );

CREATE TABLE _type_principal(
  id_groupe_artiste_pr character varying(20),
  type_m_pr character varying(20),
  CONSTRAINT type_principal_pk PRIMARY KEY(id_groupe_artiste_pr,type_m_pr)
  );

CREATE TABLE _concert(
  no_concert VARCHAR(20),
  titre VARCHAR(30),
  resume  VARCHAR(280),
  duree NUMERIC(10,0),
  tarif NUMERIC(3,2),
  type_m_c VARCHAR(20),
  nom_edition_c VARCHAR(60),
  CONSTRAINT concert_pk PRIMARY KEY(no_concert)
  );

CREATE TABLE _edition(
  nom_edition VARCHAR(60),
  an_e NUMERIC(4,0),
  CONSTRAINT edition_pk PRIMARY KEY(nom_edition)
  );
  
CREATE TABLE _groupe_artiste (
    id_groupe_artiste       VARCHAR(10)     NOT NULL,
    nom_groupe_artiste      VARCHAR(30)     NOT NULL,
    pays_dorigine           VARCHAR(30)     NOT NULL,
    annee_debut             NUMERIC(4,0)    NOT NULL,
    sortie_discographique   NUMERIC(4,0)    NOT NULL,
    site_web                VARCHAR(60)     NOT NULL,
    CONSTRAINT _groupe_artiste_pk PRIMARY KEY (Id_Groupe_Artiste)
);

CREATE TABLE _representation (
    numero_representation   VARCHAR(10)     NOT NULL,
    Id_Groupe_Artiste       VARCHAR(10)     NOT NULL,
    id_lieu                 VARCHAR(10)     NOT NULL,
    heure                   VARCHAR(8)      NOT NULL,
    date_representation     date            NOT NULL,
    CONSTRAINT _representation_pk PRIMARY KEY (numero_representation)
);

CREATE TABLE _lieu (
    id_lieu                 VARCHAR(10)     NOT NULL,
    nom_lieu                VARCHAR(60)     NOT NULL,
    nom_v                   VARCHAR(30)     NOT NULL,
    accesPMR                BOOLEAN         NOT NULL,
    capacite_max            INTEGER         NOT NULL,
    type_lieu               VARCHAR(20)     NOT NULL,
    CONSTRAINT _lieu_pk PRIMARY KEY(id_lieu)
);

CREATE TABLE _ville (
    nom_v                   VARCHAR(30)     NOT NULL,
    nom_p                   VARCHAR(30)     NOT NULL,
    CONSTRAINT _ville_pk PRIMARY KEY (nom_v)
);


ALTER TABLE _a_pour
  add CONSTRAINT a_pour_fk_groupe_artiste 
  FOREIGN KEY (id_groupe_artiste_f) REFERENCES _groupe_artiste(id_groupe_artiste);

ALTER TABLE _a_pour
  add CONSTRAINT a_pour_fk_formation 
  FOREIGN KEY (libelle_formation_g) REFERENCES _formation(libelle_formation);

ALTER TABLE _type_ponctuel
  add CONSTRAINT type_ponctuel_fk_Groupe_Artiste 
  FOREIGN KEY (id_groupe_artiste_m) REFERENCES _groupe_artiste(id_groupe_artiste);

ALTER TABLE _type_ponctuel
  add CONSTRAINT type_ponctuel_fk_type_musique 
  FOREIGN KEY (type_m_m) REFERENCES _type_musique(type_m);

ALTER TABLE _type_principal
  add CONSTRAINT type_principal_fk_Groupe_Artiste 
  FOREIGN KEY (id_groupe_artiste_pr) REFERENCES _groupe_artiste(id_groupe_artiste);
  
ALTER TABLE _type_principal
  add CONSTRAINT type_principal_fk_type_musique 
  FOREIGN KEY (type_m_pr) REFERENCES _type_musique(type_m);
  
ALTER TABLE _concert
  add CONSTRAINT concert_fk_type_musique 
  FOREIGN KEY(type_m_c) REFERENCES _type_musique(type_m);

ALTER TABLE _concert
  add CONSTRAINT concert_fk_edition 
  FOREIGN KEY(nom_edition_c) REFERENCES _edition(nom_edition);

ALTER TABLE _edition
  add CONSTRAINT edition_fk_annee 
  FOREIGN KEY(an_e) REFERENCES _annee(an);

ALTER TABLE _representation
  add CONSTRAINT representation_fk_groupe_artiste 
  FOREIGN KEY(Id_Groupe_Artiste) references _groupe_artiste(Id_Groupe_Artiste);

ALTER TABLE _representation
  add CONSTRAINT representation_fk_lieu 
  FOREIGN KEY(id_lieu) references _lieu(id_lieu);

ALTER TABLE _groupe_artiste
  add CONSTRAINT _groupe_artiste_fk_pays 
  FOREIGN KEY (pays_dorigine) references _pays(nom_p);

ALTER TABLE _groupe_artiste
  add CONSTRAINT _groupe_artiste_fk_annee_debut 
  FOREIGN KEY (annee_debut) references _annee(an);

ALTER TABLE _groupe_artiste
  add CONSTRAINT _groupe_artiste_fk_annee_sortie_discographique 
  FOREIGN KEY (sortie_discographique) references _annee(an);

ALTER TABLE _lieu
  add CONSTRAINT _lieu_fk_ville 
  FOREIGN KEY(nom_v) references _ville(nom_v);

ALTER TABLE _ville
  add CONSTRAINT _ville_fk_pays 
  FOREIGN KEY(nom_p) references _pays(nom_p);

