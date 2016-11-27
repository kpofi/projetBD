SELECT Vehicule.Typevehicule,sum(
(Retour.DateR-Retour.DateLocation)*24-Retour.heureLocation+Retour.heureR) as temps
FROM Location,Vehicule,TypeVehicule,Abonnees,Retour
Where Retour.DateLocation=Location.dateLocation
AND Retour.heureLocation=Location.heureLocation
AND Retour.idVehicule=Location.idVehicule
AND Location.idVehicule=Vehicule.idVehicule
AND Vehicule.typeVehicule=TypeVehicule.typeVehicule 
And Location.cbAbonne=Abonnees.cbAbonne
AND (CURRENT_DATE-Abonnees.dateNaissance)<3650*(0+1)
AND (CURRENT_DATE-Abonnees.dateNaissance)>=3650*(0)
GROUP BY Vehicule.TypeVehicule
ORDER bY temps DESC
;
