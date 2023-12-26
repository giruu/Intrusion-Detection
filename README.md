# Intrusion Detection and Alert Script

## Technical Overview

This script employs a cron-scheduled Bash shell routine to monitor for potential system intrusions during low-activity periods. Upon detecting suspicious activity, it leverages the Way2SMS SMS API to send real-time alert notifications to designated personnel.

## Dependencies

- `curl` command
- A Messaging API token with sufficient SMS credits

## Usage

1. **Set up credentials:**
   - Edit the script and replace the placeholder values Messaging API creds and Organisational contact numbers.
2. **Make it executable:**
   - `chmod +x intrusion_detection_alert.sh`

## Functionality

1. Clears the screen.
2. Attempts to display the Introxt logo (if the "Logo" subdirectory and "introxt_logo" file exist).
3. Logs in to Way2SMS and retrieves the session cookie and authentication token.
4. Gets the hostname of the current system.
5. Sends an alert message via SMS with the hostname.
6. Displays a success or failure message.

## Important Notes

- **File structure:** Ensure the "Logo" subdirectory and "introxt_logo" file (if applicable) are present in the same directory as the script.
- **User-Agent:** Adjust the User-Agent header if needed for Way2SMS compatibility.
- **Integration:** Consider integrating this script with intrusion detection tools for automatic alerts based on specific events or patterns.
- **Error handling:** Implement robust error handling to avoid unexpected script termination.
- **Security:** Store sensitive credentials in environment variables or a separate secure configuration file instead of hardcoding them in the script.

## Additional Considerations

- **Messaging API limitations:**
   - Be aware of Messagin API usage limits and potential rate limits.
   - Consider alternative SMS providers for more robust or scalable messaging.
- **Security best practices:**
   - Regularly update the script and dependencies to address vulnerabilities.
   - Implement additional security measures, such as multi-factor authentication for Way2SMS.
- **Testing:**
   - Thoroughly test the script in a non-production environment before deployment.

**Technical Features:**

- **Scheduled Execution:** Crontab integration enables automated execution at specified times, enhancing vigilance during off-hours.
- **Intrusion Detection:** While the script itself doesn't actively detect intrusions, it can be triggered by external security tools or logs to initiate the alert process.
- **Messaging API Integration:** Utilizes the Way2SMS API to send SMS notifications, offering a readily available and accessible communication channel.
- **Session & Token Management:** Securely establishes and retrieves session cookies and authentication tokens necessary for API interaction.
- **Hostname Reporting:** Includes the server hostname in the alert message, providing valuable context for investigation.
- **Error Handling:** Implements basic checks to identify and report failed executions or API communication issues.

**Implementation Considerations:**

- **External Intrusion Detection Integration:** Combine this script with dedicated security tools for automated monitoring and triggering.
- **Robust Error Handling:** Enhance error handling and logging functionality for in-depth troubleshooting and incident analysis.
- **Security Best Practices:** Store sensitive credentials securely via environment variables or configuration files, and consider additional security measures like two-factor authentication for Way2SMS.
- **Alternative Messaging Platforms:** Explore alternative SMS providers if scalability or enhanced API features are desired.

**Note:** This script serves as a basic framework for intrusion detection alerts. While it offers a functional starting point, consider integrating it with more sophisticated security tools and adapting it to your specific environment and security needs.

