/*
CREATE TABLE Zaposlenik(
	ZaposlenikID INT PRIMARY KEY IDENTITY(1,1) ,
	Ime nvarchar(50) NOT NULL,
	Prezime nvarchar(50) NOT NULL,
	DatumRoðenja date NOT NULL,
	DatumZaposlenja date NOT NULL,
	Pozicija nvarchar(50) NOT NULL
)



CREATE TABLE Proizvoðaè(
	ProizvoðaèID INT PRIMARY KEY  IDENTITY(1,1),
	Naziv nvarchar(50) NOT NULL, 
	Adresa nvarchar(50) NOT NULL,
	Grad nvarchar(50)NOT NULL,
	PoštanskiBroj int NOT NULL,
	Kontakt nvarchar(50) NOT NULL,
	OdgovrnaOsoba nvarchar(50) NOT NULL




)


CREATE TABLE Proizvod(
	ProizvodID INT PRIMARY KEY IDENTITY(1,1),
	Naziv nvarchar(50) NOT NULL,
	Cijena money NOT NULL,
	Masa int,
	ProizvoðaèID int ,
	stanje int NOT NULL,
	FOREIGN KEY(ProizvoðaèID) REFERENCES Proizvoðaè(ProizvoðaèID)

)


CREATE TABLE Dostavljaè(
	DostavljaèID INT PRIMARY KEY IDENTITY(1,1),
	Naziv nvarchar(50) NOT NULL,
	Kontak nvarchar(50) NOT NULL,
	OdgovrnaOsoba nvarchar(50) NOT NULL

)
CREATE TABLE Narudžba(
	NarudžbaID INT PRIMARY KEY IDENTITY(1,1),
	DatumNarudžbe date NOT NULL,
	DatumIsporuke date NOT NULL,
	Kolièina int NOT NULL,
	Iznos money NOT NULL,
	DostavljaèID int NOT NULL,
	ProizvodID int NOT NULL,
	ZaposlenikID int NOT NULL,
	FOREIGN KEY(DostavljaèID) REFERENCES Dostavljaè(DostavljaèID),
	FOREIGN KEY(ProizvodID) REFERENCES Proizvod(ProizvodID),
	FOREIGN KEY(ZaposlenikID) REFERENCES Zaposlenik(ZaposlenikID) 
)

	


	


CREATE TABLE NarudžbaPovijest(
	NarudžbaID int NOT NULL,
	Operacija nvarchar(30),
	VrijemeOperacije date
	FOREIGN KEY(NarudžbaID) REFERENCES Narudžba(NarudžbaID)
)
*/


/*
CREATE TRIGGER  NarudžbaPovijestINS
ON Narudžba
FOR INSERT
AS
	INSERT INTO NarudžbaPovijest(NarudžbaID,Operacija,VrijemeOperacije)
	SELECT NarudžbaID,'INSERT',GETDATE() FROM inserted
GO



CREATE TRIGGER  NarudžbaPovijestDEL
ON Narudžba
FOR DELETE
AS
	INSERT INTO NarudžbaPovijest(NarudžbaID,Operacija,VrijemeOperacije)
	SELECT NarudžbaID,'DELETE',GETDATE() FROM deleted
GO


CREATE TRIGGER  NarudžbaPovijestUPD
ON Narudžba
FOR UPDATE
AS
	INSERT INTO NarudžbaPovijest(NarudžbaID,Operacija,VrijemeOperacije)
	SELECT NarudžbaID,'UPDATE',GETDATE() FROM deleted

GO
*/

