-- Create the tables
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(255),
    BirthDate VARCHAR(255)
);

CREATE TABLE Ward (
    WardID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Nurse (
    NurseID INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255)
);

CREATE TABLE Consultant (
    ConsultantID INT PRIMARY KEY,
    Name VARCHAR(255)
);

CREATE TABLE Drug (
    DrugID INT PRIMARY KEY,
    Dosage VARCHAR(255)
);

-- Create junction tables for relationships
CREATE TABLE Drug_prand (
    DrugID INT,
    Prand_name VARCHAR(255),
    PRIMARY KEY (DrugID,Prand_name),
    FOREIGN KEY (DrugID) REFERENCES Drug(DrugID)
);

CREATE TABLE Drug_Patient (
    PatientID INT,
    DrugID INT,
	Date VARCHAR(255),
	Time VARCHAR(255),
	Dose VARCHAR(255),
    PRIMARY KEY (PatientID, DrugID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DrugID) REFERENCES Drug(DrugID)
);

CREATE TABLE Patient_Nurse (
    NurseID INT,
    PatientID INT,
    PRIMARY KEY (NurseID, PatientID),
    FOREIGN KEY (NurseID) REFERENCES Nurse(NurseID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Alter query
-- Patient table
Alter table Patient Add WardID INT;
Alter table Patient Add Constraint fk_ward foreign key (WardID) REFERENCES Ward(WardID);

Alter table Patient Add ConsultantID INT;
Alter table Patient Add Constraint fk_Consultant foreign key (ConsultantID) REFERENCES Consultant(ConsultantID);

-- ward table
Alter table Ward Add NurseID INT;
Alter table Ward Add Constraint fk_Nurse foreign key (NurseID) REFERENCES Nurse(NurseID);

-- Nurse table
Alter table Nurse add WardID INT;
Alter table Nurse Add Constraint fk_ward foreign key (WardID) REFERENCES Ward(WardID);

-- consultant table
Alter table Consultant Add PatientID INT;
Alter table Consultant Add Constraint fk_Patient foreign key (PatientID) REFERENCES Patient(PatientID);
