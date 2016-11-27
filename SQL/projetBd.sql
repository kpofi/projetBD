
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
       idForfait integer references Forfait(idForfait),
       dureeForfait integer check(dureeForfait >= 0),
       dateForfaitDebut Date,
       PRIMARY KEY (idForfait)
       );

create table Vehicule(
       idVehicule integer PRIMARY KEY check(idVehicule >= 0),
       nbrePlaceDsVehicule integer check(nbrePlaceDsVehicule > 0),
       typeVehicule varchar(30) references TypeVehicule(typeVehicule)
       );

create table Location(
       dateLocation Date,
       heureLocation integer,
       idVehicule integer references Vehicule(idVehicule),
       cbAbonne integer references Abonnees(cbAbonne),
       nomStation varchar(30) references Station(nomStation),
       PRIMARY KEY (dateLocation,heureLocation, idVehicule)
       );



create table Retour(
       dateR Date,
       heureR integer,
       nomStation varchar(30) references Station(nomStation),
       dateLocation Date,
       heureLocation integer,
       idVehicule integer check(idVehicule >= 0),
       PRIMARY KEY (dateLocation,heureLocation,idVehicule),
       foreign key (dateLocation,heureLocation, idVehicule) references Location(dateLocation,heureLocation, idVehicule)
       );


create table Garer(
	nomStation varchar(30) references Station(nomStation),
	idVehicule integer references Vehicule(idVehicule),
	PRIMARY KEY (idVehicule)
	);


create table Dispatching(
       nombrePlace integer check(nombrePlace >= 0),
       nomStation varchar(30) references Station(nomStation),
       typeVehicule varchar(30) references TypeVehicule(typeVehicule),
       PRIMARY KEY (nomStation,typeVehicule)
       );





create table ForfaitCentraling(
       cbAbonne integer references Abonnees(cbAbonne),
       typeVehicule varchar(30) references TypeVehicule(typeVehicule),
       idForfait integer references Forfait(idForfait),
       PRIMARY KEY (cbAbonne, typeVehicule)
       );


