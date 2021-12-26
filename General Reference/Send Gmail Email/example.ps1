$From = "xyz@gmail.com"
$To = "abc@gmail.com"
$Cc = "pqr@gmail.com"
$Subject = "Email Subject"
$Body = "Insert body text here"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential (Get-Credential)

# Note:
<# 
-Credential
Specifies a user account that has permission to perform this action. The default is the current user.

Type a user name, such as User01 or Domain01\User01. 
Or, enter a PSCredential object, such as one from the Get-Credential cmdlet. #>