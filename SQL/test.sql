--creation des Station(nomStation, adresseStation)
insert into Station values('station1','adresse station1');
insert into Station values('station2','adresse station2');
insert into Station values('station3','adresse station3');
insert into Station values('station4','adresse station4');
insert into Station values('station5','adresse station5');
insert into Station values('station6','adresse station6');
insert into Station values('station7','adresse station7');
insert into Station values('station8','adresse station8');
--creation de TypeVehicule(typeVehicule, dureeMaxVehicule, prixTypeVehicule, caution)
insert into TypeVehicule values('velo', 24, 10, 200);
insert into TypeVehicule values('velo electrique', 24, 50, 400);
insert into TypeVehicule values('velo remorque', 24, 40, 300);
insert into TypeVehicule values('voiture electrique', 720, 200, 1000);
insert into TypeVehicule values('utilitaire', 720, 300, 1200);
insert into TypeVehicule values('voiture essence', 720, 200, 1000);
--creation Abonnees(cbAbonne, nom, prenom, dateNaissance, reduction)
--pour les date AAAA-MM-JJ
insert into Abonnees values(0, 'KEDA', 'Pofinet',TO_DATE('2010/11/14', 'yyyy/mm/dd'), 1);
insert into Abonnees values(1, 'ELIDRISSI', 'Mehdi',TO_DATE('2011/12/13', 'yyyy/mm/dd'), 1);
insert into Abonnees values(2, '16', 'Louis',TO_DATE('2013/11/14', 'yyyy/mm/dd'), 1);
insert into Abonnees values(3, 'LAPOINTE', 'Quentin',TO_DATE('2012/11/14', 'yyyy/mm/dd'), 1);
insert into Abonnees values(4, 'BARTIER', 'Valentin',TO_DATE('2013/11/14', 'yyyy/mm/dd'),1);
insert into Abonnees values(5, 'INCONNU', 'Myriam',TO_DATE('2015/11/14', 'yyyy/mm/dd'), 1);
insert into Abonnees values(6, 'BOBO', 'Johny',TO_DATE('1202/11/14', 'yyyy/mm/dd'), 1);
insert into Abonnees values(7, 'PICARD', 'Tom',TO_DATE('1960/11/14', 'yyyy/mm/dd'), 0);
insert into Abonnees values(8, 'COCO', 'Francis',TO_DATE('1956/11/14', 'yyyy/mm/dd'),0);
insert into Abonnees values(9, 'GROSS', 'Roland',TO_DATE('1989/11/14', 'yyyy/mm/dd'),0);
insert into Abonnees values(10, 'COPPE', 'Jean-Francois',TO_DATE('1922/11/14', 'yyyy/mm/dd'), 1);
insert into Abonnees values(11, 'Francois', 'Louis',TO_DATE('2013/11/14', 'yyyy/mm/dd'), 1);

--creation Forfait(idForfait, prix)
insert into Forfait values(0, 100);
insert into Forfait values(1, 200);
insert into Forfait values(2, 300);
insert into Forfait values(3, 200);
insert into Forfait values(4, 300);
insert into Forfait values(5, 400);
insert into Forfait values(6, 500);

--creation ForfaitLocation(idForfait, nbLocationMax)
insert into ForfaitLocation values(4, 6);
insert into ForfaitLocation values(3, 5);
insert into ForfaitLocation values(5, 7);
insert into ForfaitLocation values(6, 8);


--creation ForfaitDuree(idForfait, dureeForfait, dateForfaitDebut)
insert into ForfaitDuree values(0, 10, TO_DATE('2016-11-18', 'yyyy/mm/dd'));
insert into ForfaitDuree values(1, 15, TO_DATE('2016-11-18', 'yyyy/mm/dd'));
insert into ForfaitDuree values(2, 24, TO_DATE('2016-11-18', 'yyyy/mm/dd'));

--creation Vehicule(idVehicule, nbrePlaceDsVehicule, typeVehicule)
insert into Vehicule values(0, 1, 'velo');
insert into Vehicule values(1, 1, 'velo');
insert into Vehicule values(2, 1, 'velo');
insert into Vehicule values(3, 1, 'velo electrique');
insert into Vehicule values(4, 1, 'velo electrique');
insert into Vehicule values(5, 4, 'voiture essence');
insert into Vehicule values(6, 4, 'voiture essence');
insert into Vehicule values(7, 6, 'voiture essence');
insert into Vehicule values(8, 4, 'voiture essence');
insert into Vehicule values(9, 2, 'voiture essence');
insert into Vehicule values(10, 1, 'velo remorque');
insert into Vehicule values(11, 1, 'velo remorque');
insert into Vehicule values(12, 2, 'utilitaire');
insert into Vehicule values(13, 2, 'utilitaire');
insert into Vehicule values(14, 4, 'utilitaire');
insert into Vehicule values(15, 4, 'voiture electrique');
insert into Vehicule values(16, 4, 'utilitaire');
insert into Vehicule values(17, 4, 'voiture electrique');
insert into Vehicule values(18, 2, 'voiture essence');
insert into Vehicule values(19, 2, 'velo remorque');

