

Consultas basicas . 

Select * from cenlineadecredito where fifolio=
**Valida en que estatus se encuentra la linea de crédito.* 

---------------------------------------------------------------

Select * from TACRBITACORALCR  where fifolio= 
**Valida el historial de todos los bloqueos que ha tenido la linea de credito.** 

-----------------------------------------------------------------------

select * from CREDLineaDeCredito where fifolio=
**Valida la información registrada de la capacidad de la linea de credito y si se tiene activo de bloqueo por legal, RMD, Listas negras, localización**

--------------------------------------------------------------------------

select * from baztarjetatcdgx where fifoliog = 
***Valida todas las tarjetas vinculadas con el cliente.***

----------------------------------------------------------------------------

select * from baztarjetatcdgx where fcNumeroTarjeta=
***Valida el tipo de tarjeta si es JG , el estatus de la tarjeta (Entregada / rechazada) y si esta vinculada con el CU***

---------------------------------------------------------------------------------

select top 10 * from GDTWebServTicket where fcContenido	 like '%Aqui se ingresa numero de pedido, fecha o nombre%'
***Se valida cuando presenta inconveniente con algun ticket que no se imprimio y sacar el ID del ticket para realizar el tester***
Ya sea vincularlo por numero de pedido , fecha o nombre

-----------------------------------------------------------------------------------

Select  * from cliente where fiNgcioId = and fiNoTienda =  and fiCteId =  and fiDigitoVer = 
**Se valida la información registrada del cliente ***

----------------------------------------------------------------------------------------

La información se sacar de la cuenta que nos aparece en el numero de solicitud 8 tradicional.

0

***Se valida la información registada del cliente´.***
Se requiere de las tres consultas para sacara la información del campo fiIdPersona

-----------------------------------------------------------------------------------------

select * from  TACRBitTarjetaDeposito  where finopedido = 
***Se valida a que cuenta se le deposito. ***
-------------------------------------------------------------------------------------

DECLARE @fifolio VARCHAR(20), @fisucursal VARCHAR(20)
SET @fifolio ='4320'  
SET @fisucursal='05953'

SELECT   CONCAT(fcCteNombre, ' ', fcCteAPaterno, ' ', fcCteAMaterno )  AS 'Nombre del cliente'   
FROM CLIENTE 
WHERE  fiCteId = (SELECT fiCteId FROM CenclienteTienda WHERE fifolio = (SELECT CAST(@fifolio  AS INT)) and fisucursal = (SELECT CAST(@fisucursal AS INT)) ) AND fiDigitoVer = (SELECT fiDigitoVer FROM CenclienteTienda WHERE fifolio = (SELECT CAST(@fifolio  AS INT)) AND fisucursal = (SELECT CAST(@fisucursal AS INT)))


SELECT TAR.fcTipoTar AS 'Tipo de tarjeta', TAR.fcNumeroTarjeta AS 'Número de tarjeta', TAR.fsEstatusTar AS 'Status de tarjeta', TIPOTAR.fcNombreTarjeta AS 'Descripción'
FROM BAZTarjetaTCDGX  TAR
INNER JOIN CatBazTipoTarjeta TIPOTAR  ON TIPOTAR.fcTipoTarjeta = TAR.fcTipoTar
WHERE (fiSucursalG= @fisucursal) AND (fifoliog = @fifolio)
		 
SELECT fnMonto AS 'CDP TOR' , fnMontoTAZ AS 'LCR TOR'  FROM  TACRPagoTAZReq WHERE fiSucursal= (SELECT CAST(@fisucursal AS INT)) AND fifolio = (SELECT CAST(@fifolio  AS INT))		 
			 
SELECT fnCapacidadPago, fnCapacidadPagoDisp FROM credlineadecredito WHERE  fiSucursal= (SELECT CAST(@fisucursal AS INT)) AND fifolio = (SELECT CAST(@fifolio  AS INT))

