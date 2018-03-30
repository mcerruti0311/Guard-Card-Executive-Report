SELECT Name, Employee_Number__c, Title, Employment_Status__c, State_City_From_Ultipro__c, Department, ReportsTo.Name, Last_Hire_Date__c, Division__c, Phone, Email,
  (SELECT Name, License_Number__c, Days_to_Expiration__c,         License_Activity__c,Date_of_Expiration__c, Employee_Email__c
    FROM Licensure__r
    WHERE License_Type__c IN ('Guard Card', 'Guard Card - Armed', 'Guard Card - Unarmed', 'Guard Card Application')
      AND Is_Most_Recent__c = True
      AND Canceled__c = False
  )
FROM Contact
WHERE RecordType.Name = 'SIS Employee'
  AND Division__c = 'Administration'
  AND Last_Hire_Date__c != null
  AND Employment_Status__c != 'Terminated'
  AND Employment_Status__c != ''
  AND System_Account__c = False
  AND Position__c != 'Off Duty Officer'
  AND (Not Employee_Number__c Like 'BR%')
  AND Department Like '%Training%'
ORDER BY Division__c, Department, ReportsTo.LastName, Contact.LastName, Contact.FirstName, Employee_Number__c
