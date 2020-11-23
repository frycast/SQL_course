This guide installs Azure Data Studio and SQL Server in order to connect to a database locally rather than remotely. 

**If you prefer to create and connect to a remote database server, then [click here for a different guide](README.md).**

* Install and open [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15).
* Click "Deploy a Server".
* Choose "SQL Server on Windows" and click select (in bottom right).
* The SQL Server 2019 Developer Edition download and install will now be initiated.
* Close the SQL Server 2019 window when the installation is complete.
* Open Azure Data Studio, click "Create a Connection" 
* Under Server type "localhost", and click connect
* Download the `SQL-Course-Database.sql` script ([right-click here and choose 'save link as'](https://raw.githubusercontent.com/frycast/SQL_course/master/create-database/SQL-Course-Database.sql)) and then click and drag it onto the SSMS or Azure Data Studio window
* Click "Execute" (little green play symbol) or press F5
* Done!