--creation Location(dateLocation,heureLocation, idVehicule, cbAbonne, nomStation)
insert into Location values(TO_DATE('2016-11-19', 'yyyy/mm/dd'),22, 3, 0, 'station1');
insert into Location values(TO_DATE('2016-11-18', 'yyyy/mm/dd'),3, 4, 1, 'station2');
insert into Location values(TO_DATE('2016-11-18', 'yyyy/mm/dd'),3, 5, 2, 'station3');
insert into Location values(TO_DATE('2016-11-21', 'yyyy/mm/dd'),21, 5, 2, 'station1');


--creation Retour(dateR,heureR, nomStation, dateLocation,heureLocation, idVehicule)
insert into Retour values(TO_DATE('2016-11-20', 'yyyy/mm/dd'),4, 'station1', TO_DATE('2016-11-19', 'yyyy/mm/dd'),22,3);
insert into Retour values(TO_DATE('2016-11-20', 'yyyy/mm/dd'),4, 'station1', TO_DATE('2016-11-18', 'yyyy/mm/dd'),3, 4);
insert into Retour values(TO_DATE('2016-11-21', 'yyyy/mm/dd'),4, 'station1', TO_DATE('2016-11-18', 'yyyy/mm/dd'),3, 5);
insert into Retour values(TO_DATE('2016-11-22', 'yyyy/mm/dd'),22, 'station1', TO_DATE('2016-11-21', 'yyyy/mm/dd'),21,5);



--creation Garer(nomStation, idVehicule)
insert into Garer values('station1', 0);
insert into Garer values('station2', 1);
insert into Garer values('station3', 2);
insert into Garer values('station4', 3);
insert into Garer values('station2', 4);
insert into Garer values('station4', 5);
insert into Garer values('station1', 6);
insert into Garer values('station2', 7);
insert into Garer values('station2', 8);
insert into Garer values('station2', 9);
insert into Garer values('station1', 10);
insert into Garer values('station1', 11);
insert into Garer values('station3', 12);
insert into Garer values('station3', 13);
insert into Garer values('station1', 14);
insert into Garer values('station1', 15);
insert into Garer values('station1', 16);
insert into Garer values('station3', 17);
insert into Garer values('station4', 18);
insert into Garer values('station1', 19);


--creation Dispatching(nombrePlace, nomStation, typeVehicule)
insert into Dispatching values(100, 'station1', 'velo');
insert into Dispatching values(100, 'station1', 'velo electrique');
insert into Dispatching values(100, 'station1', 'voiture electrique');
insert into Dispatching values(100, 'station1', 'voiture essence');
insert into Dispatching values(100, 'station1', 'velo remorque');
insert into Dispatching values(100, 'station1', 'utilitaire');
insert into Dispatching values(100, 'station2', 'velo electrique');
insert into Dispatching values(100, 'station2', 'voiture electrique');
insert into Dispatching values(100, 'station2', 'voiture essence');
insert into Dispatching values(100, 'station2', 'velo remorque');
insert into Dispatching values(100, 'station2', 'utilitaire');
insert into Dispatching values(100, 'station3', 'velo electrique');
insert into Dispatching values(100, 'station3', 'voiture electrique');
insert into Dispatching values(100, 'station3', 'voiture essence');
insert into Dispatching values(100, 'station3', 'velo remorque');
insert into Dispatching values(100, 'station3', 'utilitaire');
insert into Dispatching values(100, 'station4', 'velo electrique');
insert into Dispatching values(100, 'station4', 'voiture electrique');
insert into Dispatching values(100, 'station4', 'voiture essence');
insert into Dispatching values(100, 'station4', 'velo remorque');
insert into Dispatching values(100, 'station4', 'utilitaire');
insert into Dispatching values(100, 'station5', 'velo electrique');
insert into Dispatching values(100, 'station5', 'voiture electrique');
insert into Dispatching values(100, 'station5', 'voiture essence');
insert into Dispatching values(100, 'station5', 'velo remorque');
insert into Dispatching values(100, 'station5', 'utilitaire');

insert into Dispatching values(100, 'station6', 'velo electrique');
insert into Dispatching values(100, 'station6', 'voiture electrique');
insert into Dispatching values(100, 'station6', 'voiture essence');
insert into Dispatching values(100, 'station6', 'velo remorque');
insert into Dispatching values(100, 'station6', 'utilitaire');



--creation ForfaitCentraling(cbAbonne, typeVehicule, idForfait)
insert into ForfaitCentraling values(0, 'velo', 0);
insert into ForfaitCentraling values(0, 'voiture electrique', 1);
insert into ForfaitCentraling values(1, 'velo remorque', 1);
insert into ForfaitCentraling values(1, 'utilitaire', 1);
insert into ForfaitCentraling values(2, 'velo', 2);
insert into ForfaitCentraling values(3, 'velo', 3);
insert into ForfaitCentraling values(4, 'voiture essence', 4);
insert into ForfaitCentraling values(5, 'velo', 5);
insert into ForfaitCentraling values(6, 'voiture essence', 4);
insert into ForfaitCentraling values(7, 'velo', 1);
insert into ForfaitCentraling values(8, 'velo electrique', 2);
insert into ForfaitCentraling values(9, 'velo', 1);
