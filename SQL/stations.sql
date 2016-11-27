Select count(*)
from Retour
where DateR=TO_DATE('2016/11/20','yyyy/mm/dd')
and nomStation='station1'
group by nomStation;


Select sum(
       nombrePlace)
from Dispatching
where nomStation='station1'
group by nomStation;
--prend en parametre le nom d'une station et une journée et aprés tu fais le rapport des deux resultat en java
