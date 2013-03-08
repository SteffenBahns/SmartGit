K2
		(Wichtige Änderung für beide
			select
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
	Für alle
group by
	o.asd
count having....
into #res03
from 
	Demokunde_DWH.dbo.ads kg
	join #tmp t
		on kg.asd = t.[Kunden-Num]
where
	kg. = 0

