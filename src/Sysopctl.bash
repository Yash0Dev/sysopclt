#!/bin/bash

# sysopctl v0.1.0
VERSION="v0.1.0"

# Help Function
show_help() {
    cat << EOF
sysopctl - System Operations Command v$VERSION

Usage:
  sysopctl --help               Show this help message
  sysopctl --version            Display version information

Basic Commands:
  sysopctl service list         List all active services
  sysopctl system load          Display current system load averages

Intermediate Commands:
  sysopctl service start <name> Start a specified service
  sysopctl service stop <name>  Stop a specified service
  sysopctl disk usage           Show disk usage statistics

Advanced Commands:
  sysopctl process monitor      Monitor real-time system processes
  sysopctl logs analyze         Analyze recent critical log entries
  sysopctl backup <path>        Backup files or directories to a predefined location
EOF
}

# Version Function
show_version() {
    echo "sysopctl version $VERSION"
}

# List Running Services
list_services() {
    systemctl list-units --type=service
}

# Display System Load
show_system_load() {
    uptime
}

# Manage Services
manage_service() {
    local action=$1
    local service_name=$2

    if [[ -z "$service_name" ]]; then
        echo "Error: Service name not provided."
        exit 1
    fi

    case $action in
        start) systemctl start "$service_name" && echo "Service $service_name started." ;;
        stop)  systemctl stop "$service_name" && echo "Service $service_name stopped." ;;
        *)     echo "Invalid action: $action" ;;
    esac
}

# Show Disk Usage
show_disk_usage() {
    df -h
}

# Monitor Processes
monitor_processes() {
    top
}

# Analyze Logs
analyze_logs() {
    journalctl -p 3 --since "1 hour ago"
}

# Backup Files
backup_files() {
    local path=$1
    local backup_dir="/backup"

    if [[ -z "$path" ]]; then
        echo "Error: No path provided for backup."
        exit 1
    fi

    mkdir -p "$backup_dir"
    rsync -av --progress "$path" "$backup_dir"
    echo "Backup completed for $path to $backup_dir."
}

# Main Command Handler
case $1 in
    --help) show_help ;;
    --version) show_version ;;
    service)
        case $2 in
            list) list_services ;;
            start) manage_service start $3 ;;
            stop) manage_service stop $3 ;;
            *) echo "Invalid service command. Use --help for details." ;;
        esac
        ;;
    system)
        case $2 in
            load) show_system_load ;;
            *) echo "Invalid system command. Use --help for details." ;;
        esac
        ;;
    disk)
        case $2 in
            usage) show_disk_usage ;;
            *) echo "Invalid disk command. Use --help for details." ;;
        esac
        ;;
    process)
        case $2 in
            monitor) monitor_processes ;;
            *) echo "Invalid process command. Use --help for details." ;;
        esac
        ;;
    logs)
        case $2 in
            analyze) analyze_logs ;;
            *) echo "Invalid logs command. Use --help for details." ;;
        esac
        ;;
    backup)
        backup_files $2 ;;
    *)
        echo "Unknown command: $1. Use --help for details."
        ;;
esac
