SELECT prixTypeVehicule
FROM  Location,Vehicule,TypeVehicule 
WHERE Vehicule.typeVehicule=TypeVehicule.typeVehicule
AND Location.idVehicule=3
AND Location.idVehicule=Vehicule.idVehicule
AND Location.dateLocation=TO_DATE('2016/11/18','yyyy/mm/dd')
AND Location.heureLocation=3;

SELECT Retour.DateR
FROM  Location,Retour
WHERE Location.idVehicule=Retour.idVehicule 
AND Location.dateLocation=Retour.dateLocation                                   
AND Location.heureLocation=Retour.heureLocation
AND Location.dateLocation=TO_DATE('2016/11/18','yyyy/mm/dd')
AND Location.idVehicule=3 
AND Location.heureLocation=3;

SELECT Retour.HeureR
FROM Location,Retour
WHERE Location.idVehicule=Retour.idVehicule
AND Location.dateLocation=Retour.DateLocation
AND Location.heureLocation=Retour.heureLocation
AND Location.dateLocation=TO_DATE('2016/11/18','yyyy/mm/dd')                   
AND Location.idVehicule=3
AND Location.heureLocation=3;

SELECT Abonnees.reduction
FROM Location,Abonnees
WHERE Location.cbAbonne=Abonnees.cbAbonne
AND Location.dateLocation=TO_DATE('2016/11/18','yyyy/mm/dd')
AND Location.idVehicule=3
AND Location.heureLocation=3;

--on calcule (prixVehicule)*((dateR-dateLocation)*24+HeureR-HeureLocation)(1-0.25*Reduction)
