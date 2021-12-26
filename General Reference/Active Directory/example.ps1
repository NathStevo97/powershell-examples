# Retrieve User Information from Active Directory
Search-ADAccount -PasswordNeverExpires | FT Name,  ObjectClass, UserPrincipalName