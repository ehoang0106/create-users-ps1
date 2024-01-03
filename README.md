# Create Users PowerShell Script

The `CreateUsers.ps1` script is designed for efficient user creation within Azure Active Directory. 
The script automates task creating users account leveraging AzureAD module capabilities.
This tool is ideal for system administrators creating large users bases in Azure AD.

## Prerequisites

- Internet connection.
- PowerShell 5.0 or higher.
- AzureAD module installed.
- An Azure AD administrator account.

## Installation

1. **Install AzureAD Module**: 

```PowerShell
Install-Module AzureAD
```
2. **Set Execution Policy**: To enable script execution, set the policy to by pass. 

```PowerShell
Set-ExecutionPolicy bypass -scope process
```
3. **Run as Adminstator**: Ensure to run PowerShell as an Administrator for proper script execution.

## Configuration

- **Connect to AzureAD**: Before running the script, connect to your Azure AD tenant using:
```PowerShell
Connect-AzureAD
```
- **CSV File Setup**: Prepare a CSV file with user details as per your requirements. The basic csv file should be included 4 columns `GivenName`, `Surname`, `Department`, `JobTitle`. Modify the code if you do not want to include any not required attributes in the CSV file.

## Usage

To run the script, ensure you are running PowerShell as Administrator. Navigate to the script's directory by using:
```PowerShell
Set-Location -path <Script path>
```

Then run the script:

```PowerShell
.\CreateUsers.ps1
```

Ensure the CSV file is correctly configured as the script may depend on it for user data.


