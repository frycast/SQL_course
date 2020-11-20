## SQL Course Database Setup Guide

This guide uses a service provided by [GearHost](https://gearhost.com) (which is free, at the time of writing) as one of many possible means for creating your own server to serve an SQL database, so you can connect to the database and work through the exercises in this course. 

This guide is for the first time you create a GearHost account. If you already have a GearHost account with a database set up then log into GearHost in your browser and click "Databases" on the left hand side menu, then click the the database that you want to access. This will display the login details as described in step 7 below (so jump to step 7).

### Create Account

1. Go to [GearHost.com](https://gearhost.com)
2. Enter desired email and password, click "Create Free Account". Complete the sign up process
3. In the left hand side navigation bar click "Databases"
4. Click "Create Database". Click the MSSQL free option
5. Above the MSSQL free option, choose a unique database name. This will become your username to access the database
6. Scroll down and click "Create Empty Database"
7. Your username and an auto-generated password will be displayed. To reveal the password, click the little eyeball to the right. Your username is the same as the database name you chose in Step 5
8. On the same page, see your database server address. The address will look like den1.mssqlx.gear.host where the 'x' in 'mssqlx' is some number

### Connect SQL Server Management Studio (SSMS)

9. ***Note that SSMS is currently unavailable on mac. Mac users skip to step 11 to install Azure Data Studio instead***. If you plan to use SSMS, then install and open SSMS ([click here for guide](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15)). The SSMS installation will also automatically install [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/what-is-azure-data-studio?view=sql-server-ver15), which I find to be far better than SSMS. You can use Azure Data Studio instead by jumping to step 11 below.
10. Connect with the following parameters:

    ```yaml
    Server Type:     Database Engine
    Server Name:     mssqlx.gear.host   (but replace the 'x' with the correct number from Step 8 above)
    Authentication:  SQL Server Authentication
    Login:           --your user name from step 7 above--    (see Step 7)
    Password:        --your password from step 7 above--  (as revealed in Step 7)
    --- Troubleshooting tip Under "Options" select the box "Trust server certificate" in the "Connection Properties" tab.
    ```

### Connect Azure Data Studio (optional)

You should do this if you're interested in using Azure Data Studio instead of SSMS, or if you are on mac.

11. Install ([click here](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15)) and Open Azure Data Studio
12. Click "Create a connection"
13. Connect with the following parameters:

    ```yaml
    Connection type:     Microsoft SQL Server
    Server:              mssqlx.gear.host   (but replace the 'x' with the correct number from Step 8 above)
    Authentication type: SQL Login
    User name:           --your user name from step 7 above--    (see Step 7)
    Password:            --your password from step 7 above--  (as revealed in Step 7)
    Everything else:     leave as defaults
    ```

### Populate the Database

14. Download the `SQL-Course-Database.sql` script ([right-click here and choose 'save link as'](https://raw.githubusercontent.com/frycast/SQL_course/master/create-database/SQL-Course-Database.sql)) and then click and drag it onto the SSMS or Azure Data Studio window
15. Click "Execute" (little green play symbol) or press F5
16. Observe as your new database is gloriously materialised before your very eyes
