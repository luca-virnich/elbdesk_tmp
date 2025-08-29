---
sidebar_position: 3
---

# Contact Migration Guide

This guide explains how to migrate contacts from MATS to ElbDesk. The process is split into two parts: person migration and company migration.

## CSV File Requirements

### Required Headers

#### Company Migration Headers
| Header | Description |
|--------|-------------|
| `ID_Account` | Unique identifier for the company |
| `Account` | Company name |
| `Account2` | Additional company name |
| `id_Aramis` | Aramis identifier |
| `ID_Staff` | Staff identifier |
| `ID_AV_verantw` | AV responsible identifier |
| `Standort` | Location |
| `Shipping_Street1` | Shipping address line 1 |
| `Shipping_Street2` | Shipping address line 2 |
| `Shipping_Postal_Code` | Shipping postal code |
| `Shipping_City` | Shipping city |
| `Shipping_Country` | Shipping country |
| `Shipping_State` | Shipping state |
| `Phone1` | Primary phone number |
| `Phone2` | Secondary phone number |
| `Fax` | Fax number |
| `Email` | Email address |
| `Webseite` | Website |

#### Person Migration Headers
| Header | Description |
|--------|-------------|
| `ID_Contact` | Unique identifier for the person |
| `Name_First` | First name |
| `Name_Last` | Last name |
| `Anrede` | Salutation |
| `Titel` | Title |
| `Department` | Department |
| `Position` | Position |
| `Anrede_lang` | Long form salutation |
| `id_account` | Company identifier (used to match with companies) |
| `Primary_Street1` | Primary address line 1 |
| `Primary_Street2` | Primary address line 2 |
| `Primary_Postal_Code` | Primary postal code |
| `Primary_City` | Primary city |
| `Primary_Country` | Primary country |
| `Primary_State` | Primary state |
| `Telefon1` | Primary phone number |
| `Telefon2` | Secondary phone number |
| `Mobil-Telefon` | Mobile phone number |
| `Fax` | Fax number |
| `Email` | Email address |
| `Status` | Status |
| `W_K` | W_K flag |
| `W_WF` | W_WF flag |
| `W_FP` | W_FP flag |
| `contact_infor` | Contact information |

## Migration Process

The migration process is implemented with controllers for client-side logic and handlers managing the server-side business logic. The controllers are called from methods in the respective pages, which handle the local UI state, errors and cancellation.

### Person Migration

1. **Import**
   - Upload CSV file with person data (contact4appahoi)
   - Controller validates headers and normalizes data
   - Imports records in batches of 50 as MatsPersons
   - Handles duplicates by updating existing records
   - Shows progress in real-time with cancellation support

2. **Migration**
   - Handler maps MATS data to ElbDesk format (salutations, languages, countries)
   - Creates or updates contacts in batches of 50
   - Shows progress in real-time with cancellation support

### Company Migration

1. **Import**
   - Upload CSV file with company data (account4appahoi)
   - Controller validates headers and normalizes data
   - Imports entities in batches of 50 as MatsCompany
   - Checks for existing companies by `idAccount`
   - Shows progress in real-time with cancellation support

2. **Migration**
   - Handler maps MATS data to ElbDesk format (countries)
   - Creates or updates contacts in batches of 50
   - Shows progress in real-time with cancellation support

3. **Customer Creation**
   - Creates customer entity for migrated companies
   - Only processes companies without existing customers
   - Shows progress in real-time with cancellation support

4. **Employee Assignment**
   - Links employees to their companies using `id_account`
   - Only processes if both persons and companies are migrated
   - Creates employment relationships in batches
   - Shows progress in real-time with cancellation support
   - A person is only linked to one company
   - A company can have multiple employees 


### Data Flow

1. **Import Flow**:
   ```
   CSV File → Controller.parseCsv() → Controller.import() → Handler.import()
   ```

2. **Migration Flow**:
   ```
   Controller.migrateToContacts() → Handler.migrateToContacts() → Contact Creation
   ```

3. **Customer Creation Flow**:
   ```
   Controller.migrateToCustomers() → Handler.migrateToCustomers() → Customer Creation
   ```

4. **Employee Assignment Flow**:
   ```
   Controller.assignEmployeesToCompanies() → Handler.assignEmployeesToCompanies() → Employee Assignment
   ```

## Important Notes

### Migration Status
- Each Mats entity has an `isMigrated` flag
- Records will only be migrated once (if not updated)
- The isMigrated flag can be checked in the Mats entity tables

:::warning Common Issues

### Import Fails
- Check CSV headers match exactly (A notification should tell you)
:::
