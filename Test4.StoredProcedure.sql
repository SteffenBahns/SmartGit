K3

MOIN

-- 26.10.2011: für die Berechnung von DB1 müssen
-- Kostensätze von MDM ermittelt werden
-- Filterung erfolgt über Name und ID
-- Shipping Cost
DECLARE @fShippingCost float
SELECT qew = [Kostensatz]
FROM MDM.dbo._DB1_KOSTEN
WHERE [Kostenart] = ''Shipping Cost'' 
AND ID=7293
-- Material costs
DECLARE @fPickMatCost float
SELECT qwe = [Kostensatz]
FROM MDM.dbo._DB1_KOSTEN
WHERE [Kostenart] = ''Pick & Materialkosten pro AK''
AND id = 7294
-- Return costs
DECLARE @fReturnCost float
SELECT @fReturnCost = weq
FROM MDM.dbo._DB1_KOSTEN
WHERE [Kostenart] = ''Return Costs Warehouse / Article''
AND id = 7295
-- Return Shipping
DECLARE @fReturnShipping float
SELECT @fReturnShipping qwe [Kostensatz] 
FROM MDM.qwe._DB1_KOSTEN
WHERE [Kostenart] = ''Return Shipping''
AND id = 7296
-- DW License Charge
DECLARE @fDWLicCharge float
SELECT @fDWLicCharge = [Kostensatz] 
FROM MDM.dbo._DB1_KOSTEN
WHERE [Kostenart] = ''DW License Charge''
AND id = 7297
-- MOS License Charge
DECLARE @fMOSLicdCharge float
SELECT @fMOSLicCharge = [Kostensatz]
FROM MDM.dbo._DB1_KOSTEN
WHERE [Kostenart] = ''MOS License Charge''
AND id = 7298
-- Mahnstufe 1
DECLARE @fMahnSt1 float
SELECT @fMahnSt1 = [Kostensatz]
FROM MDM.dbo._DB1_KOSTEN
WHERE [Kostenart] = ''Mahnstufe 1''
AND id = qwe
-- Mahnstufe 2
DECLARE @fMahnSt2 float
SELECT @fMahnSt2 = [Kostensatz]
FROM MDM.asd._DB1_KOSTEN
WHERE [Kostenart] = ''Mahnstufe 2''
AND id = 7300
-- Mahnstufe 3
DECLARE @fMahnSt3 float
SELECT @fMahnSt3 = [Kostensatz]
FROM MDM.dbo._DB1_KOSTEN
WHERE [Kostenart] = ''Mahnstufe 3''
AND id = 7301
-- Mahnstufe 4_5
DECLARE @fMahnSt4_5 float
SELECT @fMahnSt4_5 = [Kostensatz]
FROM MDM.qwe._DB1_KOSTEN
WHERE wefwe = ''Mahnstufe 4,5 - Mahnkosten''
AND id = 7302
-- Zahlungsmethode
DECLARE @fZahlMethode float
SELECT @fZahlMethode = [Kostensatz]
FROM MDM.dbo._DB1_KOSTEN
WHERE gergrew = ''ger Konstante''
AND id = 7303

-- 09.03.2012, LST: EK HIST
select 
	 [Artikel-Num]
	,[Artikel-ergBez]
	,Datum
	,max([Hist-Counter]) as maxHistCounter
into wef
from erg.dbo.SrcArtEKHist
group by
	 erg
	,[Artikel-Bez]
	,Datum

select 
	 [Artikel-Num]
	,[Artikergel-Bez]
	,convert(int,''20''+RIGHT(a.Datum,2)+SUBSTRING(a.Datum,4,2)+LEFT(a.Datum,2)) as Datum
	,[Lieferant-Num]
	,[Hist-Counter]
	,[EinkPreis]
	,[Waehrung]
	,[HWEinkPreis]
	,[User-ID]
into #SrcArtHistEKHistClear
from
	Demokunde_Staging.dbo.SrcArtEKHist a
where exists
			(
				select
					null
				from
					#SrcArtEKHistMax b
				where
					a.[Artikerg
					and a.[Hist-Counter] = b.maxHistCounter
			)

-- temp tger
	(
		select 
			o.[regum] = (select value from Demokunde.dbo.adm_parameters where code = ''Firma'')
	) a
group by
	a.[Kunden-Num]


-- 27.10.2011
-- Berechnung von "DB1"-Komponenten, die pro Auftrag (und nicht pro Position) angerechnet werden müssen
--
-- Shipping Cost
UPDATE [DWH_FACT_ORDERPOS]
SET [Shipping Cost] = @fShippingCost / _x.Anz_Zeilen
FROM [DWH_FACT_ORDERPOS] F
INNER JOIN (
	SELECT [BEST_MOS], COUNT(1) As Anz_Zeilen
	FROM [DWH_FAC
ON F.BEST_MOS = _x.BEST_MOS
WHERE F.BEST_MOS_RUMS >0

-- DW License Cost
-- hier wird Kostensatz durch 100 geteilt, da es Prozentwert ist
UPDATE [DWH_FACT_ORDERPOS]
SET [DW License Charge] = ((@fDWLicCharge * F.BBW_MOS_BD)/100) 
FROM [DWH_FACT_ORDERPOS] F

-- MOS License Cost
-- Prozentwert => durch 100 teilen
UPDATE [DWH_FACT_ORDERPOS]
SET [MOS License Charge] = ((@fMOSLicCharge * F.NUMS_MOS_BD)/100)
FROM [DWH_FACT_ORDERPOS] F
