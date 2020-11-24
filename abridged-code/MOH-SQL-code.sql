--Service users/AoD service users
SELECT year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year,
count (DISTINCT IDI_Clean_20181020.snz_moh_uid) AS 'Service Users',
count (DISTINCT (case when (IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_team_type_code in ('03', '11') or 
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code in ('T16', 'T17', 'T18', 'T19', 'T20','T48')) then IDI_Clean_20181020.snz_moh_uid else NULL end)) AS 'AoD Service Users'
FROM
IDI_Clean_20181020.moh_clean.PRIMHD
WHERE
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code != 'T35'
GROUP BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date);

--Service users by snz_moh_uid
SELECT year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year,
IDI_Clean_20181020.moh_clean.PRIMHD.snz_moh_uid
FROM
IDI_Clean_20181020.moh_clean.PRIMHD
WHERE
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code != 'T35'
GROUP BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date),
IDI_Clean_20181020.moh_clean.PRIMHD.snz_moh_uid
ORDER BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date)

--Service users by DHB/non-DHB
SELECT  year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year ,
case when [IDI_Metadata].[clean_read_CLASSIFICATIONS].[moh_primhd_organisation_code].[ORGANISATION_TYPE] = 'District Health Board (DHB)' then 'DHB'
else 'non-DHB' end 'Organisation type',
count (distinct IDI_Clean_20181020.moh_clean.PRIMHD.snz_moh_uid) 'Count of service users'
FROM
IDI_Clean_20181020.moh_clean.PRIMHD
INNER JOIN IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code on
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_organisation_id_code = IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code.ORGANISATION_ID

WHERE
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code != 'T35'
GROUP BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date),
case when [IDI_Metadata].[clean_read_CLASSIFICATIONS].[moh_primhd_organisation_code].[ORGANISATION_TYPE] = 'District Health Board (DHB)' then 'DHB'
else 'non-DHB' end

ORDER BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date)

--Face to face service users (clients seen)
--Clients seen/AoD clients seen
SELECT year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year,
count (distinct IDI_Clean_20181020.moh_clean.PRIMHD.snz_moh_uid) AS 'Clients Seen',
count ( distinct case when (IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_team_type_code in ('03', '11') or 
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code in ('T16', 'T17', 'T18', 'T19', 'T20','T48')) then 
(IDI_Clean_20181020.moh_clean.PRIMHD.snz_moh_uid) else NULL end) AS 'AoD_Clients_Seen'
FROM
IDI_Clean_20181020.moh_clean.PRIMHD
WHERE
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code not in ('T35','T32','T33','T37','T08')
AND IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_setting_code not in ('WR','PH','SM','OM')
GROUP BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date);

--Clients seen by snz_uid
SELECT year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year ,
IDI_Clean_20181020.moh_clean.PRIMHD.snz_moh_uid
FROM
IDI_Clean_20181020.moh_clean.PRIMHD
WHERE
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code != 'T35'
GROUP BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date),
IDI_Clean_20181020.moh_clean.PRIMHD.snz_moh_uid

--Clients seen by DHB/non-DHB
SELECT year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year,
case when IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code.ORGANISATION_TYPE  = 'District Health Board (DHB)'then 'DHB' 
else 'non-DHB' end 'Organisation type',
count (DISTINCT snz_moh_uid) AS 'Clients seen'
FROM
IDI_Clean_20181020.moh_clean.PRIMHD
INNER JOIN IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code on
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_organisation_id_code = IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code.ORGANISATION_ID
WHERE 
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code not in ('T35','T32','T33','T37', 'T08')
AND IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_setting_code not in ('WR','PH','SM','OM')
GROUP BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date),
case when IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code.ORGANISATION_TYPE = 'District Health Board (DHB)'then 'DHB' 
else 'non-DHB' end
ORDER BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date )