****Valida información de la tarjeta , tipo de tarjeta , capacidad , información del cliente y tarjeta junto con el estatus ***

------------------------------------------------------------------------------------

SELECT substring(fcParametros,1,4) as Tienda, substring(fcRuta,1,17) as FechaEjecucion, substring(fcValor,1,9) as Tiempo, substring(fcdescripcion,1,10) as WS FROM CatTipoAccionRev where fcdescripcion like 'ws_%' order by fcdescripcion
 ***Se valida la fecha, hora y estación de trabajo en donde se realizo la revisión de intregridad**

------------------------------------------------------------------------------------
 
 DECLARE @SOLICITUD VARCHAR(20)

SET @SOLICITUD = 'aqui se ingresa el numero de solicitud'

SELECT 'DATOS DE LA SOLICITUD'
SELECT fiSolicitudId,fiTipoSolicitud,fiStat,fiSubStat,fiTipoAutorizacion,fnCapacidadPago FROM CREDSOLICITUD WHERE FISOLICITUDID=@SOLICITUD
SELECT 'STATUS QUE TIENE LA SOLICITUD'
SELECT CRED.fiInvestStat,CAT.fcDescripcion,CRED.fcEmpNo,CRED.fdInvestFec FROM CREDINVESTIGACION CRED,CATSTATUSINVESTIGACION CAT WHERE FISOLICITUDID=@SOLICITUD AND CRED.fiInvestStat=CAT.fiInvestStat
SELECT 'STATUS QUE LE FALTAN A LA SOLICITUD (SI ES DE CAMBACEO NO NECESITA EL STATUS 5)'
SELECT fiInvestStat,fcDescripcion from CATStatusInvestigacion where fiInvestStat not in (SELECT fiInvestStat FROM CREDINVESTIGACION WHERE FISOLICITUDID=@SOLICITUD) and fiInvestStat in(1,3,5,6,10,11,12,13,51,52,55,58,254)

***Se valida los estatus faltantes que le hace falta a la solicitud para su respectiva liberación. ****

---------------------------------------------------------------------------------------

select * from bazreversosnet where fccadena like '%M277%ULTIMOS 4 DIGITOS DE LA TARJETA%'  order by 1 desc
**Se valida el numero de folio de activación de la tarjeta , el folio se visualiza en el campo que dice FO: 

-------------------------------------------------------------------------------------------

select * from credito where finopedido = 
***Se valida los plazos y saldo pendiente de un pedido

-------------------------------------------------------------------------------------------

select * from TACRPagoTAZReq where fiFolio = 
***Se valida cuanta capacidad se esta ocupando en la TDC oro. ***

----------------------------------------------------------------------------------------------

select * from movto_caja where finotransac = (Aqui se ingresa el numero de operación que aparece en el ticket )
***Se valida si el deposisto se realizo de forma correcta ***

-------------------------------------------------------------------------------------------------

Select * from TACRMarcasSolicitud WHERE fiSolicitudId = 
***Se valida si presenta la marca de rescate la solicitud***

--------------------------------------------------------------------------------------------------

DECLARE @PAIS INT, @CANAL INT, @SUCURSAL INT, @FOLIO INT

SET @PAIS =01
SET @CANAL =01
SET @SUCURSAL =7265
SET @FOLIO = 35461

SELECT CLC.fiPais,CLC.fiCanal,CLC.fiSucursal,CLC.fiFolio,cs.fiSolicitudId,P.fiProductoId,P.fcDescripcion,T.fcCaracteristica
FROM CREDLineaDeCredito CLC
INNER JOIN CENLineaDeCredito CNC
       on CNC.fipais=clc.fipais and CNC.ficanal=clc.ficanal and CNC.fisucursal=clc.fisucursal and CNC.fifolio=clc.fifolio
inner join CREDClienteTienda cct
       on cct.fipais=clc.fipais and cct.ficanal=clc.ficanal and cct.fisucursal=clc.fisucursal and cct.fifolio=clc.fifolio
