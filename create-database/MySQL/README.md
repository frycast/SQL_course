## macOS — Install **MySQL Community Server**

**MySQL Community Server** is the free, full-featured version of MySQL, perfect for learning and local development.

> 🧰 **Before you start:**
> Install **Visual Studio Code (VS Code)** from [https://code.visualstudio.com/](https://code.visualstudio.com/).
> We'll use VS Code to connect to MySQL during the course.

### Step 1. Download and Install MySQL

1. Go to
   👉 [https://dev.mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql/)
2. Under **Select Operating System**, choose **macOS**.
3. Download the latest **macOS DMG Archive** (the default Intel or ARM version depending on your Mac).

   * 💡 *If you’re on an Apple Silicon Mac (M1/M2/M3), choose the ARM64 DMG.*
4. Open the downloaded `.dmg` and follow the installer prompts.

   * Accept defaults unless you have a specific reason to change.
   * During installation, you'll be asked to **set a root password** — note it down safely.
5. When installation finishes, you'll see a message about **System Preferences → MySQL** — you can manage the server from there (start/stop MySQL manually if needed).

### Step 2. Verify Installation

Open **Terminal** and run:

```bash
mysql -u root -p
```

Enter your password when prompted.
If you see a `mysql>` prompt — 🎉 you’re connected!

### Step 3. (Optional) Install MySQL Workbench

MySQL Workbench is a GUI tool to browse tables and run/administer SQL interactively.
You can download it here:
👉 [https://dev.mysql.com/downloads/workbench/](https://dev.mysql.com/downloads/workbench/)

### Step 4. (Optional) Connect MySQL to VS Code

✅ *Optional:*
If you can connect successfully before the course, that's great, as it gives us time to troubleshoot any hiccups!

1. Open **Visual Studio Code**.
2. Install the [**SQLTools**](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools) extension. [Here's a short video](https://www.youtube.com/watch?v=FlyQ9GR1LBM) on how to install extensions in VS Code.

   * This allows VS Code to connect to your databases.
3. Then install the [**SQLTools MySQL/MariaDB Driver**](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools-driver-mysql).
4. In VS Code:

   * Open the **SQLTools** panel → click **Add new connection**.
   * Choose **MySQL/MariaDB**.
   * Use these settings:

     ```
     Server: localhost
     Port: 3306
     User: root
     Password: <your password>
     Database: (leave blank for now)
     ```
   * Test the connection and **Save**.
