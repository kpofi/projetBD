
create table Station(
       nomStation varchar(30) primary key,
       adresseStation varchar(50)
       );

create table TypeVehicule(
       typeVehicule varchar(30) NOT NULL CHECK(typeVehicule in ('voiture electrique', 'velo', 'velo electrique', 'velo remorque','utilitaire','voiture essence')),
       dureeMaxVehicule integer check(dureeMaxVehicule >= 0),
       prixTypeVehicule integer check(prixTypeVehicule >= 0),
       caution integer check(caution >= 0),
       PRIMARY KEY (typeVehicule)
       );


create table Abonnees(
       cbAbonne integer primary key,
       nom varchar(30),
       prenom varchar(30),
       dateNaissance Date,
       reduction integer check(reduction >= 0)
       );

create table Forfait(
       idForfait integer primary key check(idForfait >= 0),
       prix integer check(prix >= 0)
       );

create table ForfaitLocation(
       idForfait integer references Forfait(idForfait),
       nbLocationMax integer check(nbLocationMax >= 0),
       PRIMARY KEY (idForfait)
       );


create table ForfaitDuree(
       idForfait integer,
       dureeForfait integer check(dureeForfait >= 0),
       dateForfaitDebut Date,
       PRIMARY KEY (idForfait),
       foreign key (idForfait) Forfait(idForfait)
       	       on delete set null
	       on update cascade
       );

create table Vehicule(
       idVehicule integer PRIMARY KEY check(idVehicule >= 0),
       nbrePlaceDsVehicule integer check(nbrePlaceDsVehicule > 0),
       typeVehicule varchar(30),
       foreign key (typeVehicule) references TypeVehicule(typeVehicule)
       	       on delete set null
	       on update cascade
       );

create table Location(
       dateLocation Date,
       heureLocation integer,
       idVehicule integer,
       cbAbonne integer,
       nomStation varchar(30),
       PRIMARY KEY (dateLocation,heureLocation, idVehicule),
       foreign key (idVehicule) references Vehicule(idVehicule)
       	       on delete set null
	       on update cascade,
       foreign key (cbAbonne) references Abonnees(cbAbonne)
       	       on delete set null
	       on update cascade,
       foreign key (nomStation) references Station(nomStation)
       	       on delete set null
	       on update cascade
       );



create table Retour(
       dateR Date,
       heureR integer,
       nomStation varchar(30),
       dateLocation Date,
       heureLocation integer,
       idVehicule integer check(idVehicule >= 0),
       PRIMARY KEY (dateLocation,heureLocation,idVehicule),
       foreign key (dateLocation,heureLocation, idVehicule) references Location(dateLocation,heureLocation, idVehicule)
       	       on delete set null
	       on update cascade,
       foreign key (nomStation) references Station(nomStation)
       	       on delete set null
	       on update cascade
       );


create table Garer(
	nomStation varchar(30),
	idVehicule integer,
	PRIMARY KEY (idVehicule),
	foreign key (nomStation) references Station(nomStation)
		on delete set null
		on update cascade,
	foreign key (idVehicule) references Vehicule(idVehicule)
		on delete set null
		on update cascade
	);


create table Dispatching(
       nombrePlace integer check(nombrePlace >= 0),
       nomStation varchar(30),
       typeVehicule varchar(30),
       PRIMARY KEY (nomStation,typeVehicule),
       foreign key (nomStation) references Station(nomStation)
       	       on delete set null
	       on update cascade,
       foreign key (typeVehicule) references TypeVehicule(typeVehicule)
       	       on delete set null
	       on update cascade
       );





create table ForfaitCentraling(
       cbAbonne integer references Abonnees(cbAbonne),
       typeVehicule varchar(30) references TypeVehicule(typeVehicule),
       idForfait integer references Forfait(idForfait),
       PRIMARY KEY (cbAbonne, typeVehicule),
       foreign key (cbAbonne) references Abonnees(cbAbonne)
       	       on delete set null
	       on update cascade,
       foreign key (typeVehicule) references TypeVehicule(typeVehicule)
       	       on delete set null
	       on update cascade
       );


