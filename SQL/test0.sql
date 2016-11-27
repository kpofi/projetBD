insert into Station values('Station Hercule','31 rue de palmier 38440') ;
insert into Station values('Station la Liberté','162 av de la Liberté');
insert into Station values('Station les Jasmins','241 rue des Jardins');
insert into Station values('Station Deadshot’,’25 av Suicide Squad');
insert into Station values('Station Joker’,’2 av Batman');

insert into TypeVehicule values('velo' , 8760,10, 200);
insert into TypeVehicule values('velo electrique', 2160, 50, 400);
insert into TypeVehicule values('velo remorque', 1440, 500);
insert into TypeVehicule values('voiture electrique', 24, 200, 1000);
insert into TypeVehicule values('utilitaire',24, 500, 1200);

insert into Abonnees values(001, 'KEDA', 'Pofinet',TO_DATE('2010/11/14', 'yyyy/mm/dd'), 1);
insert into Abonnees values(002, 'ELIDRISSI', 'Mehdi',TO_DATE('1995/12/13', 'yyyy/mm/dd'), 1);
insert into Abonnees values(003, '16', 'Louis',TO_DATE('1995/20/14', 'yyyy/mm/dd'), 1);
insert into Abonnees values(004, 'LAPOINTE', 'Quentin',TO_DATE('1998/07/02', 'yyyy/mm/dd'), 1);
insert into Abonnees values(005, 'BARTIER', 'Valentin',TO_DATE('1975/09/17', 'yyyy/mm/dd'),0);
insert into Abonnees values(007, 'BEN DOUDOU', 'Myriam',TO_DATE('1985/08/30', 'yyyy/mm/dd'), 0);
insert into Abonnees values(009, 'BOBO', 'Johny',TO_DATE('1984/11/20', 'yyyy/mm/dd'), 0);
insert into Abonnees values(010, 'PICARD', 'Tom',TO_DATE('2009/03/13', 'yyyy/mm/dd'), 1);

insert into Forfait values(001, 200);
insert into Forfait values(002, 300);
insert into Forfait values(003, 200);
insert into Forfait values(004, 300);
insert into Forfait values(005, 400);
insert into Forfait values(006, 500);
insert into Forfait values(007, 200);
insert into Forfait values(008, 300);
insert into Forfait values(009, 200);
insert into Forfait values(010, 300);

--creation ForfaitLocation(idForfait, nbLocationMax)

insert into ForfaitLocation values(001, 10);
insert into ForfaitLocation values(002, 5);
insert into ForfaitLocation values(003, 7);
insert into ForfaitLocation values(004, 7);
insert into ForfaitLocation values(005, 7);

--creation ForfaitDuree(idForfait, dureeForfait, dateForfaitDebut)
insert into ForfaitDuree values(007,3600 , TO_DATE('2016-09-01', 'yyyy/mm/dd'));-
insert into ForfaitDuree values(008, 240, TO_DATE('2016-10-18', 'yyyy/mm/dd'));
insert into ForfaitDuree values(009, 8750, TO_DATE('2016-10-20', 'yyyy/mm/dd'));
insert into ForfaitDuree values(006,720, TO_DATE('2016-05-20', 'yyyy/mm/dd'));
insert into ForfaitDuree values(010, 380, TO_DATE('2016-11-10', 'yyyy/mm/dd'));



insert into Vehicule values(001, 1, 'velo');
insert into Vehicule values(002, 1, 'velo');
insert into Vehicule values(003, 1, 'velo');
insert into Vehicule values(004, 1, 'velo electrique');
insert into Vehicule values(005, 1, 'velo electrique');
insert into Vehicule values(006, 1, 'velo electrique');
insert into Vehicule values(007, 1, 'velo remorque');
insert into Vehicule values(008, 1, 'velo remorque');
insert into Vehicule values(009, 1, 'velo remorque');
insert into Vehicule values(010, 2, 'utilitaire');
insert into Vehicule values(011, 2, 'utilitaire');
insert into Vehicule values(012, 4, 'utilitaire');
insert into Vehicule values(013, 4, 'voiture electrique');
insert into Vehicule values(014, 4, 'voiture electrique');
insert into Vehicule values(015, 4, 'voiture electrique');

--creation Garer(nomStation, idVehicule)
insert into Garer values('Station Hercule', 001);
insert into Garer values('Station la Liberté', 002);
insert into Garer values('Station les Jasmins', 003);
insert into Garer values('Station la Liberté', 004);
insert into Garer values('Station Deadshot', 005);
insert into Garer values('Station Hercule', 006);
insert into Garer values('Station la Liberté', 007);
insert into Garer values('Station les Jasmins', 008);
insert into Garer values('Station Deadshot', 009);
insert into Garer values('Station Joker', 010);
insert into Garer values('Station Hercule', 011);
insert into Garer values('Station la Liberté', 012);
insert into Garer values('Station les Jasmins', 013);
insert into Garer values('Station Deadshot', 014);
insert into Garer values('Station Joker', 015);