/*
INSERT INTO Proizvoðaè(Naziv,Adresa,Grad,PoštanskiBroj,Kontakt,OdgovrnaOsoba)
VALUES('Aluminij','5.Ulica','Zagreb',10000,'+38501258369','Ante Antiæ'),
		('Željezo','12.Ulica','Zagreb',10000,'+38501369147','Ante Iviæ'),
		('Brokva','2.Ulica','Split',21000,'+38501258357','Luka Lukiæ'),
		('Zrak','123.Ulica','Zagreb',10000,'+38501258159','Luka Antiæ'),
		('Zemlja','13.Ulica','Zagreb',10000,'+38501234159','Ivo Ivièiæ'),
		('Lav','Prva Ulica','Split',21000,'+38501128159','Josip Josiæ'),
		('Zmija','Zadnja Ulica','Split',21000,'+38501245159','Mile Miliè')

select * from Proizvoðaè

INSERT INTO Proizvod(Naziv,Cijena,Masa,ProizvoðaèID,stanje)
VALUES	('Drvena oplata',340,200,15,20),
		('Vrata drvena',2300,30,15,30),
		('Vrata Plastièna',3000,20,15,10),
		('Vreæa',10,1,18,300),
		('Ploèica',20,2,16,300),
		('Boja Žuta',30,5,18,20),
		('Boja Zelena',30,5,18,20),
		('Boja Bijela',30,5,18,20),
		('Boja Siva',30,5,18,30),
		('Boja Crvena',30,5,18,20),
		('Vijak',10,0.05,16,3000),
		('Matica',10,0.05,16,3000),
		('Šajba',10,0.05,16,3000),
		('Brokva',1,0.1,17,5000),
		('Lopta Nogomet',30,0.5,18,10),
		('Lopta Košarka',30,0.5,18,10),
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



insert into Dostavljaè(Naziv,Kontak,OdgovrnaOsoba)
values	('GLS','091920123','Goran Goriæ'),
		('Hrvatska Pošta','01093345','Ivan Ivanèiæ')


INSERT INTO Zaposlenik(Ime,Prezime,DatumRoðenja,DatumZaposlenja,Pozicija)
VALUES ('Maro','Anèiæ','2000-01-01','2020-02-05','Prodavaè'),
		('Josip','Domjanoviæ','2001-03-04','2021-02-02','Prodavaè'),
		('Mario','Mariæ','1994-01-01','2019-02-05','Prodavaè')


		


INSERT INTO Narudžba(DatumNarudžbe,DatumIsporuke,Kolièina,Iznos,DostavljaèID,ZaposlenikID,ProizvodID)
VALUES	('2023-02-02','2023-02-06',20,100,1,1,15),
		('2023-03-04','2023-02-06',10,130,1,2,16),
		('2023-04-03','2023-02-06',2,10,1,1,12),
		('2023-02-02','2023-02-06',14,20,1,2,13),
		('2023-02-08','2023-02-06',23,400,1,2,10),
		('2023-02-07','2023-02-06',12,102,1,3,19)
		
SELECT * FROM Narudžba

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
SELECT * FROM Proizvoðaè 
WHERE Proizvoðaè.Grad=@Unos

GO
*/


EXEC Grad 'Zagreb'
/*



CREATE PROCEDURE Iznos (@Unos int)
AS 
SELECT * FROM Narudžba 
WHERE Narudžba.Iznos>@Unos

GO



EXEC Iznos 1


CREATE PROCEDURE Pozicija (@Unos nvarchar(30))
AS 
SELECT * FROM Zaposlenik
WHERE Zaposlenik.Pozicija=@Unos
go


EXEC Pozicija 'Prodavaè'


CREATE FUNCTION NarudžbaStatus (@UnosID int)
	RETURNS  TABLE
	AS
	RETURN (
	
		SELECT NarudžbaID,DatumNarudžbe,DatumIsporuke,Iznos,D.Naziv
		FROM Narudžba N INNER JOIN Dostavljaè D ON D.DostavljaèID=N.DostavljaèID
		WHERE NarudžbaID=@UnosID
		)
	GO


SELECT * FROM NarudžbaStatus(3)




CREATE FUNCTION NarudžbaProizvod (@UnosID int)
	RETURNS  TABLE
	AS
	RETURN (
	
		SELECT NarudžbaID,DatumNarudžbe,DatumIsporuke,Iznos,P.Naziv
		FROM Narudžba N INNER JOIN Proizvod P ON P.ProizvodID=N.ProizvodID
		WHERE NarudžbaID=@UnosID
		)
	GO



SELECT * FROM NarudžbaProizvod(3)



CREATE PROCEDURE NarudžbaInsert(@datumN date,@datumI date,@kol int,@iznos money,@dostID int,@proiz int,@zaposelnikId int)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRAN
		BEGIN TRY
			INSERT INTO Narudžba
				(DatumNarudžbe,DatumIsporuke,Kolièina,Iznos,DostavljaèID,ProizvodID,ZaposlenikID)
			VALUES	
				(@datumN,@datumI,@kol,@iznos,@dostID,@proiz,@zaposelnikId)
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
		END CATCH
END



EXEC NarudžbaInsert '2022-10-05','2022-10-06',10,20,2,2,3

SELECT * FROM Narudžba



CREATE PROCEDURE ZaposlenikInsert
	(@Ime nvarchar(50), 
	@Prezime nvarchar(50) ,
	@DatumRoðenja date ,
	@DatumZaposlenja date ,
	@Pozicija nvarchar(50))
AS
 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRAN
		BEGIN TRY
			INSERT INTO Zaposlenik
				(Ime,Prezime,DatumRoðenja,DatumZaposlenja,Pozicija)
			VALUES	
				(@Ime,@Prezime,@DatumRoðenja,@DatumZaposlenja,@Pozicija)
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
		END CATCH
END
*/
--EXEC ZaposlenikInsert 'Maro', 'Ancicc', '2003-01-01', '2022-04-12', 'Sales'

--SELECT * FROM Zaposlenik

