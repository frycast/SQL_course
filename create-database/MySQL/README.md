## macOS — Install **MySQL Community Server**

**MySQL Community Server** is the free, full-featured version of MySQL, perfect for learning and local development.

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

### Step 3. Install MySQL Workbench

MySQL Workbench is a GUI tool to browse tables and run/administer SQL interactively.
You can download it here:
👉 [https://dev.mysql.com/downloads/workbench/](https://dev.mysql.com/downloads/workbench/)