insert into Dispatching values(10, 'Station Hercule', 'velo electrique');
insert into Dispatching values(10, 'Station Hercule', 'voiture electrique');
insert into Dispatching values(10, 'Station Hercule', 'velo remorque');
insert into Dispatching values(10, 'Station Hercule', 'utilitaire');
insert into Dispatching values(10, 'Station Hercule', 'velo ');
insert into Dispatching values(10, 'Station la Liberté', 'voiture electrique');
insert into Dispatching values(10, 'Station la Liberté', 'velo remorque');
insert into Dispatching values(10, 'Station la Liberté', 'utilitaire');
insert into Dispatching values(10, 'Station la Liberté', 'velo electrique');
insert into Dispatching values(10, 'Station la Liberté', 'velo ');

insert into Dispatching values(10, 'Station les Jasmins', 'velo electrique');
insert into Dispatching values(10, 'Station les Jasmins', 'voiture electrique');
insert into Dispatching values(10, 'Station les Jasmins', 'velo remorque');
insert into Dispatching values(10, 'Station les Jasmins', 'utilitaire');
insert into Dispatching values(10, 'Station les Jasmins', 'velo ');
insert into Dispatching values(10, 'Station Deadshot', 'voiture electrique');
insert into Dispatching values(10, 'Station Deadshot', 'velo remorque');
insert into Dispatching values(10, 'Station Deadshot', 'utilitaire');
insert into Dispatching values(10, 'Station Deadshot', 'velo electrique');
insert into Dispatching values(10, 'Station Deadshot' , 'velo ');
insert into Dispatching values(10, 'Station Joker', 'voiture electrique');
insert into Dispatching values(10, 'Station Joker', 'velo remorque');
insert into Dispatching values(10, 'Station Joker', 'utilitaire');
insert into Dispatching values(10, 'Station Joker', 'velo electrique');
insert into Dispatching values(10, 'Station Joker', 'velo ');

insert into ForfaitCentraling values(001, 'voiture electrique', 001);
insert into ForfaitCentraling values(002, 'velo remorque', 002);
insert into ForfaitCentraling values(003, 'utilitaire', 003);
insert into ForfaitCentraling values(004, 'velo', 004);
insert into ForfaitCentraling values(005, 'velo electrique', 005);
insert into ForfaitCentraling values(006, 'voiture electrique' , 006);
insert into ForfaitCentraling values(007, 'velo remorque', 007);
insert into ForfaitCentraling values(008, 'utilitaire', 008);
insert into ForfaitCentraling values(009, 'velo' , 009);
insert into ForfaitCentraling values(010, 'velo electrique', 010);  






insert into Location values(TO_DATE('2016-06-19', 'yyyy/mm/dd'),12, 006,005, 'Station Hercule');
Delete from Garer where nomStation like 'Station Hercule' and idVehicule=006;
insert into Retour values(TO_DATE('2016-06-20', 'yyyy/mm/dd'),12, 'Station la Liberté', TO_DATE('2016-06-19', 'yyyy/mm/dd'),12,005);
insert into Garer values('Station la Liberté', 006);
insert into Location values(TO_DATE('2016-09-02', 'yyyy/mm/dd'),12, 005,005, 'Station Deadshot');
Delete from Garer where nomStation like 'Station Deadshot' and idVehicule=005;
insert into Retour values(TO_DATE('2016-09-08', 'yyyy/mm/dd'),12, 'Station la Liberté', TO_DATE('2016-06-19', 'yyyy/mm/dd'),12,006);
insert into Garer values('Station la Liberté', 005);
insert into Location values(TO_DATE('2016-10-31', 'yyyy/mm/dd'),12, 004,005, 'Station la Libeté');
Delete from Garer where nomStation='Station la Libetré' and idVehicule=004;
insert into Retour values(TO_DATE('2016-11-11', 'yyyy/mm/dd'),12, 'Station la Liberté', TO_DATE('2016-06-19', 'yyyy/mm/dd'),12,004);
insert into Garer values('Station la Liberté', 004);
insert into Location values(TO_DATE('2016-10-19', 'yyyy/mm/dd'),12, 006,005, 'Station la Liberté');
Delete from Garer where nomStation like 'Station la Liberté' and idVehicule=006;
insert into Retour values(TO_DATE('2016-06-20', 'yyyy/mm/dd'),12, 'Station la Liberté', TO_DATE('2016-06-19', 'yyyy/mm/dd'),12,006);
insert into Garer values('Station la Liberté', 006);
 
