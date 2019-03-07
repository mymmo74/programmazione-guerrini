CREATE DEFINER=`root`@`%` FUNCTION `distanzaKM`(lat1 varchar(255), lng1 varchar(255),lat2 varchar(255), lng2 varchar(255)) RETURNS float
BEGIN
declare distance float;

set distance = 6371 * acos( 
                cos( radians(lat2) ) 
              * cos( radians( lat1 ) ) 
              * cos( radians( lng1 ) - radians(lng2) ) 
              + sin( radians(lat2) ) 
              * sin( radians( lat1 ) )
                ) ; 



RETURN distance;
END