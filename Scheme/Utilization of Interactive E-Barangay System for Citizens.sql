CREATE TABLE Barangay (
    BarangayID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    Population INT,
    District VARCHAR(50)
);

CREATE TABLE BarangayOfficials (
    OfficialID SERIAL PRIMARY KEY,
    BarangayID INT,
    Name VARCHAR(100),
    Position VARCHAR(100),
    FOREIGN KEY (BarangayID) REFERENCES Barangay(BarangayID)
);

CREATE TABLE Residents (
    ResidentID SERIAL PRIMARY KEY,
    BarangayID INT,
    Name VARCHAR(100),
    Occupation VARCHAR(100),
    FOREIGN KEY (BarangayID) REFERENCES Barangay(BarangayID)
);

CREATE TABLE Services (
    ServiceID SERIAL PRIMARY KEY,
    ServiceName VARCHAR(100)
);

CREATE TABLE BarangayDocuments (
    DocumentID SERIAL PRIMARY KEY,
    DocumentName VARCHAR(100),
    ResidentID INT,
    ServiceID INT,
    FOREIGN KEY (ResidentID) REFERENCES Residents(ResidentID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

INSERT INTO Barangay (BarangayID, Name, Location, Population, District)
VALUES
(1, 'Phase 1 St. Joseph', 'Tambo', 5000, 'North'),
(2, 'Phase 2 St, Joseph', 'Tambo', 7000, 'South'),
(3, 'Phase 3 St, Joseph', 'Tambo', 6000, 'East'),
(4, 'Barangay Marcris', 'Tambo', 8000, 'West'),
(5, 'Sunrise Village', 'Tambo', 5500, 'Central'),
(6, 'Barangay Purok 9', 'Tambo', 7500, 'North'),
(7, 'Barangay Lumang Simbahan', 'Tambo', 9000, 'South'),
(8, 'Barangay Riles', 'Tambo', 6500, 'East'),
(9, 'Barangay Purok 6', 'Tambo', 7800, 'West'),
(10, 'Dizon Village', 'Tambo', 6200, 'Central');

INSERT INTO BarangayOfficials (BarangayID, Name, Position)
VALUES
(1, 'JOEL I KATIGBAK', 'CHAIRMAN'),
(2, 'DIGNA A BAUTISTA', 'HON'),
(3, 'ARTURO L ZARA', 'HON'),
(4, 'GINA G LUNA', 'HON'),
(5, 'APOLLO VICENTE G ORENSE', 'HON'),
(6, 'SANDY S ILUSTRE', 'HON'),
(7, 'ALLAN SADSAD', 'HON'),
(8, 'ANDREE OBILLE', 'SK CHAIRMAN'),
(9, 'ABBY VERONICA SEBASTIAN', 'SK COUNCILOR'),
(10, 'NORIEL SARMIENTO', 'SK COUNCILOR');

-- Inserting the first set of residents
INSERT INTO Residents (BarangayID, Name, Occupation)
VALUES
    (1, 'Shelldon Venteroso', 'College student'),
    (2, 'John Rendell P Pascual', 'Graphic Artist'),
    (3, 'Andrea Dimayuga', 'College student'),
    (4, 'Marlon Tubino', 'Grab driver'),
    (5, 'Joshua Magpantay', 'College student');

-- Inserting the second set of residents
INSERT INTO Residents (BarangayID, Name, Occupation)
VALUES
    (1, 'Phil Crieg Sayas', 'Pharmacist'),
    (2, 'Andrei Emmanuel', 'Accountant'),
    (3, 'Felipe Bataga', 'Real Estate Agent'),
    (4, 'Mikaela Oliver', 'Electrician'),
    (5, 'Marco Bermillo', 'Fitness Trainer');

INSERT INTO BarangayDocuments (DocumentName)
VALUES
    ('Barangay Clearance'),
    ('Barangay Business Clearance'),
    ('Barangay Health Certificate'),
    ('Barangay Indigency Certificate'),
    ('Barangay Residency Certificate'),
    ('Barangay Building Permit'),
    ('Barangay Livelihood Permit'),
    ('Barangay Incident Report'),
    ('Barangay Certificate of Good Moral Character'),
    ('Barangay Property Clearance');

INSERT INTO Services (ServiceName)
VALUES
    ('Regular patrols and crime prevention initiatives.'),
    ('Coordination with local law enforcement agencies.'),
    ('Implementation of barangay-wide security measures.'),
    ('Health clinics and medical missions.'),
    ('Immunization programs.'),
    ('Health education and awareness campaigns.'),
    ('Support for local schools and educational programs.'),
    ('Scholarships and financial aid for deserving students.'),
    ('Adult education and literacy programs.'),
    ('Assistance for indigent families.'),
    ('Programs for senior citizens, persons with disabilities, and other vulnerable groups.'),
    ('Counseling services for family-related issues.'),
    ('Garbage collection and waste management initiatives.'),
    ('Tree planting and environmental awareness campaigns.'),
    ('Clean-up drives and beautification projects.'),
    ('Maintenance of barangay roads, bridges, and public spaces.'),
    ('Street lighting and maintenance.'),
    ('Drainage and flood control programs.'),
    ('Facilitation of small business initiatives.'),
    ('Training and workshops for entrepreneurship.'),
    ('Job placement services.'),
    ('Organization of cultural events, festivals, and celebrations.'),
    ('Sports programs and facilities.'),
    ('Community centers for social gatherings.'),
    ('Conducting drills and training for disaster preparedness.'),
    ('Establishing evacuation plans and centers.'),
    ('Providing relief and assistance during natural disasters.'),
    ('Barangay clearance issuance.'),
    ('Registration of residents and businesses.'),
    ('Keeping records of vital statistics.'),
    ('Mediation and conflict resolution services.'),
    ('Legal advice and assistance.'),
    ('Assistance in filing complaints or reports.'),
    ('Community newsletters or bulletins.'),
    ('Social media platforms for announcements and updates.'),
    ('Hotlines for emergency situations.');

Query
SELECT b.Name AS Barangay, bo.Name AS OfficialName, bo.Position
FROM Barangay b
JOIN BarangayOfficials bo ON b.BarangayID = bo.BarangayID;

SELECT r.Name AS ResidentName, r.Occupation
FROM Residents r
WHERE r.BarangayID = 1; -- You can change the BarangayID as needed

SELECT ServiceName
FROM Services;

SELECT d.DocumentName
FROM BarangayDocuments d
JOIN Residents r ON d.ResidentID = r.ResidentID
WHERE r.BarangayID = 1; -- You can change the BarangayID as needed

SELECT r.Name AS ResidentName, d.DocumentName
FROM Residents r
LEFT JOIN BarangayDocuments d ON r.ResidentID = d.ResidentID;

SELECT * FROM Residents
WHERE BarangayID = 1
ORDER BY Name;

UPDATE Residents
SET Occupation = 'Software Engineer'
WHERE ResidentID = 6;

DELETE FROM Residents
WHERE ResidentID = 3;

INSERT INTO Residents (BarangayID, Name, Occupation)
VALUES (2, 'Elena Gomez', 'Teacher');
