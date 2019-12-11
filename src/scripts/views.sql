CREATE VIEW sub_saharian_view AS SELECT DISTINCT(n.iso) iso, n.country_name, s.mpi_national, cast(p."2000" as decimal)/p."1971" pop_aug_1971_2000, GREATEST(c."1998",c."1999",c."2000",c."2001",c."2002",c."2003",c."2004",c."2005",c."2006",c."2007",c."2008",c."2009",c."2010",c."2011",c."2012",c."2013",c."2014",c."2015") max_corruption_1998_2015
FROM mpi_national as n 
INNER JOIN world_population as p ON p.iso = n.iso
LEFT JOIN world_corruption as c ON c.country_name = n.country_name
INNER JOIN mpi_subnational as s ON s.iso = n.iso
WHERE s.world_region_name = 'Sub-Saharan Africa'
ORDER BY iso;