inner join CREDSolicitud cs
       on cs.fiIdTienda=cct.fiIdTienda and cs.fiIdNegocio=cct.fiIdNegocio and cs.fiIdCliente=cct.fiIdCliente 
inner join TACRCREDTipoSol T
       ON T.fiSolicitudId =cs.fiSolicitudId AND T.fitipoId = 1
LEFT JOIN TCCREDProductoScore P
       ON P.fiProductoId = T.fiProductoId 
where 
       CLC.fiPais=@PAIS
       AND CLC.fiCanal =@CANAL
       AND CLC.fiSucursal=@SUCURSAL
       AND CLC.fiFolio =@FOLIO
       AND CLC.fiStatus=0 
       AND CNC.fiStatus=1 
       and CS.fiSubStat=6  
       and cs.fiTipoSolicitud IN (8,9,10,23,40,41,42,43,46,51,53,54,57,63,71,75,82,94,95,140,141,143,144,146,147,148,154,176,156,175,108,109,110,159,180,181,182,185,186,187,188,189,190,195,201,171,172,202,203,210,211,215,216,217,218,220,222,223,227,224,234,237,245,254,251)

****Se valida el color por producto ****

-------------------------------------------------------------------------------

exec PACRLLSDiaPago pais,canal,sucursal,fifolio
**Se valida el dia de pago de una linea de credito. 

---------------------------------------------------------------------------
select * from TACRCREDCAPMAXIMAS where fifolio='3285' --capacidad activa reflejada en el SRC 
select * from TACRCAPMAXPRODUCTO where fifolio='3285'-- capacidad por producto 1 consumo 2 prestamos 3 tarjeta azteca 4 italik 5 telefonia select TOP 11 * from TCCROrigenSolLCR
**Se valida el tipo de capacidad por producto**

------------------------------------------------------------------------------

select * from credito where finopedido in ( select finopedido from pedido p inner join cenclientetienda c on p.fingcioid=c.fingcioid and p.ficteid=c.ficteid and p.fidigitover = c.fidigitover where c.fifolio=126889 and c.fisucursal=3612 and c.fipais=1 and c.ficanal=1 )
***Se valida si tiene saldo pendiente el pedido

----------------------------------------------------------------------------

SELECT TOP 500 OCR.FICSCID, OCR.FCWS, OCR.FCFECDIG, DET.FCXML 
FROM GDIOCR OCR INNER JOIN GDIOCRDET DET ON OCR.FICSCID = DET.FICSCID 
WHERE OCR.FCFECDIG BETWEEN CONVERT(VARCHAR, DATEADD(DAY, 0, GETDATE()), 112) AND CONVERT(VARCHAR, DATEADD(DAY, 1, GETDATE()), 112)
ORDER BY OCR.FICSCID DESC

*Se valida si el OCR  extrajo bien la información **.

--------------------------------------------------------------------------

select * from CREDClienteTienda where fiFolio = 
select * from credsolicitud where fiIdCliente = 
**Se valida si se tiene registro de las solicitudes**

----------------------------------------------------------------------------

SELECT ISNULL(CAST(fiPais AS VARCHAR(MAX)),'')+'-'+ISNULL(CAST(fiCanal AS VARCHAR(MAX)),'')+'-'+ISNULL(CAST(fiSucursal AS VARCHAR(MAX)),'')+'-'+ISNULL(CAST(fiFolio AS VARCHAR(MAX)),'') AS 'Cliente Único',
ISNULL(CAST(cli.fcCteNombre AS VARCHAR(MAX)),'')+' '+ISNULL(CAST(cli.fcCteAPaterno AS VARCHAR(MAX)),'')+' '+ISNULL(CAST(cli.fcCteAPaterno AS VARCHAR(MAX)),'') AS 'Cliente',
ped.fiNoPedido AS Pedido,
ped.fdPedFec 	  AS Fecha,
cred.fiTIR 		  AS 'Su FiTir es', 
uni.FcDescripcion AS Descripción,
bita.fcObservacion AS 'Se generó por'
FROM pedido AS ped 
INNER JOIN TaCrBitPedidosNDOriginacion AS bita ON ped.fiNoPedido = bita.fiNoPedido 
INNER JOIN credito AS cred ON cred.fiNoPedido = bita.fiNoPedido 
INNER JOIN CREDUnidadDeNegocio AS uni ON cred.fiTIR = uni.FiTir 
INNER JOIN cliente AS cli ON ped.fiCteId = cli.fiCteId 
INNER JOIN cenlineadecredito AS cen ON cen.fiDigitoVer = cli.fiDigitoVer AND  cli.fiCteId = cen.fiCteId 
WHERE cred.fiNoPedido = 'PEDIDO_AQUÍ'

