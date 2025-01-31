#!/bin/bash

# system_admin.sh
echo "=== System Administration Script ==="
echo

echo "1. SYSTEM INFORMATION"
echo "===================="
echo "Current Date and Time: $(date)"
echo "Hostname: $(hostname)"
echo "OS Information:"
cat /etc/os-release
echo "System Uptime: $(uptime)"
echo "Current User: $(whoami)"
echo

echo "2. FILE AND DIRECTORY MANAGEMENT"
echo "==============================="
# Create temporary directory
TEMP_DIR="./temp_admin_dir"
echo "Creating temporary directory: $TEMP_DIR"
mkdir -p $TEMP_DIR

# Create and manipulate file
TEST_FILE="$TEMP_DIR/test_file.txt"
echo "Creating test file: $TEST_FILE"
touch "$TEST_FILE"
echo "This is a test file created by system_admin.sh" > "$TEST_FILE"
echo "File contents:"
cat "$TEST_FILE"

# Copy file
COPY_FILE="$TEMP_DIR/test_file_copy.txt"
echo "Copying file to: $COPY_FILE"
cp "$TEST_FILE" "$COPY_FILE"

# Move file
MOVED_FILE="$TEMP_DIR/moved_file.txt"
echo "Moving file to: $MOVED_FILE"
mv "$COPY_FILE" "$MOVED_FILE"

# List files
echo "Directory listing:"
ls -l "$TEMP_DIR"

# Check disk usage
echo "Disk usage of temporary directory:"
du -sh "$TEMP_DIR"

# Change permissions
echo "Changing file permissions:"
chmod 644 "$TEST_FILE"
ls -l "$TEST_FILE"

echo "Finding files in current directory:"
find . -name "test_file.txt"

echo

echo "3. PROCESS MANAGEMENT"
echo "===================="
echo "Current running processes (top 5):"
ps aux | head -n 6

echo "Simulating process signal (just displaying PID):"
echo "Current script PID: $$"

echo

echo "4. USER AND GROUP MANAGEMENT"
echo "==========================="
echo "Groups for current user:"
groups

echo

echo "5. NETWORKING"
echo "============"
echo "Testing network connectivity to google.com:"
ping -c 4 google.com

echo "Network interfaces:"
ip addr

echo "Listening network sockets:"
netstat -lntp 2>/dev/null || echo "Netstat command failed - may need sudo"

echo

echo "6. SYSTEM RESOURCES"
echo "=================="
echo "Disk space usage:"
df -h

echo "Memory usage:"
free -h

# Cleanup
echo
echo "Cleaning up temporary files and directory..."
rm -rf "$TEMP_DIR"

echo
echo "Script completed successfully!"