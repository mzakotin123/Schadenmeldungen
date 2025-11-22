-- Datenbank anlegen (MSSQL-konform)
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Schadenmeldungen')
BEGIN
    CREATE DATABASE Schadenmeldungen; /* CREATE DATABASE IF NOT EXISTS ist die MySQL-Syntax, welche in MSSQL syntaktisch falsch ist */
END
GO

USE Schadenmeldungen;
GO

-- Tabelle für Schadenmeldungen
CREATE TABLE Schadenmeldung (
    SchadenID INT IDENTITY(1,1) PRIMARY KEY,
    Kunde NVARCHAR(100) NOT NULL,
    Fahrzeug NVARCHAR(100) NOT NULL,
    Schadensart NVARCHAR(100) NOT NULL,
    Kosten DECIMAL(10,2) NOT NULL
);
GO

-- ALTER: Spalte hinzufügen (z. B. Datum des Schadens)
ALTER TABLE Schadenmeldung
ADD Datum DATE NULL;
GO

-- Beispieldaten einfügen
INSERT INTO Schadenmeldung (Kunde, Fahrzeug, Schadensart, Kosten, Datum)
VALUES 
('Max Mustermann', 'VW Golf', 'Frontscheibe', 850.00, '2024-11-01'),
('Erika Beispiel', 'BMW 3er', 'Stoßstange', 1200.00, '2024-11-05'),
('Karl Kunde', 'Audi A4', 'Lackschaden', 600.00, '2024-11-10');
GO

-- UPDATE: Kosten für einen Schaden anpassen
UPDATE Schadenmeldung
SET Kosten = 950.00
WHERE Kunde = 'Max Mustermann' AND Fahrzeug = 'VW Golf';
GO

-- DELETE: Einen Schaden löschen
DELETE FROM Schadenmeldung
WHERE Kunde = 'Karl Kunde' AND Fahrzeug = 'Audi A4';
GO

-- DQL-Abfragen

-- Alle Schadenmeldungen anzeigen
SELECT * FROM Schadenmeldung;

-- Nur Schäden über 1000 Euro
SELECT * 
FROM Schadenmeldung
WHERE Kosten > 1000;

-- Durchschnittliche Schadenshöhe
SELECT AVG(Kosten) AS Durchschnittskosten
FROM Schadenmeldung;

-- Anzahl Schäden pro Fahrzeugtyp
SELECT Fahrzeug, COUNT(*) AS Anzahl
FROM Schadenmeldung
GROUP BY Fahrzeug;

-- Teuerster Schaden
SELECT TOP 1 *
FROM Schadenmeldung
ORDER BY Kosten DESC;