****Se valida donde se genero el pedido***

--------------------------------------------------------------------------------

select * from credsolicitud where fisolicitudid =
**Se valida el estatus de la solicitud.**

----------------------------------------------------------------------------------

Select * from TACRMARCASSOLICITUD  where fisolicitudid= 
**Se valida donde se origino la solicitud

-----------------------------------------------------------------------------------
select * from movto_caja where fdmovfechr between '2024/08/10' and '2024/08/11'
***Se valida todas las operaciones generadas en ventanilla por fecha . ***

---------------------------------------------------
select top 10 * from TACRBitacoraITK
***** Se valida si el numero de serie es validado por Mesa de Ayuda Italika  ****

-----------------------------------------------------

declare @folio int, @sucursal int   --0101-0181-6830
set @folio =    6830   --     <--  Colocar folio
set @sucursal=  181  --       <--Colocar sucursal

Select fiPais,fiCanal,fiSucursal,fiFolio,fiSucursalGestora,fiStatus,fiCteId,fiDigitoVer from cenlineadecredito where fisucursal= @sucursal and fifolio= @folio
---FITIRES DE PEDIDOS 
Select FiTir,FcDescripcion from credunidaddenegocio where FiTir in (select FiTir from credito where finopedido in (select finopedido from pedido where fiCteId= (Select fiCteId from cenlineadecredito where fisucursal= @sucursal and fifolio= @folio) and fiDigitoVer=(Select fiDigitoVer from cenlineadecredito where fisucursal= @sucursal and fifolio= @folio)))

--pedidos recientes

SELECT TOP 3 FIT.FiTir, FIT.FcDescripcion, CRED.finopedido, PED.fdPedFec FROM PEDIDO PED 
				INNER JOIN CREDITO CRED  ON CRED.fiNoPedido = PED.fiNoPedido
				INNER JOIN CREDUnidadDeNegocio FIT ON FIT.FiTir = CRED.FiTir
WHERE fiCteId= (SELECT fiCteId FROM CENLineaDeCredito WHERE fisucursal= @sucursal and fifolio= @folio) and fiDigitoVer=(SELECT fiDigitoVer FROM CENLineaDeCredito WHERE fisucursal= @sucursal and fifolio= @folio) ORDER BY fdPedFec DESC

****Se valida todos los fitires de la cuenta 

-------------------------------------------------------

DECLARE @FOLIORMD AS VARCHAR(40);

SET @FOLIORMD = '1127044202404191613'   --  <--  Colocar folio

SELECT * FROM TACRRMD  WHERE  fcFolio = @FOLIORMD

SELECT * FROM  TACRMovimientosRMD  MOV

	INNER JOIN TACRTipoMovimientoRMD  TIPO  ON TIPO.fiTipo = MOV.fiTipo

WHERE fiRMDId = (SELECT fiRMDId FROM TACRRMD  WHERE  fcFolio = @FOLIORMD) ORDER BY fdMovimiento DESC

*** Valida la bitacora del RMD (Proceso)

Folio RMD : iMPRESIÓN DE ETIQUETAS 
-------------------------------------------------------
