SELECT Id,
  LastName,
  FirstName,
  Title,
  Department,
  Email
FROM Contact
WHERE Employment_Status__c = 'Active'
  AND Title IN (
    'Director',
    'Owner/President',
    'Senior Director',
    'Vice President'
  )
  AND Email != 'pfilho@sisbrasilseguranca.com.br'
ORDER BY LASTNAME, FIRSTNAME, Email ASC
