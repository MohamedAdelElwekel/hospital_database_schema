# Hospital/Patient Management Database Schema

This repository contains the SQL schema for a hospital or patient management database. It defines the tables and their relationships necessary for managing core hospital operations related to patients, wards, nurses, consultants, and medications.

## Database Schema Overview

The schema includes the following tables:

* **Patient:** Stores information about patients, including their ID, name, birth date, assigned ward, and consulting physician.
* **Ward:** Contains details about hospital wards, such as their ID and name, and the nurse in charge.
* **Nurse:** Stores information about nursing staff, including their ID, name, address, and assigned ward.
* **Consultant:** Contains information about medical consultants, including their ID and name, and the patient they are currently consulting (note: this implies a one-to-one relationship in the current schema).
* **Drug:** Stores information about different drugs, including their ID and dosage.

## Relationship Tables

The schema also includes junction tables to handle many-to-many relationships:

* **Drug\_prand:** Links drugs to their brand names (one-to-many relationship from Drug to brand names).
* **Drug\_Patient:** Records which drugs are prescribed to which patients, along with the date, time, and dose.
* **Patient\_Nurse:** Defines the relationship between patients and the nurses assigned to them.

## Table Definitions and Relationships

* **Patient Table:**
    * `PatientID` (INT, PRIMARY KEY)
    * `Name` (VARCHAR(255))
    * `BirthDate` (VARCHAR(255))
    * `WardID` (INT, FOREIGN KEY referencing `Ward(WardID)`) - The ward the patient is admitted to.
    * `ConsultantID` (INT, FOREIGN KEY referencing `Consultant(ConsultantID)`) - The consultant assigned to the patient.

* **Ward Table:**
    * `WardID` (INT, PRIMARY KEY)
    * `Name` (VARCHAR(255))
    * `NurseID` (INT, FOREIGN KEY referencing `Nurse(NurseID)`) - The nurse in charge of the ward.

* **Nurse Table:**
    * `NurseID` (INT, PRIMARY KEY)
    * `Name` (VARCHAR(255))
    * `Address` (VARCHAR(255))
    * `WardID` (INT, FOREIGN KEY referencing `Ward(WardID)`) - The ward the nurse is assigned to.

* **Consultant Table:**
    * `ConsultantID` (INT, PRIMARY KEY)
    * `Name` (VARCHAR(255))
    * `PatientID` (INT, FOREIGN KEY referencing `Patient(PatientID)`) - The patient the consultant is currently assigned to.

* **Drug Table:**
    * `DrugID` (INT, PRIMARY KEY)
    * `Dosage` (VARCHAR(255))

* **Drug\_prand Table:**
    * `DrugID` (INT, FOREIGN KEY referencing `Drug(DrugID)`)
    * `Prand\_name` (VARCHAR(255))
    * `PRIMARY KEY (DrugID, Prand\_name)`

* **Drug\_Patient Table:**
    * `PatientID` (INT, FOREIGN KEY referencing `Patient(PatientID)`)
    * `DrugID` (INT, FOREIGN KEY referencing `Drug(DrugID)`)
    * `Date` (VARCHAR(255))
    * `Time` (VARCHAR(255))
    * `Dose` (VARCHAR(255))
    * `PRIMARY KEY (PatientID, DrugID)`

* **Patient\_Nurse Table:**
    * `NurseID` (INT, FOREIGN KEY referencing `Nurse(NurseID)`)
    * `PatientID` (INT, FOREIGN KEY referencing `Patient(PatientID)`)
    * `PRIMARY KEY (NurseID, PatientID)`

## Further Development
This schema provides a basic structure. Future development could include:
* More detailed patient information (e.g., address, contact details, medical history).
* Tables for appointments, medical procedures, billing, etc.
* More robust handling of relationships (e.g., a patient can have multiple consultants over time).
* Normalization improvements.

## Author
Mohamed Adel Elwekel
