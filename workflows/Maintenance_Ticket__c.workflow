<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Technician</fullName>
        <description>Email Technician</description>
        <protected>false</protected>
        <recipients>
            <field>Technician__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Festival_Emails_solution/Maintenance_Notification_solution</template>
    </alerts>
    <rules>
        <fullName>Alert Technician</fullName>
        <actions>
            <name>Email_Technician</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>New_Maintenance_Ticket</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>Alerts a Technician when a maintenance Ticket is created</description>
        <formula>IF( ISNULL(Technician__r.Email), False, True)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>New_Maintenance_Ticket</fullName>
        <assignedTo>igualadaflors@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Maintenance_Ticket__c.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Maintenance Ticket</subject>
    </tasks>
</Workflow>
