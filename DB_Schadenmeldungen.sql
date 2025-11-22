-- Datenbank anlegen (MSSQL-konform): "CREATE DATABASE IF NOT EXISTS..." ist eine MySQL-Syntax, die in MSSQL ungültig ist.
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Schadenmeldungen')
BEGIN
    CREATE DATABASE Schadenmeldungen;
END
GO

USE Schadenmeldungen;
GO
-- DDL-Abfragen
-- Tabelle Kunden
CREATE TABLE Kunden (
    KundenID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Adresse NVARCHAR(200) NULL,
    Telefon NVARCHAR(50) NULL
);
GO

-- Tabelle Fahrzeuge
CREATE TABLE Fahrzeuge (
    FahrzeugID INT IDENTITY(1,1) PRIMARY KEY,
    Marke NVARCHAR(100) NOT NULL,
    Modell NVARCHAR(100) NOT NULL,
    Kennzeichen NVARCHAR(20) NULL
);
GO

-- DML-Abfragen
-- Tabelle Schadenmeldungen mit Fremdschlüsseln
CREATE TABLE Schadenmeldungen (
    SchadenID INT IDENTITY(1,1) PRIMARY KEY,
    KundenID INT NOT NULL,
    FahrzeugID INT NOT NULL,
    Schadensart NVARCHAR(100) NOT NULL,
    Kosten DECIMAL(10,2) NOT NULL,
    SchadenDatum DATE NULL,
    CONSTRAINT FK_Schadenmeldungen_Kunden FOREIGN KEY (KundenID) REFERENCES Kunden(KundenID),
    CONSTRAINT FK_Schadenmeldungen_Fahrzeuge FOREIGN KEY (FahrzeugID) REFERENCES Fahrzeuge(FahrzeugID)
);
GO


-- Beispieldaten einfügen
INSERT INTO Kunden (Name, Adresse, Telefon)
VALUES 
('Max Mustermann', 'Musterstraße 1, Leipzig', '01234-567890'),
('Erika Beispiel', 'Beispielweg 5, Dresden', '09876-543210');

INSERT INTO Fahrzeuge (Marke, Modell, Kennzeichen)
VALUES 
('VW', 'Golf', 'L-AB123'),
('BMW', '3er', 'DD-XY987');

INSERT INTO Schadenmeldungen (KundenID, FahrzeugID, Schadensart, Kosten, SchadenDatum)
VALUES 
(1, 1, 'Frontscheibe', 850.00, '2024-11-01'),
(2, 2, 'Stoßstange', 1200.00, '2024-11-05');
GO

-- UPDATE: Kosten für einen Schaden anpassen
UPDATE Schadenmeldungen
SET Kosten = 950.00
WHERE SchadenID = 1;
GO

-- DELETE: Einen Schaden löschen
DELETE FROM Schadenmeldungen
WHERE SchadenID = 2;
GO

-- ALTER: Neue Spalte hinzufügen (z. B. Status der Bearbeitung)
ALTER TABLE Schadenmeldungen
ADD Bearbeitungsstatus NVARCHAR(50) NULL;
GO

-- DQL-Abfragen
-- Alle Schadenmeldungen mit Kunden- und Fahrzeugdaten anzeigen
SELECT s.SchadenID, k.Name, f.Marke, f.Modell, s.Schadenart, s.Kosten, s.SchadenDatum
FROM Schadenmeldungen s
JOIN Kunden k ON s.KundenID = k.KundenID
JOIN Fahrzeuge f ON s.FahrzeugID = f.FahrzeugID;

-- Durchschnittliche Schadenshöhe
SELECT AVG(Kosten) AS Durchschnittskosten
FROM Schadenmeldungen;

-- Anzahl Schäden pro Fahrzeugmodell
SELECT f.Modell, COUNT(*) AS Anzahl
FROM Schadenmeldungen s
JOIN Fahrzeuge f ON s.FahrzeugID = f.FahrzeugID
GROUP BY f.Modell;

-- Teuerster Schaden
SELECT TOP 1 s.SchadenID, k.Name, f.Marke, f.Modell, s.Kosten
FROM Schadenmeldungen s
JOIN Kunden k ON s.KundenID = k.KundenID
JOIN Fahrzeuge f ON s.FahrzeugID = f.FahrzeugID
ORDER BY s.Kosten DESC;
