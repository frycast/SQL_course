# MySQL create databases guide 

This is a guide to installing a MySQL server on Windows or Mac, so you can start using MySQL.

This will guide you through **installing the server**, **installing the editor**, and then **creating the databases**.

## Windows

### Windows: installing the server
1. Go to [the 'MySQL installer' download page](https://dev.mysql.com/downloads/installer/).
2. On that page, there are two options. Download the **bottom** one (`mysql-installer-community`).
3. Run the installer that you just downloaded.
4. The 'Choosing a Setup Type' menu appears. Choose 'Custom' and press 'Next'.
5. The 'Select Products' menu appears. There will be a number of products already selected. **Deselect** 'MySQL for Visual Studio'. The rest are fine. Click 'Next'.
6. The 'Installation' overview menu appears. Click 'Execute'. 
7. Wait for installation to complete. Then click 'Next'.
8. The 'Product Configuration' menu appears. Click 'Next'.
9. The 'Type and Networking' menu appears. Click 'Next'.
10. The 'Authentication Method' menu appears. Click 'Next'.
11. The 'Accounts and Roles' menu appears. Choose a secure MySQL Root Password, and write it down. You do not need to create any other user accounts. Click 'Next'.
12. The 'Windows Service' menu appears. Do not change the defaults. Click 'Next'.
13. When the configuration is done, click 'Finish'.
14. Product configuration continues. Take a deep breath. Click 'Next'.
15. The 'Connect To Server' menu appears. Input the root password that you chose in step 11. Click 'check' and then click 'Next'.
16. The 'Apply Configuration' menu appears. Click 'Execute'.
17. When the configuration is done, click 'Finish'.
18. Product configuration continues. Take another deep breath. Click 'Next'.
19. The 'MySQL Router Configuration' menu appears. Click 'Finish'.
20. The 'Product Configuration' menu appears again. Click 'Next'.
21. Installation is complete. Click 'Finish'.

### Windows: installing the editor

The above process also installed MySQL Workbench. This is the MySQL editor we will use.

22. Open MySQL Workbench (e.g., press the 'Windows' key on your keyboard, and type 'MySQL Workbench', then press Enter).
23. Next to the word 'MySQL Connections', there is a plus symbol. Click it to add a new connection.
24. Under 'Connection Name' type 'MyLocal'.
25. Under 'Hostname' type 'localhost'. 
26. Under 'Username' type 'root'.
26. Click 'OK'.
27. The 'MyLocal' connection box has been created. Click on it, then enter the password that you chose in step 11. If you like, you can check the box that says 'Save password in vault'. Click 'OK'.
28. MySQL Workbench is now connected.

### Windows: creating the databases

29. **Right click** [this link to the MySQL database script](https://raw.githubusercontent.com/frycast/SQL_course/master/create-database/MySQL/MySQL-database.sql) and click '**save link as**'. Save the file somewhere you can find it. The filename should be 'MySQL-database.sql'.
30. In MySQL Workbench click 'File >> Open SQL Script' (or press CTRL+SHIFT+O).
31. Find the file 'MySQL-database.sql' and open it. 
32. In MySQL Workbench press the small lightning bolt symbol to run the script (or press CTRL+SHIFT+ENTER).
33. The databases have now been created.

## Mac

### Mac: installing the server

1. Go to [the MySQL download page](https://dev.mysql.com/downloads/mysql/).
2. On that page, there are many options. The two top ones have 'DMG Archive' in the name. If you are on a mac M1 device (these are new mac devices made since 2020), then choose the one that says '(ARM, 64-bit), DMG Archive'. If you are on an older mac (not an M1), then choose the one that says '(x86, 64-bit), DMG Archive'.
3. Mount the DMG. Then a box opens with a pkg file. Run the pkg file.
4. The installation menu begins. Click 'Continue'.
5. The next menu opens. Click 'Install'.
6. The 'Configure MySQL Server' menu appears. Click 'Next'.
7. Enter a password for the MySQL root user, and write it down. Click 'Finish'.
8. When the installation completes, click 'Close'.

### Mac: installing the editor

9. Go to the app store and search for 'SQL Ace'. Install it (free).
10. Once installed, open SQL Ace. A connection menu appears.
11. Under 'host' type 'localhost'.
12. Under 'Password' type the password you chose in step 7.
13. Click 'Connect'. If the connection fails, you may need to restart your mac first.
14. SQL Ace is now connected.

### Mac: creating the databases

15. Control-click [this link to the MySQL database script](https://raw.githubusercontent.com/frycast/SQL_course/master/create-database/MySQL/MySQL-database.sql) and click '**save link as**'. Save the file somewhere you can find it. The filename should be 'MySQL-database.sql'.
16. In SQL Ace click 'File >> Open' (or press Command+O).
17. Find the file 'MySQL-database.sql' and open it.
18. In SQL Ace, find the drop-down arrow next to 'Run Current', and press it. A drop-down menu opens. Press 'Run All Queries' (alternatively, just press Option+Command+R).
