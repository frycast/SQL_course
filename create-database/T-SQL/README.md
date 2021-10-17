# T-SQL create database guide

This is a guide to installing a T-SQL server on Windows or Mac, so you can start using T-SQL.

This will guide you through **installing the server and editor** and then **creating the databases**. The editor we will use is Azure Data Studio.

## Windows

### Windows: installing the server and editor

1. Navigate to [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio) and download the 'User Installer' for windows.
2. Run the installer, clicking through to accept all the default options.
3. Launch Azure Data Studio and click 'Deploy a Server'.
4. A window opens asking you to select deployment options. Choose 'SQL Server on Windows' and click 'Select'.
5. The deployment prerequisites window opens. Click 'Select'. This will cause SQL Server 2019 Developer Edition to download and begin installing.
6. In the SQL Server installer window, choose installation type 'Basic'.
7. Read and accept the terms and conditions.
8. The install location window opens. Leave the default install location. Click 'install'.
9. Once installation completes, click 'Close'.
10. In Azure Data Studio click 'Create a connection'.
11. The 'Connection Details' panel opens. Under 'Server' type 'localhost'. Click 'Connect'.
12. Azure Data Studio is now connected to your SQL Server.

### Windows: creating the databases

13. **Right click** [this link to the T-SQL database script](https://raw.githubusercontent.com/frycast/SQL_course/master/create-database/T-SQL/T-SQL-database.sql) and click '**save link as**'. Save the file somewhere you can find it. The filename should be 'T-SQL-database.sql'.
14. Find 'T-SQL-database.sql' on your computer and click and drag it into the Azure Data Studio window. 
15. Click the green play button to execute the script, or press F5.
16. The databases have now been created.

## Mac

### Mac: installing the server and editor

1. Navigate to [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio) and download the '.zip file' for macOS.
2. Extract 'Azure Data Studio' (app file) from the zip file. This should happen automatically after your download.
3. Drag 'Azure Data Studio' (app file) to the Applications folder.
4. The remainder of the process involves installing Docker and using it to pull a SQL Server container. Follow [the guide here](https://database.guide/how-to-install-sql-server-on-a-mac/).
5. Once you have connected Azure Data Studio to a local SQL Server 2019 instance, you are done.

### Mac: creating the databases

6. **Control-click** [this link to the T-SQL database script](https://raw.githubusercontent.com/frycast/SQL_course/master/create-database/T-SQL/T-SQL-database.sql) and click '**save link as**'. Save the file somewhere you can find it. The filename should be 'T-SQL-database.sql'.
7. Find 'T-SQL-database.sql' on your computer and click and drag it into the Azure Data Studio window. 
8. Click the green play button to execute the script, or press F5.
9. The databases have now been created.