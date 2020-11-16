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

### Connect SQL Server Management Studio

9. Install and open SQL Server Management Studio (SSMS) 18 ([click here for guide](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15)) note that the SSMS installation will also automatically install [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/what-is-azure-data-studio?view=sql-server-ver15), which I find to be far better than SSMS. You can use Azure Data Studio by jumping to step 14 below.

10. Connect with the following parameters:

    ```yaml
    Server Type:     Database Engine
    Server Name:     mssqlx.gear.host   (but replace the 'x' with the correct number from Step 8 above)
    Authentication:  SQL Server Authentication
    Login:           --your user name from step 7 above--    (see Step 7)
    Password:        --your password from step 7 above--  (as revealed in Step 7)
    --- Troubleshooting tip Under "Options" select the box "Trust server certificate" in the "Connection Properties" tab.
    ```

11. Download the `SQL-Course-Database.sql` script ([click here](SQL-Course-Database.sql)) and then click and drag it onto the SSMS window
12. Click "Execute" (little green play symbol) or press F5
13. Observe as your new database is gloriously materialised before your very eyes

### Connect Azure Data Studio (optional)

You should do this if you're interested in using Azure Data Studio instead of SSMS.

14. Open Azure Data Studio

15. Click "Create a connection"

16. Connect with the following parameters:

    ```yaml
    Connection type:     Microsoft SQL Server
    Server:              mssqlx.gear.host   (but replace the 'x' with the correct number from Step 8 above)
    Authentication type: SQL Login
    User name:           --your user name from step 7 above--    (see Step 7)
    Password:            --your password from step 7 above--  (as revealed in Step 7)
    Everything else:     leave as defaults
    ```

17. Download the `SQL-Course-Database.sql` script ([click here](SQL-Course-Database.sql)) and then click and drag it onto the Azure Data Studio window
18. Click "Execute" (little green play symbol) or press F5
19. Observe as your new database is gloriously materialised before your very eyes
