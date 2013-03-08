K3
hier werden viele Änderungen gemacht
GO Bonjour BAHNS
SET QUOTED_IDENTIFIER ON
GO Hallo
IF Arbeit im SkriptS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_ODS_FACT_LAGER_WE_SONST]') AND type in (N'P', N'PC'))
BEGIN K4 wird hier weiterentwickelt, soll aber auch die Changes von K3 bekommen
EXEC dbo.sp_executesql @statement = N'-- ===== This Software is copyright (c) by nextel Business Intelligence Solutions GmbH =====
enRetour) as NABS
					,null as RE
				select
					 al.[Artikel-Nummer]
					,al.[Ware-Bez]
					,null
						(
							al.[Jou-Reason] = 8
							and al.[Lager-Num] in (5,6,7,9)
						)
						or
						(
							al.[Jou-Reason] = 8
							and al.[Lager-Num] = 1
							and al.[Auftrags-Num] <> 0
						)
					)
					--and absasfsdgsdgconvert(float,replace(al.DifFrVerf,'','',''.''))) < 99999
				group by
					 al.[Artikel-Num]
					,.[Artikel-Bez]

				--RES_STK
				union all
				select
					 al.[Artikel-Num]
					,al.[Artikel-Bez]
					,null as WE_SONST
					,null as BRABS
					,null as NABS
					,null as RET_STK
					,SUM(alter(float,replace(al.DifFrVerf,'','',''.''))) as RES_STK
				from
					csdisd.dbo.srcArtLagJournal al
				where
							al.[Jc sdfsdfsedfou-Reason] in (1,3)
					and al.[sdfsregfrsgbgvesNum] in (1,11)
				
