SELECT DISTINCT TOP 10 
	--SS.SystemCode, 
	--SS.SubSystemCode, 
	--SS.locationCode, 
	rock.*,
	loc.prob AS LocationTypeProb
FROM 
	mining.SystemRockTypeOreStats as rock
	INNER JOIN mining.LocationRockTypeStats AS loc ON rock.RockTypeCode = loc.RockTypeCode 
	--INNER JOIN mining.StarSystemLocation as SS ON rock.SystemCode = SS.SystemCode
WHERE 
	OreCode = 'GOLD' 
	--AND SS.SystemCode='STANTON'
ORDER BY rock.Prob desc, loc.Prob Desc

