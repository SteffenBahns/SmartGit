LLL
		(Nur f�r K4
				null
			from 
				Demokunde_staging.dbo.[srcKunGutschein] kg 
			where 
				kgh.[Auftr-Nr]=kg.[Auftrags-num] 
		)

-- temp res03
select 
	o.Name
	,max(o.[Auftrags-Num]) as [Auftrags-Num]
into #tmp
from 
	F�r alle
group by
	Aber hier
into #res03
from 
	Demokunde_DWH.dbo.ads ads
	join #tmp t
		on kg.asd = t.[Kunden-Num]
where
	kg. = 0

