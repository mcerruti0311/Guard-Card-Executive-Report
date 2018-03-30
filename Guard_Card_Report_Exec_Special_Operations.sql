SELECT Name, Employee_Number__c, Title, Employment_Status__c, State_City_From_Ultipro__c, Department, ReportsTo.Name, Last_Hire_Date__c, Division__c, Phone, Email,
  (SELECT Name, License_Number__c, Days_to_Expiration__c,         License_Activity__c,Date_of_Expiration__c, Employee_Email__c
    FROM Licensure__r
    WHERE License_Type__c IN ('Guard Card', 'Guard Card - Armed', 'Guard Card - Unarmed', 'Guard Card Application')
      AND Is_Most_Recent__c = True
      AND Canceled__c = False
  )
FROM Contact
WHERE RecordType.Name = 'SIS Employee'
  AND Division__c = 'Special Operations'
  AND Last_Hire_Date__c != null
  AND Employment_Status__c != 'Terminated'
  AND Employment_Status__c != ''
  AND System_Account__c = False
  AND Position__c != 'Off Duty Officer'
  AND (Not Employee_Number__c Like 'BR%')
  AND ((Position__c = 'Director' or Position__c = 'Vice President')
    OR (((Not Department Like '%PayPal CO, Denver%')
          AND (Not Department Like 'AMPAS Master')
          AND (Not Department Like '%SIS Corp%')
          AND (Not Department Like '%SIS CA HQ Software Solutions')
          AND (Not Department Like '%SIS Administration%'))
          AND ((Not State_City_From_Ultipro__c Like '%Georgia%')
            AND (Not State_City_From_Ultipro__c Like '%Idaho%')
            AND (Not State_City_From_Ultipro__c Like '%Indiana%')
            AND (Not State_City_From_Ultipro__c Like '%Kansas%')
            AND (Not State_City_From_Ultipro__c Like '%Kentucky%')
            AND (Not State_City_From_Ultipro__c Like '%Maine%')
            AND (Not State_City_From_Ultipro__c Like '%Massachusetts%')
            AND (Not State_City_From_Ultipro__c Like '%Michigan%')
            AND (Not State_City_From_Ultipro__c Like '%Mississippi%')
            AND (Not State_City_From_Ultipro__c Like '%Missouri%')
            AND (Not State_City_From_Ultipro__c Like '%Nebraska%')
            AND (Not State_City_From_Ultipro__c Like '%Pennsylvania')
            AND (Not State_City_From_Ultipro__c Like '%Rhode Island%')
            AND (Not State_City_From_Ultipro__c Like '%South Dakota%')
            AND (Not State_City_From_Ultipro__c Like '%West Virginia%')
            AND (Not State_City_From_Ultipro__c Like '%Wyoming%')
          )
        )
    )
ORDER BY Division__c, Department, ReportsTo.LastName, Contact.LastName, Contact.FirstName, Employee_Number__c
