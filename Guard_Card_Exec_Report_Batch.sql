SELECT Id, LastName, FirstName, Title, Department, Email
FROM Contact
WHERE Employment_Status__c = 'Active'
  AND (

          Email = 'taugust@sis.us'

      OR (
        Department = 'SIS Corp Licensing'
        AND (
              Title = 'Administrative Manager'
              OR Title = 'Clerk'
            )
      )
      OR (
          (
            Title = 'Owner/President'
            OR (
                Title = 'Vice President'
                And Email != 'pfilho@sisbrasilseguranca.com.br'
            )
          OR Title = 'Director'
          OR Title = 'Senior Director'
          )

          OR (
            Department Like '%HR%'
            AND (
              Title = 'HRIS Analyst'
              OR Title = 'Administrative Manager'
              OR Title = 'Sr. Manager'
              OR Email = 'bwhite@sis.us'
            )
          )
      )
    )
ORDER BY LASTNAME, FIRSTNAME, Email ASC
