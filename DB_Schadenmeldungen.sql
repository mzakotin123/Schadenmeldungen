CREATE DATABASE IF NOT EXISTS Schadenmeldungen;
GO

USE Schadenmeldungen;
GO

-- Tabelle für Schadenmeldungen
CREATE TABLE Schadenmeldung (
    SchadenID INT IDENTITY(1,1) PRIMARY KEY,
    Kunde NVARCHAR(100) NOT NULL,
    Fahrzeug NVARCHAR(100) NOT NULL,
    Schadenart NVARCHAR(100) NOT NULL,
    Kosten DECIMAL(10,2) NOT NULL
);


-- DML (data manipulation language): Abfragen zur Datenmanipulation/-bearbeitung (einfügen, löschen, ändern)
-- Beispieldaten einfügen
INSERT INTO Schadenmeldung (Kunde, Fahrzeug, Schadenart, Kosten)
VALUES 
('Max Mustermann', 'VW Golf', 'Frontscheibe', 850.00),
('Erika Beispiel', 'BMW 3er', 'Stoßstange', 1200.00);

-- DQL (data query language): Abfragen zur Suche nach bestimmten Daten, welche dann angezeigt werden sollen

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


