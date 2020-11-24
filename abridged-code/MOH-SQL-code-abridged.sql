/*
This is an abridged version of the MOH-SQL-code.sql script.
Unlike the MOH-SQL-code.sql script, this script will not run in the IDI.

The only reason it will not run is because I shortened some of the column names
and table names.

I have also introduced aliases in a few places to make the code more succinct.
*/

--Service users/AoD service users
SELECT year(activity_start_date) AS Year,
       count (DISTINCT snz_moh_uid) AS 'Service Users',
       count ( DISTINCT (
           case 
           when (team_type_code in ('03', '11') or 
             activity_type_code in ('T16', 'T17', 'T18', 'T19', 'T20','T48')) 
           then snz_moh_uid else NULL end)) AS 'AoD Service Users'
FROM Moh_clean.PRIMHD
WHERE activity_type_code != 'T35'
GROUP BY year(activity_start_date);

--Service users by snz_moh_uid
SELECT year(activity_start_date) AS Year, snz_moh_uid
FROM Moh_clean.Primhd 
WHERE activity_type_code != 'T35'
GROUP BY year(activity_start_date), snz_moh_uid
ORDER BY year(activity_start_date);

--Service users by DHB/non-DHB
SELECT year(P.activity_start_date) AS Year ,
      CASE when M.organisation_type = 'District Health Board (DHB)' then 'DHB'
      else 'non-DHB' end 'Organisation type',
count (distinct P.snz_moh_uid) 'Count of service users'
FROM IDI_Clean_20181020.Moh_clean.Primhd P
JOIN IDI_Metadata.Classifications.Organisation_code M 
ON P.organisation_id_code = M.organisation_id
WHERE P.activity_type_code != 'T35'
GROUP BY year(P.activity_start_date),
    CASE when M.organisation_type = 'District Health Board (DHB)' then 'DHB'
    else 'non-DHB' end
ORDER BY year(P.activity_start_date);