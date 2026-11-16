
#!/bin/bash
#
# By: Pawan Venugopal
# Date: 16NOV26
# Function: Generate monthly user login/logout report
# Script: Users.sh

# Check administrator privileges
if [ "$(id -u)" -ne 0 ]
then
    echo "Error: Please run this script using sudo."
    exit 1
fi

# Check whether today is the last day of the month
TOMORROW=$(date -d "tomorrow" +%d)

if [ "$TOMORROW" != "01" ] && [ "$1" != "--test" ]
then
    echo "Today is not the last day of the month."
    echo "Use --test to test the report manually."
    exit 0
fi

# Define report directory and filename
LOG_DIR="/home/pawan/IAC/Linux/UserLogs"
MONTH_YEAR=$(date +%B%Y)
MONTH_START=$(date +%Y-%m-01)
REPORT="$LOG_DIR/$MONTH_YEAR.log"

# Create UserLogs directory if it does not exist
if [ ! -d "$LOG_DIR" ]
then
    mkdir -p "$LOG_DIR"

    if [ $? -ne 0 ]
    then
        echo "Error: Could not create UserLogs directory."
        exit 1
    fi
fi

# Set directory ownership and permissions
chown root:root "$LOG_DIR"
chmod 755 "$LOG_DIR"

# Generate the monthly login/logout report
{
    echo "=========================================="
    echo "       MONTHLY USER LOGIN/LOGOUT REPORT"
    echo "=========================================="
    echo "Report Month: $MONTH_YEAR"
    echo "Generated On: $(date '+%d-%m-%Y %H:%M:%S %Z')"
    echo
    echo "USER LOGIN AND LOGOUT HISTORY"
    echo
    last -F -s "$MONTH_START"
} > "$REPORT"

# Check whether the report was generated successfully
if [ $? -eq 0 ]
then
    chown root:root "$REPORT"
    chmod 644 "$REPORT"

    echo "Monthly report generated successfully."
    echo "Report location: $REPORT"
else
    echo "Error: Report generation failed."
    exit 1
fi

exit 0

