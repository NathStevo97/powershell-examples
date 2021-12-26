# Split - Splits String Value at particular point(s)
$stringValue="Top  51 Window  PowerShell Example"
$arrValue = $stringValue -split ' '
$arrValue

# Join - Joins multiple strings together
$stringValue=("Top "," 51"," Window"," PowerShell"," Example")
$arrValue = -join$stringValue
$arrValue

# Messages - Show a Message Box
$msgBoxInput = [System.Windows.MessageBox]:: Show('Would you like to exit the page','Leave the page or not','YesNoCancel','Error')
switch ($msgBoxInput) {
'Yes' {
Write-Host "You pressed yes"
}
'No' {
Write-Host "You pressed No"
}
'Cancel' {
Write-Host "You pressed cancel"
}
}

# Messages - Write Warning Message and Change Color of Text
Write-Warning "Give a Proper UserName"

Write-Host "Top 51 Window PowerShell Example" -BackgroundColor Red
Write-Host "Top 51 Window PowerShell Example" -ForegroundColor Yellow
Write-Host "Top 51 Window PowerShell Example" -BackgroundColor green
Write-Host "Top 51 Window PowerShell Example" -ForegroundColor Red