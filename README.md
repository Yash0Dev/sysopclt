# sysopclt

# Overview
sysopctl is a custom Bash script designed to manage Linux system resources, services, and health effectively. It provides commands for system monitoring, service management, and backups, simplifying administrative tasks for system administrators.

# Features
- Display system load averages and active services.
- Start/stop services easily.
- Monitor real-time system processes.
- Analyze system logs for critical entries.
- Backup files and directories.
- Disk usage statistics.

# Installation
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   
2. Make the script executable:
   ```bash
   chmod +x sysopctl

4. Move the script to a directory in your PATH:  
   ```bash
   sudo mv sysopctl /usr/local/bin/

6. Verify installation:
   ```bash
   sysopctl --version

# Usage
Here are some examples of how to use sysopctl:  
**Basic Commands:**  
 $ sysopctl --help: Display usage and examples.  
 $ sysopctl --version: Show the current version.  
 $ sysopctl service list: List all active services.  
 $ sysopctl system load: Display system load averages.  
 
**Intermediate Commands:**  
 $ sysopctl service start <name>: Start a specified service.  
 $ sysopctl service stop <name>: Stop a specified service.  
 $ sysopctl disk usage: Display disk usage statistics.  

**Advanced Commands:**  
 $ sysopctl process monitor: Monitor real-time system processes.  
 $ sysopctl logs analyze: Analyze recent critical log entries.  
 $ sysopctl backup <path>: Backup files or directories.  

# Command Examples

- Example 1: Displaying Help  
$ sysopctl --help  ![Screenshot 2024-12-13 153619](https://github.com/user-attachments/assets/da37df55-1155-4311-8763-01ffa6930193)

- Example 2: list of  Services  
$ sysopctl service list    ![Screenshot 2024-12-13 153913](https://github.com/user-attachments/assets/bcd82d33-9431-4347-8ffb-3bd0e7962f55)

- Example 3: Monitoring Processes   
$ sysopctl process monitor etc![Screenshot 2024-12-13 154047](https://github.com/user-attachments/assets/270820b5-1ce9-424d-96db-90610aa923ca)

 



