/*
CREATE TABLE Zaposlenik(
	ZaposlenikID INT PRIMARY KEY IDENTITY(1,1) ,
	Ime nvarchar(50) NOT NULL,
	Prezime nvarchar(50) NOT NULL,
	DatumRo�enja date NOT NULL,
	DatumZaposlenja date NOT NULL,
	Pozicija nvarchar(50) NOT NULL
)



CREATE TABLE Proizvo�a�(
	Proizvo�a�ID INT PRIMARY KEY  IDENTITY(1,1),
	Naziv nvarchar(50) NOT NULL, 
	Adresa nvarchar(50) NOT NULL,
	Grad nvarchar(50)NOT NULL,
	Po�tanskiBroj int NOT NULL,
	Kontakt nvarchar(50) NOT NULL,
	OdgovrnaOsoba nvarchar(50) NOT NULL




)


CREATE TABLE Proizvod(
	ProizvodID INT PRIMARY KEY IDENTITY(1,1),
	Naziv nvarchar(50) NOT NULL,
	Cijena money NOT NULL,
	Masa int,
	Proizvo�a�ID int ,
	stanje int NOT NULL,
	FOREIGN KEY(Proizvo�a�ID) REFERENCES Proizvo�a�(Proizvo�a�ID)

)


CREATE TABLE Dostavlja�(
	Dostavlja�ID INT PRIMARY KEY IDENTITY(1,1),
	Naziv nvarchar(50) NOT NULL,
	Kontak nvarchar(50) NOT NULL,
	OdgovrnaOsoba nvarchar(50) NOT NULL

)
CREATE TABLE Narud�ba(
	Narud�baID INT PRIMARY KEY IDENTITY(1,1),
	DatumNarud�be date NOT NULL,
	DatumIsporuke date NOT NULL,
	Koli�ina int NOT NULL,
	Iznos money NOT NULL,
	Dostavlja�ID int NOT NULL,
	ProizvodID int NOT NULL,
	ZaposlenikID int NOT NULL,
	FOREIGN KEY(Dostavlja�ID) REFERENCES Dostavlja�(Dostavlja�ID),
	FOREIGN KEY(ProizvodID) REFERENCES Proizvod(ProizvodID),
	FOREIGN KEY(ZaposlenikID) REFERENCES Zaposlenik(ZaposlenikID) 
)

	


	


CREATE TABLE Narud�baPovijest(
	Narud�baID int NOT NULL,
	Operacija nvarchar(30),
	VrijemeOperacije date
	FOREIGN KEY(Narud�baID) REFERENCES Narud�ba(Narud�baID)
)
*/


/*
CREATE TRIGGER  Narud�baPovijestINS
ON Narud�ba
FOR INSERT
AS
	INSERT INTO Narud�baPovijest(Narud�baID,Operacija,VrijemeOperacije)
	SELECT Narud�baID,'INSERT',GETDATE() FROM inserted
GO



CREATE TRIGGER  Narud�baPovijestDEL
ON Narud�ba
FOR DELETE
AS
	INSERT INTO Narud�baPovijest(Narud�baID,Operacija,VrijemeOperacije)
	SELECT Narud�baID,'DELETE',GETDATE() FROM deleted
GO


CREATE TRIGGER  Narud�baPovijestUPD
ON Narud�ba
FOR UPDATE
AS
	INSERT INTO Narud�baPovijest(Narud�baID,Operacija,VrijemeOperacije)
	SELECT Narud�baID,'UPDATE',GETDATE() FROM deleted

GO
*/

