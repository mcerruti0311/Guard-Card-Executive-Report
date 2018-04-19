SELECT Id,
  Department,
  Email,
  FirstName,
  LastName,
  Title
FROM Contact
WHERE Employment_Status__c = 'Active'
  AND (
    Email IN (
      'bwhite@sis.us',
      'taugust@sis.us' 
    )
    OR (
      Department = 'SIS Corp Licensing'
      AND Title IN (
        'Administrative Manager',
        'Clerk'
      )
    )
    OR (
      Department Like '%HR%'
      AND Title IN (
        'Administrative Manager',
        'HRIS Analyst',
        'Sr. Manager'
      )
    )

  )
ORDER BY LASTNAME, FIRSTNAME, Email ASC