insert into Location values(TO_DATE('2016-06-19', 'yyyy/mm/dd'),12, 007,002, 'Station la Liberté');
Delete from Garer where nomStation like 'Station la Liberté' and idVehicule=007;
insert into Retour values(TO_DATE('2016-06-20', 'yyyy/mm/dd'),12, 'Station Joker', TO_DATE('2016-06-19', 'yyyy/mm/dd'),12,007);
insert into Garer values('Station Joker', 007);
insert into Location values(TO_DATE('2016-09-19', 'yyyy/mm/dd'),12, 008,002, 'Station les Jasmins');
Delete from Garer where nomStation like 'Station les Jasmins' and idVehicule=008;
insert into Retour values(TO_DATE('2016-09-23', 'yyyy/mm/dd'),10, 'Station Joker', TO_DATE('2016-09-19', 'yyyy/mm/dd'),12,008);
insert into Garer values('Station Joker', 008);
insert into Location values(TO_DATE('2016-10-19', 'yyyy/mm/dd'),12, 009,002, 'Station Deadshot');
Delete from Garer where nomStation like 'Station Deadshot' and idVehicule=009;
insert into Retour values(TO_DATE('2016-10-21', 'yyyy/mm/dd'),10, 'Station Joker', TO_DATE('2016-10-19', 'yyyy/mm/dd'),12,009);
insert into Garer values('Station Joker', 009);
insert into Location values(TO_DATE('2016-09-19', 'yyyy/mm/dd'),12, 010,003, 'Station Joker');
Delete from Garer where nomStation like 'Station Joker' and idVehicule=010;
insert into Retour values(TO_DATE('2016-09-23', 'yyyy/mm/dd'),10, 'Station Hercule', TO_DATE('2016-09-19', 'yyyy/mm/dd'),12,010);
insert into Garer values('Station Hercule', 010);
insert into Location values(TO_DATE('2016-09-19', 'yyyy/mm/dd'),12, 001,004, 'Station Hercule');
Delete from Garer where nomStation like 'Station Joker' and idVehicule=001;
insert into Retour values(TO_DATE('2016-09-29', 'yyyy/mm/dd'),10, 'Station Hercule', TO_DATE('2016-09-19', 'yyyy/mm/dd'),12,001);
insert into Garer values('Station Hercule', 001);
insert into Location values(TO_DATE('2016-09-19', 'yyyy/mm/dd'),12, 015,001, 'Station Joker');
Delete from Garer where nomStation like 'Station Joker' and idVehicule=015;
insert into Retour values(TO_DATE('2016-09-23', 'yyyy/mm/dd'),10, 'Station Deadshot', TO_DATE('2016-09-19', 'yyyy/mm/dd'),12,015);
insert into Garer values('Station Deadshot', 015);
insert into Location values(TO_DATE('2016-09-01', 'yyyy/mm/dd'),12, 014,006, 'Station Deadshot');
Delete from Garer where nomStation like 'Station Deadshot' and idVehicule=014;
insert into Retour values(TO_DATE('2016-09-05', 'yyyy/mm/dd'),10, 'Station Hercule', TO_DATE('2016-09-01', 'yyyy/mm/dd'),12,014);
insert into Garer values('Station Hercule', 014);
insert into Location values(TO_DATE('2016-09-01', 'yyyy/mm/dd'),12, 008,007, 'Station Jasmins');
Delete from Garer where nomStation like 'Station Jasmins' and idVehicule=008;
insert into Retour values(TO_DATE('2016-09-05', 'yyyy/mm/dd'),10, 'Station Jasmins', TO_DATE('2016-09-01', 'yyyy/mm/dd'),12,008);
insert into Garer values('Station Jasmins', 008);
insert into Location values(TO_DATE('2016-10-19', 'yyyy/mm/dd'),12, 011,008, 'Station Hercule');
Delete from Garer where nomStation like 'Station Hercule' and idVehicule=011;
insert into Retour values(TO_DATE('2016-10-23', 'yyyy/mm/dd'),10, 'Station Hercule', TO_DATE('2016-10-19', 'yyyy/mm/dd'),12,010);
insert into Garer values('Station Hercule', 011);
insert into Location values(TO_DATE('2016-10-21', 'yyyy/mm/dd'),12,002,009, 'Station la Liberté');
Delete from Garer where nomStation like 'Station la Liberté' and idVehicule=002;
insert into Retour values(TO_DATE('2016-10-23', 'yyyy/mm/dd'),10, 'Station Joker', TO_DATE('2016-10-21', 'yyyy/mm/dd'),12,002);
insert into Garer values('Station Joker', 002);
insert into Location values(TO_DATE('2016-11-15', 'yyyy/mm/dd'),12,003,009, 'Station les Jasmins');
Delete from Garer where nomStation like 'Station les jasmins' and idVehicule=003;
insert into Location values(TO_DATE('2016-11-12', 'yyyy/mm/dd'),12,004,010, 'Station la Liberté');
Delete from Garer where nomStation like 'Station la Liberté' and idVehicule=004;
insert into Retour values(TO_DATE('2016-11-16', 'yyyy/mm/dd'),10, 'Station Joker', TO_DATE('2016-11-12', 'yyyy/mm/dd'),12,004);
insert into Garer values('Station Joker', 004);