--Contacts
--AoD Contacts/all contacts
SELECT 
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year,
sum (case when (IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_team_type_code in ('03', '11') or 
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code in ('T16', 'T17', 'T18', 'T19', 'T20','T48'))	 
then IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_count_nbr else NULL end) AS 'AoD Contacts',
sum(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_count_nbr) 'All Contacts'
FROM
IDI_Clean_20181020.moh_clean.PRIMHD
WHERE
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code != 'T35' 
AND
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_type_text = 'CON'
GROUP BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date)
ORDER BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date)

--All face to face contacts/AoD face to face contacts
SELECT year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year,
sum (IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_count_nbr) AS 'All F2F contacts',
sum (case when (IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_team_type_code in ('03', '11') or 
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code in ('T16', 'T17', 'T18', 'T19', 'T20','T48')) then 
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_count_nbr else NULL end) AS 'AoD F2F Contacts'

FROM
IDI_Clean_20181020.moh_clean.PRIMHD
WHERE
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code not in ('T35','T32','T33','T37', 'T08')
AND IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_setting_code not in ('WR','PH','SM','OM')
and IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_type_text = 'CON'
GROUP BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date);

--People with face to face contacts (snz_uid)
SELECT distinct(snz_moh_uid),
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year
FROM
IDI_Clean_20181020.moh_clean.PRIMHD
WHERE
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code not in ('T35','T32','T33','T37', 'T08')
AND IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_setting_code not in ('WR','PH','SM','OM')
AND IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_type_text = 'CON'
ORDER BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date);

--People with face to face contacts by DHB/non-DHB
SELECT year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year,
case when IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code.ORGANISATION_NAME LIKE '%District Health Board%' then 'DHB' else 'non-DHB' end 'Organisation type',
count (DISTINCT snz_moh_uid) AS 'Service users face to face contacts'
FROM
IDI_Clean_20181020.moh_clean.PRIMHD
INNER JOIN IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code on
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_organisation_id_code = IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code.ORGANISATION_ID
WHERE
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code not in  ('T35','T32','T33','T37', 'T08')
AND IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_setting_code not in ('WR','PH','SM','OM')
AND IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_type_text = 'CON'
GROUP BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date),
case when IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code.ORGANISATION_NAME LIKE '%District Health Board%' then 'DHB' else 'non-DHB' end
ORDER BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date)

--Bednights
Sum of bednights/AoD bednights
SELECT 
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year,
sum (case when (IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_team_type_code in ('03', '11') or 
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code in ('T16', 'T17', 'T18', 'T19', 'T20','T48'))
then IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_count_nbr else NULL end) AS 'AoD_Bed_Nights',
sum(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_count_nbr) 'All Bed Nights'
FROM
IDI_Clean_20181020.moh_clean.PRIMHD 
WHERE
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_type_text = 'BED'
GROUP BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date)
ORDER BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date);

--Bednights by snz_moh_uid
SELECT 
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year,
IDI_Clean_20181020.moh_clean.PRIMHD.snz_moh_uid,
sum(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_count_nbr) 'Bed Nights'
FROM
IDI_Clean_20181020.moh_clean.PRIMHD 
WHERE
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code != 'T35' 
AND
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_type_text = 'BED'
GROUP BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date),
IDI_Clean_20181020.moh_clean.PRIMHD.snz_moh_uid
ORDER BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date)

--Bednights by DHB/non-DHB
SELECT 
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date) AS Year,
case when IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code.ORGANISATION_NAME LIKE '%District Health Board%' then 'DHB' else 'non-DHB' end 'Organisation type',
sum(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_count_nbr) 'Bed Nights'
FROM
IDI_Clean_20181020.moh_clean.PRIMHD
INNER JOIN IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code on
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_organisation_id_code = IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code.ORGANISATION_ID
WHERE
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_type_code != 'T35' 
AND
IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_unit_type_text = 'BED'
GROUP BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date),
case when IDI_Metadata.clean_read_CLASSIFICATIONS.moh_primhd_organisation_code.ORGANISATION_NAME LIKE '%District Health Board%' then 'DHB' else 'non-DHB' end
ORDER BY
year(IDI_Clean_20181020.moh_clean.PRIMHD.moh_mhd_activity_start_date)