/*
INSERT INTO Proizvo�a�(Naziv,Adresa,Grad,Po�tanskiBroj,Kontakt,OdgovrnaOsoba)
VALUES('Aluminij','5.Ulica','Zagreb',10000,'+38501258369','Ante Anti�'),
		('�eljezo','12.Ulica','Zagreb',10000,'+38501369147','Ante Ivi�'),
		('Brokva','2.Ulica','Split',21000,'+38501258357','Luka Luki�'),
		('Zrak','123.Ulica','Zagreb',10000,'+38501258159','Luka Anti�'),
		('Zemlja','13.Ulica','Zagreb',10000,'+38501234159','Ivo Ivi�i�'),
		('Lav','Prva Ulica','Split',21000,'+38501128159','Josip Josi�'),
		('Zmija','Zadnja Ulica','Split',21000,'+38501245159','Mile Mili�')

select * from Proizvo�a�

INSERT INTO Proizvod(Naziv,Cijena,Masa,Proizvo�a�ID,stanje)
VALUES	('Drvena oplata',340,200,15,20),
		('Vrata drvena',2300,30,15,30),
		('Vrata Plasti�na',3000,20,15,10),
		('Vre�a',10,1,18,300),
		('Plo�ica',20,2,16,300),
		('Boja �uta',30,5,18,20),
		('Boja Zelena',30,5,18,20),
		('Boja Bijela',30,5,18,20),
		('Boja Siva',30,5,18,30),
		('Boja Crvena',30,5,18,20),
		('Vijak',10,0.05,16,3000),
		('Matica',10,0.05,16,3000),
		('�ajba',10,0.05,16,3000),
		('Brokva',1,0.1,17,5000),
		('Lopta Nogomet',30,0.5,18,10),
		('Lopta Ko�arka',30,0.5,18,10),
		('Lopta rukomet',30,0.5,18,10),
		('Lopta ragbi',30,0.5,18,10),
		('zemlja 1',20,5,19,10),
		('zemlja 2',20,5,19,10),
		('zemlja 3',20,5,19,10),
		('zemlja 4',20,5,19,10),
		('Kameni lav',100,20,20,20),
		('Kameni konj',100,20,20,20),
		('Kameni magarac',100,20,20,20),
		('Kameni spomenik',100,20,20,20)


		select * from Proizvod



insert into Dostavlja�(Naziv,Kontak,OdgovrnaOsoba)
values	('GLS','091920123','Goran Gori�'),
		('Hrvatska Po�ta','01093345','Ivan Ivan�i�')


INSERT INTO Zaposlenik(Ime,Prezime,DatumRo�enja,DatumZaposlenja,Pozicija)
VALUES ('Maro','An�i�','2000-01-01','2020-02-05','Prodava�'),
		('Josip','Domjanovi�','2001-03-04','2021-02-02','Prodava�'),
		('Mario','Mari�','1994-01-01','2019-02-05','Prodava�')


		


INSERT INTO Narud�ba(DatumNarud�be,DatumIsporuke,Koli�ina,Iznos,Dostavlja�ID,ZaposlenikID,ProizvodID)
VALUES	('2023-02-02','2023-02-06',20,100,1,1,15),
		('2023-03-04','2023-02-06',10,130,1,2,16),
		('2023-04-03','2023-02-06',2,10,1,1,12),
		('2023-02-02','2023-02-06',14,20,1,2,13),
		('2023-02-08','2023-02-06',23,400,1,2,10),
		('2023-02-07','2023-02-06',12,102,1,3,19)
		
SELECT * FROM Narud�ba

*/

/*
ALTER PROCEDURE Stanje (@Unos int)
AS 
SELECT * FROM Proizvod 
WHERE Proizvod.stanje>@Unos

GO
*/
/*
EXEC Stanje 20

CREATE PROCEDURE Grad (@Unos nvarchar(30))
AS 
SELECT * FROM Proizvo�a� 
WHERE Proizvo�a�.Grad=@Unos

GO
*/


EXEC Grad 'Zagreb'
/*



CREATE PROCEDURE Iznos (@Unos int)
AS 
SELECT * FROM Narud�ba 
WHERE Narud�ba.Iznos>@Unos

GO



EXEC Iznos 1


CREATE PROCEDURE Pozicija (@Unos nvarchar(30))
AS 
SELECT * FROM Zaposlenik
WHERE Zaposlenik.Pozicija=@Unos
go


EXEC Pozicija 'Prodava�'


CREATE FUNCTION Narud�baStatus (@UnosID int)
	RETURNS  TABLE
	AS
	RETURN (
	
		SELECT Narud�baID,DatumNarud�be,DatumIsporuke,Iznos,D.Naziv
		FROM Narud�ba N INNER JOIN Dostavlja� D ON D.Dostavlja�ID=N.Dostavlja�ID
		WHERE Narud�baID=@UnosID
		)
	GO


SELECT * FROM Narud�baStatus(3)




CREATE FUNCTION Narud�baProizvod (@UnosID int)
	RETURNS  TABLE
	AS
	RETURN (
	
		SELECT Narud�baID,DatumNarud�be,DatumIsporuke,Iznos,P.Naziv
		FROM Narud�ba N INNER JOIN Proizvod P ON P.ProizvodID=N.ProizvodID
		WHERE Narud�baID=@UnosID
		)
	GO



SELECT * FROM Narud�baProizvod(3)



CREATE PROCEDURE Narud�baInsert(@datumN date,@datumI date,@kol int,@iznos money,@dostID int,@proiz int,@zaposelnikId int)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRAN
		BEGIN TRY
			INSERT INTO Narud�ba
				(DatumNarud�be,DatumIsporuke,Koli�ina,Iznos,Dostavlja�ID,ProizvodID,ZaposlenikID)
			VALUES	
				(@datumN,@datumI,@kol,@iznos,@dostID,@proiz,@zaposelnikId)
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
		END CATCH
END



EXEC Narud�baInsert '2022-10-05','2022-10-06',10,20,2,2,3

SELECT * FROM Narud�ba



CREATE PROCEDURE ZaposlenikInsert
	(@Ime nvarchar(50), 
	@Prezime nvarchar(50) ,
	@DatumRo�enja date ,
	@DatumZaposlenja date ,
	@Pozicija nvarchar(50))
AS
 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRAN
		BEGIN TRY
			INSERT INTO Zaposlenik
				(Ime,Prezime,DatumRo�enja,DatumZaposlenja,Pozicija)
			VALUES	
				(@Ime,@Prezime,@DatumRo�enja,@DatumZaposlenja,@Pozicija)
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
		END CATCH
END
*/
--EXEC ZaposlenikInsert 'Maro', 'Ancicc', '2003-01-01', '2022-04-12', 'Sales'

--SELECT * FROM Zaposlenik

