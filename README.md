# Telecom_Team_58
This project is a telecom management system designed to manage various aspects of a telecom business, including customer accounts, service plans, payments, and benefits. It consists of two main components:

- Telecom Database: A SQL Server database to store and manage telecom-related data.
- Web Application: An ASP.NET-based web application to interact with the database and provide functionalities for administrators and customers.

---

## Project Overview

### Milestone 1: Database Development
The database (`Telecom_database.sql`) was designed to handle core telecom operations. It includes:
- **Tables**: Customers, accounts, payments, benefits, service plans, technical support tickets, and more.
- **Views**: For retrieving structured data like active accounts, resolved tickets, and wallet details.
- **Stored Procedures & Functions**: For operations such as plan subscriptions, cashback calculations, and account management.

### Milestone 2: Web Application Development
The web application (`Web Application`) connects to the database and provides:
- **Admin Features**:
  - Manage customer accounts and service plans.
  - View technical support tickets, payments, and wallets.
  - Perform advanced operations like updating customer points or removing benefits.
- **Customer Features**:
  - View service plans and manage subscriptions.
  - Track data usage and payments.
  - Redeem vouchers and manage technical support tickets.

---

## Features

### Database Features
- **Stored Procedures**:
  - `createAllTables`: Creates all tables in the database.
  - `clearAllTables`: Clears data from all tables.
  - `Account_Plan`: Lists all accounts with their subscribed service plans.
  - `Initiate_plan_payment`: Processes subscription renewal payments.

- **Views**:
  - `allCustomerAccounts`: Displays all customer profiles with their active accounts.
  - `allResolvedTickets`: Lists resolved technical support tickets.
  - `CustomerWallet`: Shows wallets linked to customer names.

- **Functions**:
  - Validates login credentials.
  - Retrieves data usage for accounts and cashback amounts.

### Web Application Features
- A user-friendly interface for interacting with the database.
- Full navigation within the website without URL changes.
- Detailed error messages for unsuccessful actions.

---

## Installation and Usage

### Prerequisites
- **Database**: SQL Server.
- **Web Application**: ASP.NET (or compatible framework).

### Setup Instructions
1. **Database**:
   - Run the `Telecom_database.sql` file to create and populate the database.
2. **Web Application**:
   - Place the source code of the `Web Application` folder in your development environment.
   - Configure the database connection string in the application settings.

3. **Run**:
   - Open the project in your preferred IDE (e.g., Visual Studio).
   - Set `Main.aspx` as the start page.
   - Start the web application server.
   - Access the application through the provided URL in your browser.

---

## Deliverables

- **SQL File**: `Telecom_database.sql` – Contains all queries, views, stored procedures, and functions.
- **Web Application Code**: Complete source code for the ASP.NET application.
- **Documentation**: Includes project details and team member information.

---

## Acknowledgments

This project was completed as part of the **Databases I course** at the **German University in Cairo, Winter 2024**.
---
