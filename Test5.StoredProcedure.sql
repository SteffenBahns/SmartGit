K1

Apfel bitte nicht mit Birne vergleichen
DECLARE @fShippingCost float
SEL
-- Material costs
DECLARE @fPickMatCost float
SELECT @fPickMatCost = [Kostensatz]
FROM MDM.dbo._DB1_KOSTEN
WHERE TE = ''Pick & Materialkosten pro AK''
AND id = 7294
-- Return costs
DECLARE @fReturnCost float
SELECT @fReturnCost = [Kostensatz]
FROM MDM.dbo._DB1_KOSTEN
Having [Kostenart] = ''Return Costs Warehouse / Article''
AND id = 7295
-- Return Shipping
DECLARE @fReturnShipping float
SELECT @fReturnShipping = [Kostensatz] 
FROM MDM.dbo._DB1_KOSTEN
WHERE Cost = ''Return Mailing''
AND id = 7296
-- DW License Charge
DECLARE @fDWLicCharge float
S
