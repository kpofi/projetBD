SELECT typeVehicule,SUM(
case when extract(month from Retour.DateR)=11
AND extract(year from Retour.DateR)=2016
AND extract(month from Retour.dateLocation)=11
Then (dateR -dateLocation)*24+heureR-heureLocation
when extract(month from dateLocation)=11
AND extract(year from dateLocation)=2016
then (dateR-dateLocation)*24 -extract(day from dateR)*24+24-heureLocation
when extract(month from dateR)=11
AND extract(year from dateR)=2016
then extract(day from dateR)*24-24+heureR
end)
from Retour,vehicule
Where retour.idVehicule=Vehicule.idVehicule
AND Vehicule.typeVehicule='velo electrique'
group by(typeVehicule)
;
